package com.impetus.pizza.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Ingredient;
import com.impetus.pizza.domain.Offer;
import com.impetus.pizza.domain.Product;
import com.impetus.pizza.domain.Role;
import com.impetus.pizza.domain.UserOrder;
import com.impetus.pizza.domain.UserRecord;
import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.ApplicationException;
import com.impetus.pizza.exception.DuplicateUserException;
import com.impetus.pizza.exception.PaymentException;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.IngredientService;
import com.impetus.pizza.service.ProductService;
import com.impetus.pizza.service.SchemeService;
import com.impetus.pizza.service.UserinfoService;
import com.impetus.pizza.util.PaymentImpl;
import com.impetus.pizza.validator.UserValidator;

// TODO: Auto-generated Javadoc
/**
 * The Class UserinfoController.
 */
@Controller
public class UserinfoController {

	/** The logger. */
	private Logger logger = Logger.getLogger(UserinfoController.class);

	/** The userinfoservice. */
	@Autowired
	private UserinfoService userinfoservice;

	/** The productservice. */
	@Autowired
	private ProductService productservice;

	/** The ingservice. */
	@Autowired
	private IngredientService ingservice;

	/** The user validator. */
	@Autowired
	private UserValidator userValidator;

	/** The schemservice. */
	@Autowired
	private SchemeService schemservice;

	/**
	 * Show form.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/NewUser")
	public String showForm(Model model) throws ApplicationException {
		List<Product> pizzalist = new ArrayList<Product>();
		try {
			pizzalist = productservice.getPizzas();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("pizzalist", pizzalist);
		Userinfo userinfo = new Userinfo();
		model.addAttribute("user", userinfo);
		return "register";
	}

	// Form action named "register" mapped and ModelAttribute "user" returns the
	// value filled by user
	/**
	 * Register user.
	 *
	 * @param user the user
	 * @param result the result
	 * @param list the list
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 * @throws DuplicateUserException the duplicate user exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("user") Userinfo user,
			BindingResult result, @RequestParam("pizzalist") String[] list,
			Model model) throws ApplicationException, DuplicateUserException {
		userValidator.validate(user, result);

		if (user.getUserPassword() != null && user.getConfirmPassword() != null
				&& (!user.getUserPassword().equals(user.getConfirmPassword()))) {
			result.rejectValue("confirmPassword", "passwordNotMatched");
		}
		if (result.hasErrors()) {
			logger.info("errors" + result.getAllErrors());
			return "register";
		}

		List<Product> selectedPizza = new ArrayList<Product>();
		for (String pizza : list) {
			try {
				selectedPizza.add(productservice.getPizza(Integer
						.parseInt(pizza)));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
			user.setProductlist(selectedPizza);
		}

		try {
			userinfoservice.registerUser(user);
		} catch (ServiceException e) {
			logger.error(e);

			List<Product> pizzalist = new ArrayList<Product>();
			try {
				pizzalist = productservice.getPizzas();
			} catch (ServiceException e1) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
			model.addAttribute("pizzalist", pizzalist);
			result.rejectValue("userName", "user.alreadyExist");
			return "register";
		}
		return "home";
	}

	/**
	 * Register form.
	 *
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping("/addbpo")
	public String registerForm(Model model) {
		Userinfo userinfo = new Userinfo();
		model.addAttribute("user", userinfo);
		return "addbpo";
	}

	/**
	 * Register bpo.
	 *
	 * @param user the user
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/registerbpo", method = RequestMethod.POST)
	public String registerBpo(@ModelAttribute("user") Userinfo user,
			BindingResult result) throws ApplicationException {
		try {
			userinfoservice.registerBpo(user);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}
	
	/**
	 * Show.
	 *
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String show(Model model) {
		Userinfo userinfo = new Userinfo();
		model.addAttribute("user", userinfo);
		return "login";
	}

	/**
	 * Gets the user.
	 *
	 * @param user the user
	 * @param result the result
	 * @param request the request
	 * @return the user
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public String getUser(@ModelAttribute("user") Userinfo user,
			BindingResult result, HttpSession request)
			throws ApplicationException {

		userValidator.validate(user, result);
		Userinfo userdb = new Userinfo();
		try {
			userdb = userinfoservice.getUser(user.getUserName());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		if (userdb != null) {
			
			String roleName = userdb.getRole().getRoleType();
			Role role = new Role();
			role.setRoleType(roleName);
			user.setRole(role);
			int userId = userdb.getUserID();
			user.setUserID(userId);
			request.setAttribute("user", user);

			if (userdb.getUserPassword().equals(user.getUserPassword())) {
				if (roleName.equals("ROLE_ADMIN")) {
					return "loginadmin";
				} else if (roleName.equals("ROLE_BPO")) {
					return "loginbpo";
				} else {
					return "loginuser";
				}
			} else {
				result.rejectValue("userPassword", "passwordNotMatched");
				return "login";
			}
		}
		return "login";
	}

	/**
	 * Showadmin.
	 *
	 * @return the string
	 */
	@RequestMapping("/loginadmin")
	public String showadmin() {
		return "loginadmin";
	}

