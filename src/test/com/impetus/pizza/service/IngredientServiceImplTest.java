package test.com.impetus.pizza.service;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.impetus.pizza.domain.Ingredient;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.IngredientService;


// TODO: Auto-generated Javadoc
/**
 * The Class IngredientServiceImplTest.
 */
@ContextConfiguration(locations = {"file:src/test/com/impetus/pizza/service/application-context.xml"})
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager")
public class IngredientServiceImplTest {

	/** The service. */
	@Autowired
	private IngredientService service;

	/**
	 * Test list crust.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testListCrust() throws ServiceException {
		List<Ingredient> listTest = service.listCrust();
		Assert.assertNotNull(listTest);
	}

	/**
	 * Test list topping.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testListTopping() throws ServiceException {
		List<Ingredient> list = service.listTopping();
		Assert.assertNotNull(list);
	}

	/**
	 * Test add topping.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testAddTopping() throws ServiceException {
		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName("name");
		ingredient.setPsmall(10);
		ingredient.setPmedium(20);
		ingredient.setPlarge(30);
		String var = service.addTopping(ingredient);
	    Assert.assertEquals("success", var);
	    
	}

	/**
	 * Test add crust.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testAddCrust() throws ServiceException {
		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName("name");
		ingredient.setPsmall(10);
		ingredient.setPmedium(20);
		ingredient.setPlarge(30);
		String var = service.addTopping(ingredient);
		Assert.assertEquals("success", var);
	}

	/**
	 * Test remove crust.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testRemoveCrust() throws ServiceException {
		int ii = 1;
		Integer i = Integer.valueOf(ii);
		String var = service.removeCrust(i);
		Assert.assertEquals("success", var);
	}
	
	/**
	 * Test remove topping.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testRemoveTopping() throws ServiceException {
		int ii = 23;
		Integer i = Integer.valueOf(ii);
		String var = service.removeTopping(i);
		 Assert.assertEquals("success", var);
	}
	
	/**
	 * Test edit topping.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testEditTopping() throws ServiceException {
		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName("name");
		ingredient.setPsmall(10);
		ingredient.setPmedium(20);
		ingredient.setPlarge(30);
		String var = service.editTopping(ingredient);
		 Assert.assertEquals("success", var);
	}
	
	/**
	 * Test edit crust.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testEditCrust() throws ServiceException {
		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName("name");
		ingredient.setPsmall(50);
		ingredient.setPmedium(70);
		ingredient.setPlarge(90);
		String var = service.editCrust(ingredient);
		 Assert.assertEquals("success", var);
	}
	
	/**
	 * Test get crust.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetCrust() throws ServiceException {
		Ingredient actual = new Ingredient();
		actual.setIngredientName("Cheese Brust");
		int ii = 3;
		Integer i = Integer.valueOf(ii);
		Ingredient var = service.getCrust(i);
		Assert.assertEquals(actual.getIngredientName(), var.getIngredientName());
	}
	
	/**
	 * Test get topping.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetTopping() throws ServiceException {
		Ingredient actual = new Ingredient();
		actual.setIngredientName("Fresh Tomato");
		int ii = 23;
		Integer i = Integer.valueOf(ii);
		Ingredient var = service.getTopping(i);
		Assert.assertEquals(actual.getIngredientName(), var.getIngredientName());
	}
}
