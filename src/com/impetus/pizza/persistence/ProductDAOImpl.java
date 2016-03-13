package com.impetus.pizza.persistence;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.JDBCException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;

import com.impetus.pizza.domain.Category;
import com.impetus.pizza.domain.Product;
 

// TODO: Auto-generated Javadoc
/**
 * The Class ProductDAOImpl.
 */
@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{

	/** The logger. */
	private Logger logger = Logger.getLogger("persistence");
	
	/** The session factory. */
	@Autowired
	private SessionFactory sessionFactory;
	
	/** The session. */
	private Session session = null;
		
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.ProductDAO#getPizzas()
	 */
	@Override
	public List<Product> getPizzas() {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Product");		
			@SuppressWarnings("unchecked")
			List<Product> pizza = query.list();
			Hibernate.initialize(pizza);
			return pizza;
		}catch(JDBCException e ) {
			logger.error(e);
		}
		
		return null;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.ProductDAO#getProductInfo(int)
	 */
	@Override
	public Product getPizza(Integer id) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
			Product pizza = ((Product) session.load(Product.class, id));
			Hibernate.initialize(pizza);
			return pizza;
		}catch(JDBCException e ) {
			logger.error(e);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.ProductDAO#addPizza(com.impetus.pizza.domain.Product)
	 */
	@Override
	public String addPizza(Product product) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
			Category category = new Category();
			category.setCategoryID(1);
			product.setCategory(category);
			session.save(product);
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.ProductDAO#removePizza(java.lang.Integer)
	 */
	@Override
	public String removePizza(Integer id) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
			/*Query query = session.createQuery("delete from Product where productID = '" + id + "'");
			query.executeUpdate();*/
		    Product product = (Product)session.load(Product.class, id);
		    Hibernate.initialize(product);
	        if (product != null) {
	        	session.delete(product);
	        }
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.ProductDAO#editPizza(com.impetus.pizza.domain.Product)
	 */
	@Override
	public String editPizza(Product product) {
		// TODO Auto-generated method stub
		try {
	   		session = sessionFactory.getCurrentSession();
	   		session.saveOrUpdate(product);
	   	}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}

}
