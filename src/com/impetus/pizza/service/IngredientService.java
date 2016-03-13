package com.impetus.pizza.service;

import java.util.List;

import com.impetus.pizza.domain.Ingredient;
import com.impetus.pizza.exception.ServiceException;

// TODO: Auto-generated Javadoc
/**
 * The Interface IngredientService.
 */
public interface IngredientService {

	/**
	 * Adds the topping.
	 *
	 * @param ingredient the ingredient
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String addTopping(Ingredient ingredient) throws ServiceException;
	
	/**
	 * List topping.
	 *
	 * @return the list
	 * @throws ServiceException the service exception
	 */
	List<Ingredient> listTopping() throws ServiceException;
	
	/**
	 * Removes the topping.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String removeTopping(Integer id) throws ServiceException;
	
	/**
	 * Gets the topping.
	 *
	 * @param id the id
	 * @return the topping
	 * @throws ServiceException the service exception
	 */
	Ingredient getTopping(Integer id) throws ServiceException;
	
	/**
	 * Edits the topping.
	 *
	 * @param ingredient the ingredient
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String editTopping(Ingredient ingredient) throws ServiceException;
	
	/**
	 * Adds the crust.
	 *
	 * @param ingredient the ingredient
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String addCrust(Ingredient ingredient) throws ServiceException;
	
	/**
	 * List crust.
	 *
	 * @return the list
	 * @throws ServiceException the service exception
	 */
	List<Ingredient> listCrust() throws ServiceException;
	
	/**
	 * Removes the crust.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String removeCrust(Integer id) throws ServiceException;
	
	/**
	 * Gets the crust.
	 *
	 * @param id the id
	 * @return the crust
	 * @throws ServiceException the service exception
	 */
	Ingredient getCrust(Integer id) throws ServiceException;
	
	/**
	 * Edits the crust.
	 *
	 * @param ingredient the ingredient
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String editCrust(Ingredient ingredient) throws ServiceException;
	
}
