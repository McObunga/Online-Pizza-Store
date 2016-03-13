package com.impetus.pizza.service;

import java.util.List;

import com.impetus.pizza.domain.Product;
import com.impetus.pizza.exception.ServiceException;

// TODO: Auto-generated Javadoc
/**
 * The Interface ProductService.
 */
public interface ProductService {

	/**
	 * Gets the pizzas.
	 *
	 * @return the pizzas
	 * @throws ServiceException the service exception
	 */
	List<Product> getPizzas() throws ServiceException;
		
	/**
	 * Gets the pizza.
	 *
	 * @param id the id
	 * @return the pizza
	 * @throws ServiceException the service exception
	 */
	Product getPizza(Integer id) throws ServiceException;
	
	/**
	 * Adds the pizza.
	 *
	 * @param product the product
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String addPizza(Product product) throws ServiceException;
    
    /**
     * Removes the pizza.
     *
     * @param id the id
     * @return the string
     * @throws ServiceException the service exception
     */
    String removePizza(Integer id) throws ServiceException;
    
    /**
     * Edits the pizza.
     *
     * @param product the product
     * @return the string
     * @throws ServiceException the service exception
     */
    String editPizza(Product product) throws ServiceException;	
}