	/**
	 * Aboutus.
	 *
	 * @return the string
	 */
	@RequestMapping("/aboutus")
	public String aboutus() {
		return "aboutus";
	}

	/**
	 * Showuser.
	 *
	 * @return the string
	 */
	@RequestMapping("/loginuser")
	public String showuser() {
		return "loginuser";
	}

	/**
	 * Showbpo.
	 *
	 * @return the string
	 */
	@RequestMapping("/loginbpo")
	public String showbpo() {
		return "loginbpo";
	}

	/**
	 * Show.
	 *
	 * @param session the session
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping("/logout")
	public String show(HttpSession session, HttpServletRequest request) {
		request.getSession(false);
		session.invalidate();
		return "home";
	}

	/**
	 * Menu.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/menu")
	public String menu(Model model) throws ApplicationException {
		List<Product> list = new ArrayList<Product>();
		try {
			list = productservice.getPizzas();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("list", list);
		return "Menu";

	}

	/**
	 * Order.
	 *
	 * @param model the model
	 * @param session the session
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/order")
	public String order(Model model, HttpSession session)
			throws ApplicationException {
		List<Product> pizzalist = new ArrayList<Product>();
		try {
			pizzalist = productservice.getPizzas();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("pizzalist", pizzalist);
		// session.setAttribute("pizza", pizzalist);

		List<Ingredient> toppinglist = new ArrayList<Ingredient>();
		try {
			toppinglist = ingservice.listTopping();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("toppinglist", toppinglist);
		// session.setAttribute("topping", toppinglist);

		List<Ingredient> crustlist = new ArrayList<Ingredient>();
		try {
			crustlist = ingservice.listCrust();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("crustlist", crustlist);

		UserOrder order = new UserOrder();
		model.addAttribute("order", order);
		model.addAttribute("cartorder", new UserRecord());

		List<Coupon> coupon = new ArrayList<Coupon>();
		try {
			coupon = schemservice.listCoupon();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("couponlist", coupon);

		List<Offer> offer = new ArrayList<Offer>();
		try {
			offer = schemservice.listOffer();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("offerlist", offer);

		return "Order";
	}

	/**
	 * User order.
	 *
	 * @param order the order
	 * @param result the result
	 * @param toppings the toppings
	 * @param crust the crust
	 * @param request the request
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String userOrder(@ModelAttribute("order") UserOrder order,
			BindingResult result, @RequestParam("toppings") String[] toppings,
			@RequestParam("crust") String crust, HttpSession request,
			Model model) throws ApplicationException {
		int total;
		Product product = new Product();
		try {
			product = productservice
					.getPizza(order.getProduct().getProductID());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		order.setProduct(product);

		List<Ingredient> addlist = new ArrayList<Ingredient>();
		for (String topping : toppings) {
			try {
				addlist.add(ingservice.getTopping(Integer.parseInt(topping)));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
		}
		try {
			addlist.add(ingservice.getCrust(Integer.parseInt(crust)));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		order.setAddon(addlist);

		@SuppressWarnings("unused")
		Userinfo user = (Userinfo) request.getAttribute("user");
		List<UserOrder> cartlist = (List<UserOrder>) request
				.getAttribute("cartlist");
		if (cartlist == null) {
			cartlist = new ArrayList<UserOrder>();
			request.setAttribute("cartlist", cartlist);
		}
		addPizzaTocartlist(order, addlist, cartlist);
		total = calculateTotal(cartlist);
		model.addAttribute("cartlist", cartlist);
		request.setAttribute("cartlist", cartlist);
		model.addAttribute("total", total);
		request.setAttribute("total", total);

		return "cart";
	}

	/**
	 * Adds the pizza tocartlist.
	 *
	 * @param order the order
	 * @param extra the extra
	 * @param cartlist the cartlist
	 */
	private void addPizzaTocartlist(UserOrder order, List<Ingredient> extra,
			List<UserOrder> cartlist) {
		UserOrder items = new UserOrder();
		items.setAddon(extra);
		items.setProduct(order.getProduct());
		items.setQuantity(order.getQuantity());
		items.setPrice(order.getPrice());
		items.setSize(order.getSize());
		cartlist.add(items);
	}

	/**
	 * Calculate total.
	 *
	 * @param cartlist the cartlist
	 * @return the int
	 */
	private int calculateTotal(List<UserOrder> cartlist) {
		int total = 0;
		for (int c = 0; c < cartlist.size(); c++) {
			total += cartlist.get(c).getPrice();
		}
		return total;
	}

	/**
	 * Order quantity.
	 *
	 * @param cartlist the cartlist
	 * @return the int
	 */
	@SuppressWarnings("unused")
	private int orderQuantity(List<UserOrder> cartlist) {
		int total = 0;
		for (int i = 0; i < cartlist.size(); i++) {
			total += cartlist.get(i).getQuantity();
		}
		return total;
	}

