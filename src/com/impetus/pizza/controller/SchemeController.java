package com.impetus.pizza.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Offer;
import com.impetus.pizza.exception.ApplicationException;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.SchemeService;

// TODO: Auto-generated Javadoc
/**
 * The Class SchemeController.
 */
@Controller
public class SchemeController {

	/** The logger. */
	private Logger logger = Logger.getLogger(Controller.class);
	
	/** The schemeservice. */
	@Autowired
	private SchemeService schemeservice;

	/**
	 * List offer.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/offer")
	public String listOffer(Model model) throws ApplicationException {
		     
			try {
				model.addAttribute("offerlist", schemeservice.listOffer());
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				logger.error(e);
			}
			
		return "offer";
	}

	/**
	 * Delete offer.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/deleteOffer")
	public String deleteOffer(Model model)  throws ApplicationException {
		try {
			model.addAttribute("offerlist", schemeservice.listOffer());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "deleteOffer";
	}
	
	/**
	 * Delete offer.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("offer/delete/{offerId}")
	public String deleteOffer(@PathVariable("offerId") Integer id) throws ApplicationException {
		try {
			schemeservice.removeOffer(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Adds the offer.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/addOffer")
	public String addOffer(Model model) throws ApplicationException {
		Offer offer = new Offer();
		model.addAttribute("addoffer", offer);
		return "addoffer";
	}

	/**
	 * Adds the new offer.
	 *
	 * @param offer the offer
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/addOffer", method = RequestMethod.POST)
	public String addNewOffer(@ModelAttribute("addoffer") Offer offer,
			BindingResult result) throws ApplicationException {
		try {
			schemeservice.addOffer(offer);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * List coupon.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/coupon")
	public String listCoupon(Model model) throws ApplicationException {
		try {
			model.addAttribute("couponlist", schemeservice.listCoupon());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "coupon";
	}

	/**
	 * Delete coupon.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/deleteCoupon")
	public String deleteCoupon(Model model) throws ApplicationException {
		try {
			model.addAttribute("couponlist", schemeservice.listCoupon());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "deletecoupon";
	}
	
	/**
	 * Delete coupon.
	 *
	 * @param couponNo the coupon no
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("coupon/delete/{couponNo}")
	public String deleteCoupon(@PathVariable("couponNo") String couponNo) throws ApplicationException {		 
		try {
			schemeservice.removeCoupon(couponNo);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Adds the coupon.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/addCoupon")
	public String addCoupon(Model model) throws ApplicationException {
		Coupon coupon = new Coupon();
		model.addAttribute("addcoupon", coupon);
		return "addcoupon";
	}

	/**
	 * Adds the new coupon.
	 *
	 * @param coupon the coupon
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/addCoupon", method = RequestMethod.POST)
	public String addNewCoupon(@ModelAttribute("addcoupon") Coupon coupon,
			BindingResult result) throws ApplicationException {
		try {
			schemeservice.addCoupon(coupon);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Showlist offer.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/showoffer")
	public String showlistOffer(Model model) throws ApplicationException {
		try {
			model.addAttribute("offerlist", schemeservice.listOffer());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "showOffer";
	}
}
