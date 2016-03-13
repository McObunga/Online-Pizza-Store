package com.impetus.pizza.persistence;

import java.util.List;

 
import com.impetus.pizza.domain.Product;

// TODO: Auto-generated Javadoc
/**
 * The Interface ProductDAO.
 */
public interface ProductDAO {

	/**
	 * Gets the pizzas.
	 *
	 * @return the pizzas
	 */
	List<Product> getPizzas();
		    
    /**
     * Gets the pizza.
     *
     * @param id the id
     * @return the pizza
     */
    Product getPizza(Integer id);
    
    /**
     * Adds the pizza.
     *
     * @param product the product
     * @return the string
     */
    String addPizza(Product product);
    
    /**
     * Removes the pizza.
     *
     * @param id the id
     * @return the string
     */
    String removePizza(Integer id);
    
    /**
     * Edits the pizza.
     *
     * @param product the product
     * @return the string
     */
    String editPizza(Product product);
    
}