	/**
	 * Proceed order.
	 *
	 * @param order the order
	 * @param result the result
	 * @param request the request
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/cart")
	private String proceedOrder(@ModelAttribute("cartorder") UserRecord order,
			BindingResult result, HttpSession request, Model model)
			throws ApplicationException {
		request.setAttribute("order", order);
		model.addAttribute("userrecord", order);
		Userinfo user = (Userinfo)request.getAttribute("user");
		System.out.println(user.getRole().getRoleType());
		if(user.getRole().getRoleType().equals("ROLE_BPO")) {
			return "loginbpo";
		}
		return "OrderFinal";
	}

	/**
	 * Removes the pizza.
	 *
	 * @param status the status
	 * @param request the request
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping("cart/remove/{status}")
	private String removePizza(@PathVariable("status") int status,
			HttpSession request, Model model) throws ApplicationException {
		int total;
		@SuppressWarnings("unchecked")
		List<UserOrder> cartlist = (List<UserOrder>) request
				.getAttribute("cartlist");
		cartlist.remove(status - 1);
		request.setAttribute("cartlist", cartlist);
		total = calculateTotal(cartlist);
		model.addAttribute("total", total);
		request.setAttribute("total", total);
		return "redirect:/order";
	}

	/**
	 * Payment.
	 *
	 * @param record the record
	 * @param result the result
	 * @param cvv the cvv
	 * @param request the request
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 * @throws PaymentException 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(@ModelAttribute("userrecord") UserRecord record,
			BindingResult result, @RequestParam("cvv") int cvv,
			HttpSession request, Model model) throws ApplicationException, PaymentException {

		String status = "";
		PaymentImpl payment = new PaymentImpl();
	    
		try {
			status = payment.makePayment(cvv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 throw new PaymentException();
		}

		UserRecord ur = (UserRecord) request.getAttribute("order");
		record.setAmount(ur.getAmount());
		record.setDiscount(ur.getDiscount());
		record.setGrandTotal(ur.getGrandTotal());

		request.setAttribute("order", record);

		Userinfo user = (Userinfo) request.getAttribute("user");
		model.addAttribute("user", user);
		List<UserOrder> cartlist = (List<UserOrder>) request
				.getAttribute("cartlist");

		for (int i = 0; i < cartlist.size(); i++) {
			cartlist.get(i).setUserrecord(record);
		}

		if (status.equals("Transaction was done successfully!")) {
			UserRecord place = formOrder(record, user, cartlist);
			try {
				userinfoservice.saveOrder(place);
				request.removeAttribute("cartlist");
				request.removeAttribute("total");
				request.removeAttribute("order");
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				throw new ApplicationException();
			}
			return "success";
		}
		return "unsuccess";
	}

	/**
	 * Form order.
	 *
	 * @param record the record
	 * @param user the user
	 * @param cartlist the cartlist
	 * @return the user record
	 */
	public UserRecord formOrder(UserRecord record, Userinfo user,
			List<UserOrder> cartlist) {

		logger.info("in FormOrder method");
		record.setOrderDate(new Date());
		record.setUserinfo(user);
		record.setOrderlist(cartlist);
		return record;
	}

	/**
	 * Gets the history.
	 *
	 * @param request the request
	 * @param model the model
	 * @return the history
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/history")
	public String getHistory(HttpSession request, Model model)
			throws ApplicationException {
		Userinfo getuser = (Userinfo) request.getAttribute("user");
		int userid = getuser.getUserID();
		try {
			List<UserRecord> userrecord = (List<UserRecord>) userinfoservice
					.history(userid);
			model.addAttribute("userrecord", userrecord);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "history";
	}
	
	/**
	 * Userhistory.
	 *
	 * @param request the request
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping("/userhistory")
	public String userhistory(Model model, HttpSession request) {
		Userinfo user = (Userinfo) request.getAttribute("user");
		model.addAttribute("user", user);
		return "userhistory";
	}
	
	/**
	 * Search history.
	 *
	 * @param user the user
	 * @param result the result
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String searchHistory(@ModelAttribute("user") Userinfo user, BindingResult result, Model model) throws ApplicationException {
		String userName = user.getUserName();
		try {
			Userinfo u = userinfoservice.getUser(userName);
			Integer id = u.getUserID();
			List<UserRecord> record = (List<UserRecord>) userinfoservice.history(id);
			model.addAttribute("record", record);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "searchorder";
	}
	
	/*
	 * @RequestMapping(value = "/Offer", method = RequestMethod.GET) public
	 * String applyOffer(Model model, HttpServletRequest request) { HttpSession
	 * session = request.getSession(); List<OrderDetails> cart =
	 * (List<OrderDetails>) session.getAttribute("cart"); List<Offer> offerList
	 * = offerService.listOffer(); model.addAttribute("offerList", offerList);
	 * model.addAttribute("total", calculateTotal(cart, session)); return
	 * "applyOffer"; }
	 */

}
