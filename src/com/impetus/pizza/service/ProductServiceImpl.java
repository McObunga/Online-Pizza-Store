package com.impetus.pizza.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.impetus.pizza.domain.Product;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.persistence.ProductDAO;
 

// TODO: Auto-generated Javadoc
/**
 * The Class ProductServiceImpl.
 */
@Service
public class ProductServiceImpl implements ProductService{

	/** The product dao. */
	@Autowired 
	private ProductDAO productDAO;
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.ProductService#getPizzas()
	 */
	@Override
	@Transactional
	public List<Product> getPizzas() throws ServiceException {
		// TODO Auto-generated method stub
		return productDAO.getPizzas();
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.ProductService#getProductInfo(int)
	 */
	@Override
	@Transactional
	public Product getPizza(Integer id) throws ServiceException {
		// TODO Auto-generated method stub
		return productDAO.getPizza(id);
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.ProductService#addPizza(com.impetus.pizza.domain.Product)
	 */
	@Override
	@Transactional
	public String addPizza(Product product) throws ServiceException {
		// TODO Auto-generated method stub
		productDAO.addPizza(product);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.ProductService#removePizza(java.lang.Integer)
	 */
	@Override
	@Transactional
	public String removePizza(Integer id) throws ServiceException {
		// TODO Auto-generated method stub
		productDAO.removePizza(id);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.ProductService#editPizza(com.impetus.pizza.domain.Product)
	 */
	@Override
	@Transactional
	public String editPizza(Product product) throws ServiceException {
		// TODO Auto-generated method stub
		productDAO.editPizza(product);
		return "success";
	}
	
}
