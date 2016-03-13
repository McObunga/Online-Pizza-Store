package com.impetus.pizza.persistence;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.JDBCException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.impetus.pizza.domain.Category;
import com.impetus.pizza.domain.Ingredient;

// TODO: Auto-generated Javadoc
/**
 * The Class IngredientDAOImpl.
 */
@Repository("IngredientDAO")
public class IngredientDAOImpl implements IngredientDAO{

	/** The logger. */
	private Logger logger = Logger.getLogger("persistence");
	
	/** The session factory. */
	@Autowired
	private SessionFactory sessionFactory;
	
	/** The session. */
	private Session session = null;
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#addTopping(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	public String addTopping(Ingredient ingredient) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
			/*Category category = new Category();
			category.setCategoryID(2);
			ingredient.setCategory(category);*/
			session.save(ingredient);
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#listTopping()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Ingredient> listTopping() {
		// TODO Auto-generated method stub
		List<Ingredient> ingredient = null;
		try {
			int i = 2;
			session = sessionFactory.getCurrentSession();
			Category category = new Category();
			category.setCategoryID(i);
			Query query = session.createQuery("from Ingredient where categoryID='" + category.getCategoryID() + "'");		
		    ingredient = query.list();
			Hibernate.initialize(ingredient);
			return ingredient;
		}catch(JDBCException e ) {
			logger.error(e);
		}
		return ingredient;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#removeTopping(java.lang.Integer)
	 */
	@Override
	public String removeTopping(Integer id) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
		    Ingredient ingredient = (Ingredient)session.load(Ingredient.class, id);
		    Hibernate.initialize(ingredient);
	        if (ingredient != null) {
	        	session.delete(ingredient);
	        }
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}	

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#getTopping(java.lang.Integer)
	 */
	@Override
	public Ingredient getTopping(Integer id) {
		// TODO Auto-generated method stub
		Ingredient ingredient = null;
		try {
			 ingredient= ((Ingredient)sessionFactory.getCurrentSession().createQuery("from Ingredient where ingredientID='"+ id +"'").uniqueResult());
		}catch(JDBCException e) {
			logger.error(e);
		}
		return ingredient;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#editTopping(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	public String editTopping(Ingredient ingredient) {
		// TODO Auto-generated method stub
	   	try {
	   		session = sessionFactory.getCurrentSession();
	   		session.saveOrUpdate(ingredient);
	   	}catch(JDBCException e) {
	   		logger.error(e);
		}
	   	return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#addCrust(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	public String addCrust(Ingredient ingredient) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
			/*Category category = new Category();
			category.setCategoryID(3);
			ingredient.setCategory(category);*/
			session.save(ingredient);
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#listCrust()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Ingredient> listCrust() {
		// TODO Auto-generated method stub
		List<Ingredient> ingredient = null;
		try {
			int i = 3;
			session = sessionFactory.getCurrentSession();
			Category category = new Category();
			category.setCategoryID(i);
			Query query = session.createQuery("from Ingredient where categoryID='" + category.getCategoryID() + "'");		
		    ingredient = query.list();
			Hibernate.initialize(ingredient);
			return ingredient;
		}catch(JDBCException e ) {
			logger.error(e);
		}
		return ingredient;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#removeCrust(java.lang.Integer)
	 */
	@Override
	public String removeCrust(Integer id) {
		// TODO Auto-generated method stub
		try {
			session = sessionFactory.getCurrentSession();
		    Ingredient ingredient = (Ingredient)session.load(Ingredient.class, id);
		    Hibernate.initialize(ingredient);
	        if (ingredient != null) {
	        	session.delete(ingredient);
	        }
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#getCrust(java.lang.Integer)
	 */
	@Override
	public Ingredient getCrust(Integer id) {
		// TODO Auto-generated method stub
		Ingredient ingredient = null;
		try {
			 ingredient= ((Ingredient)sessionFactory.getCurrentSession().createQuery("from Ingredient where ingredientID='"+ id +"'").uniqueResult());
		}catch(JDBCException e) {
			logger.error(e);
		}
		return ingredient;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.IngredientDAO#editCrust(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	public String editCrust(Ingredient ingredient) {
		// TODO Auto-generated method stub
		try {
	   		session = sessionFactory.getCurrentSession();
	   		session.saveOrUpdate(ingredient);
	   	}catch(JDBCException e) {
	   		logger.error(e);
		}
		return "success";
	}

}
