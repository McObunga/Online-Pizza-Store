package com.impetus.pizza.persistence;

import java.util.List;

import com.impetus.pizza.domain.Ingredient;

// TODO: Auto-generated Javadoc
/**
 * The Interface IngredientDAO.
 */
public interface IngredientDAO {

	/**
	 * Adds the topping.
	 *
	 * @param ingredient the ingredient
	 * @return the string
	 */
	String addTopping(Ingredient ingredient);
	
	/**
	 * List topping.
	 *
	 * @return the list
	 */
	List<Ingredient> listTopping();
    
    /**
     * Removes the topping.
     *
     * @param id the id
     * @return the string
     */
    String removeTopping(Integer id);
    
    /**
     * Gets the topping.
     *
     * @param id the id
     * @return the topping
     */
    Ingredient getTopping(Integer id);
    
    /**
     * Edits the topping.
     *
     * @param ingredient the ingredient
     * @return the string
     */
    String editTopping(Ingredient ingredient);
    
    /**
     * Adds the crust.
     *
     * @param ingredient the ingredient
     * @return the string
     */
    String addCrust(Ingredient ingredient);
    
    /**
     * List crust.
     *
     * @return the list
     */
    List<Ingredient> listCrust();
    
    /**
     * Removes the crust.
     *
     * @param id the id
     * @return the string
     */
    String removeCrust(Integer id);
    
    /**
     * Gets the crust.
     *
     * @param id the id
     * @return the crust
     */
    Ingredient getCrust(Integer id);
    
    /**
     * Edits the crust.
     *
     * @param ingredient the ingredient
     * @return the string
     */
    String editCrust(Ingredient ingredient);
    
    
}
