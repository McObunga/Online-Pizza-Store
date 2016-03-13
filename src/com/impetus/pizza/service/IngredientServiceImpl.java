package com.impetus.pizza.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.impetus.pizza.domain.Category;
import com.impetus.pizza.domain.Ingredient;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.persistence.IngredientDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class IngredientServiceImpl.
 */
@Service
public class IngredientServiceImpl implements IngredientService{

	/** The ingredient dao. */
	@Autowired
	private IngredientDAO ingredientDAO;
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#addTopping(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	@Transactional
	public String addTopping(Ingredient ingredient) throws ServiceException {
		// TODO Auto-generated method stub
		int i = 2;
		Category category = new Category();
		category.setCategoryID(i);
		ingredient.setCategory(category);
		ingredientDAO.addTopping(ingredient);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#listTopping()
	 */
	@Override
	@Transactional
	public List<Ingredient> listTopping() throws ServiceException{
		// TODO Auto-generated method stub
		return ingredientDAO.listTopping();
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#removeTopping(java.lang.Integer)
	 */
	@Override
	@Transactional
	public String removeTopping(Integer id) throws ServiceException{
		// TODO Auto-generated method stub
		ingredientDAO.removeTopping(id);	
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#getTopping(java.lang.Integer)
	 */
	@Override
	@Transactional
	public Ingredient getTopping(Integer id) throws ServiceException{
		// TODO Auto-generated method stub
		return (Ingredient)ingredientDAO.getTopping(id);
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#editTopping(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	@Transactional
	public String editTopping(Ingredient ingredient) throws ServiceException{
		// TODO Auto-generated method stub
		ingredientDAO.editTopping(ingredient);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#addCrust(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	@Transactional
	public String addCrust(Ingredient ingredient) throws ServiceException{
		// TODO Auto-generated method stub
		int i = 3;
		Category category = new Category();
		category.setCategoryID(i);
		ingredient.setCategory(category);
		ingredientDAO.addCrust(ingredient);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#listCrust()
	 */
	@Override
	@Transactional
	public List<Ingredient> listCrust() throws ServiceException{
		// TODO Auto-generated method stub
		return ingredientDAO.listCrust();
		
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#removeCrust(java.lang.Integer)
	 */
	@Override
	@Transactional
	public String removeCrust(Integer id) throws ServiceException{
		// TODO Auto-generated method stub
		ingredientDAO.removeCrust(id);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#getCrust(java.lang.Integer)
	 */
	@Override
	@Transactional
	public Ingredient getCrust(Integer id) throws ServiceException{
		// TODO Auto-generated method stub
		return ingredientDAO.getCrust(id);
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.IngredientService#editCrust(com.impetus.pizza.domain.Ingredient)
	 */
	@Override
	@Transactional
	public String editCrust(Ingredient ingredient) throws ServiceException{
		// TODO Auto-generated method stub
		ingredientDAO.editCrust(ingredient);
		return "success";
	}

}
