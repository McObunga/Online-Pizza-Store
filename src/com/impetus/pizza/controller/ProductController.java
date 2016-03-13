package com.impetus.pizza.controller;
 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.impetus.pizza.domain.Ingredient;
import com.impetus.pizza.domain.Product;
import com.impetus.pizza.exception.ApplicationException;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.IngredientService;
import com.impetus.pizza.service.ProductService;

// TODO: Auto-generated Javadoc
/**
 * The Class ProductController.
 */
@Controller
public class ProductController {

	/** The logger. */
	private Logger logger = Logger.getLogger(Controller.class);
	
	/** The productservice. */
	@Autowired
	private ProductService productservice;

	/** The ingredientservice. */
	@Autowired
	private IngredientService ingredientservice;

	/**
	 * List pizza.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/pizza")
	public String listPizza(Model model) throws ApplicationException{
		try {
			model.addAttribute("pizzaList", productservice.getPizzas());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			 logger.error(e);
		}
		return "pizza";
	}

	/**
	 * Adds the pizza form.
	 *
	 * @param model the model
	 * @param request the request
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/addNewPizza")
	public String addPizzaForm(Model model, HttpServletRequest request) throws ApplicationException{
		Product product = new Product();
		List<Ingredient> toppingList = new ArrayList<Ingredient>();
		try {
			toppingList = ingredientservice.listTopping();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("addNewPizza", product);
		model.addAttribute("toppingList", toppingList);
		return "addPizza";
	}

	/**
	 * Adds the new pizza.
	 *
	 * @param product the product
	 * @param ingredientlist the ingredientlist
	 * @param request the request
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/addNewPizza", method = RequestMethod.POST)
	public String addNewPizza(@ModelAttribute("addNewPizza") Product product,
			@RequestParam("toppingList") String[] ingredientlist,
			HttpServletRequest request) throws ApplicationException {
		String filepath = "resources/images/pizza_images/";
		if (product.getFileData() != null) {
			product.setImage(filepath
					+ product.getFileData().getOriginalFilename());
		}
		List<Ingredient> selectedTopping = new ArrayList<Ingredient>();
		for (String topping : ingredientlist) {
			try {
				selectedTopping.add(ingredientservice.getTopping(Integer
						.parseInt(topping)));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
			product.setIngredientlist(selectedTopping);
		}
		try {
			productservice.addPizza(product);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Edits the pizza.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/editPizza")
	public String editPizza(Model model) throws ApplicationException {
		try {
			model.addAttribute("pizzaList", productservice.getPizzas());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "editPizza";
	}

	/**
	 * Gets the pizza.
	 *
	 * @param id the id
	 * @param model the model
	 * @param request the request
	 * @return the pizza
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("pizza/edit/{productID}")
	public String getpizza(@PathVariable("productID") Integer id, Model model,
			HttpServletRequest request) throws ApplicationException {
		List<Ingredient> toppingList = new ArrayList<Ingredient>();
		try {
			toppingList = ingredientservice.listTopping();
		} catch (ServiceException e1) {
			// TODO Auto-generated catch block
			logger.error(e1);
		}
		request.setAttribute("toppingList", toppingList);
		Product product = new Product();
		try {
			product = productservice.getPizza(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		
		List<Ingredient> existingT = product.getIngredientlist();
		String[] iterate = new String[existingT.size()];
		int i;
		for(i = 0; i < existingT.size(); i++) {
			iterate[i]= existingT.get(i).getIngredientID() + "";
		}	
		product.setToppingList(iterate);
		model.addAttribute("editPizza", product);
		return "editPizzaForm";
	}

	/**
	 * Edits the pizza.
	 *
	 * @param product the product
	 * @param result the result
	 * @param ingredientlist the ingredientlist
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "pizza/edit/{productID}", method = RequestMethod.POST)
	public String editPizza(@ModelAttribute("editPizza") Product product,
			BindingResult result, @RequestParam("toppingList") String[] ingredientlist) throws ApplicationException{
		String filepath = "resources/images/pizza_images/";
		if (product.getFileData() != null) {
			product.setImage(filepath
					+ product.getFileData().getOriginalFilename());
		}
		List<Ingredient> selectedTopping = new ArrayList<Ingredient>();
		for (String topping : ingredientlist) {
			try {
				selectedTopping.add(ingredientservice.getTopping(Integer
						.parseInt(topping)));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
			product.setIngredientlist(selectedTopping);
		}
		try {
			productservice.editPizza(product);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}
	
	/**
	 * Delete pizza.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/deletePizza")
	public String deletePizza(Model model) throws ApplicationException{
		try {
			model.addAttribute("pizzaList", productservice.getPizzas());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "deletePizza";
	}
	
	/**
	 * Delete pizza.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("pizza/delete/{productID}")
	public String deletePizza(@PathVariable("productID") Integer id) throws ApplicationException{
		try {
			productservice.removePizza(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}
}
