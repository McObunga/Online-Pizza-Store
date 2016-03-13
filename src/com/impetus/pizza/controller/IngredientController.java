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

import com.impetus.pizza.domain.Ingredient;
import com.impetus.pizza.exception.ApplicationException;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.IngredientService;

// TODO: Auto-generated Javadoc
/**
 * The Class IngredientController.
 */
@Controller
public class IngredientController {

	/** The logger. */
	private Logger logger = Logger.getLogger(Controller.class);

	/** The ingredientservice. */
	@Autowired
	private IngredientService ingredientservice;

	/**
	 * Show.
	 *
	 * @return the string
	 */
	@RequestMapping("/manage")
	public String show() {
		return "manage";
	}

	/**
	 * List topping.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/topping")
	public String listTopping(Model model) throws ApplicationException{
		try {
			model.addAttribute("toppingList", ingredientservice.listTopping());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "topping";
	}

	/**
	 * Edits the topping.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/editTopping")
	public String editTopping(Model model) throws ApplicationException{
		try {
			model.addAttribute("toppingList", ingredientservice.listTopping());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "editTopping";
	}

	/**
	 * Delete topping.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/deleteTopping")
	public String deleteTopping(Model model) throws ApplicationException{
		try {
			model.addAttribute("toppingList", ingredientservice.listTopping());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "deleteTopping";
	}

	/**
	 * Adds the topping.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/addToppingForm")
	public String addTopping(Model model) throws ApplicationException{
		Ingredient ingredient = new Ingredient();
		model.addAttribute("addNewTopping", ingredient);
		return "addTopping";
	}

	/**
	 * Adds the new topping.
	 *
	 * @param ingredient the ingredient
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/addToppingForm", method = RequestMethod.POST)
	public String addNewTopping(
			@ModelAttribute("addNewToppping") Ingredient ingredient,
			BindingResult result) throws ApplicationException{
		try {
			ingredientservice.addTopping(ingredient);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Delete topping.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("topping/delete/{ingredientID}")
	public String deleteTopping(@PathVariable("ingredientID") Integer id) throws ApplicationException{
		try {
			ingredientservice.removeTopping(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Gets the topping.
	 *
	 * @param id the id
	 * @param model the model
	 * @return the topping
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("topping/edit/{ingredientID}")
	public String getTopping(@PathVariable("ingredientID") Integer id,
			Model model) throws ApplicationException{
		Ingredient ingredient = new Ingredient();
		try {
			ingredient = ingredientservice.getTopping(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("editTopping", ingredient);
		return "editToppingForm";
	}

	/**
	 * Edits the topping.
	 *
	 * @param ingredient the ingredient
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "topping/edit/{ingredientID}", method = RequestMethod.POST)
	public String editTopping(
			@ModelAttribute("editTopping") Ingredient ingredient,
			BindingResult result) throws ApplicationException{
		try {
			ingredientservice.editTopping(ingredient);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * List crust.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/crust")
	public String listCrust(Model model) throws ApplicationException{
		try {
			model.addAttribute("crustList", ingredientservice.listCrust());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "crust";
	}
	
	/**
	 * Edits the crust.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/editCrust")
	public String editCrust(Model model) throws ApplicationException{
		try {
			model.addAttribute("crustList", ingredientservice.listCrust());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "editCrust";
	}

	/**
	 * Delete crust.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/deleteCrust")
	public String deleteCrust(Model model) throws ApplicationException{
		try {
			model.addAttribute("crustList", ingredientservice.listCrust());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "deleteCrust";
	}
	
	/**
	 * Adds the crust.
	 *
	 * @param model the model
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("/addCrustForm")
	public String addCrust(Model model) throws ApplicationException{
		Ingredient ingredient = new Ingredient();
		model.addAttribute("addNewCrust", ingredient);
		return "addCrust";
	}
	
	/**
	 * Adds the new crust.
	 *
	 * @param ingredient the ingredient
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "/addCrustForm", method = RequestMethod.POST)
	public String addNewCrust(
			@ModelAttribute("addNewCrust") Ingredient ingredient,
			BindingResult result) throws ApplicationException{
		try {
			ingredientservice.addCrust(ingredient);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}
	
	/**
	 * Delete crust.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("crust/delete/{ingredientID}")
	public String deleteCrust(@PathVariable("ingredientID") Integer id) throws ApplicationException{
		try {
			ingredientservice.removeCrust(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

	/**
	 * Gets the crust.
	 *
	 * @param id the id
	 * @param model the model
	 * @return the crust
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping("crust/edit/{ingredientID}")
	public String getCrust(@PathVariable("ingredientID") Integer id,
			Model model) throws ApplicationException{
		Ingredient ingredient = new Ingredient();
		try {
			ingredient = ingredientservice.getCrust(id);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		model.addAttribute("editCrust", ingredient);
		return "editCrustForm";
	}
	
	/**
	 * Edits the crust.
	 *
	 * @param ingredient the ingredient
	 * @param result the result
	 * @return the string
	 * @throws ApplicationException the application exception
	 */
	@RequestMapping(value = "crust/edit/{ingredientID}", method = RequestMethod.POST)
	public String editCrust(
			@ModelAttribute("editCrust") Ingredient ingredient,
			BindingResult result) throws ApplicationException{
		try {
			ingredientservice.editCrust(ingredient);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			logger.error(e);
		}
		return "redirect:/manage";
	}

}
