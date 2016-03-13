package test.com.impetus.pizza.service;

import java.util.ArrayList;
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
import com.impetus.pizza.domain.Product;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.ProductService;

// TODO: Auto-generated Javadoc
/**
 * The Class ProductServiceImplTest.
 */
@ContextConfiguration(locations = { "file:src/test/com/impetus/pizza/service/application-context.xml" })
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager")
public class ProductServiceImplTest {

	/** The productservice. */
	@Autowired
	private ProductService productservice;
	
	/**
	 * Test get pizzas.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetPizzas() throws ServiceException {
		List<Product> product = productservice.getPizzas();
		Assert.assertNotNull(product);
	}
	
	/**
	 * Test get pizza.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetPizza() throws ServiceException {
		Product actual = new Product();
		actual.setProductName("Gourmet");
		Product var = productservice.getPizza(23);
		Assert.assertEquals(actual.getProductName(), var.getProductName());
	}
	
	/**
	 * Test add pizza.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testAddPizza() throws ServiceException {
		List<Ingredient> ingred =  new ArrayList<Ingredient>();
        Ingredient ii = new Ingredient();
        ii.setIngredientID(22);
        ii.setIngredientID(23);
        ingred.add(ii);
		Product actual = new Product();
		actual.setProductName("cheese");
		actual.setDescription("Testy Pizza");
		actual.setImage("resources/images/pizza_images/pizza10.jpg");
		actual.setIngredientlist(ingred);
		actual.setPsmall(100);
		actual.setPmedium(150);
		actual.setPlarge(200);
		String var = productservice.addPizza(actual);
		Assert.assertEquals("success", var);
	}
	
	/**
	 * Test edit pizza.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test 
	public void testEditPizza() throws ServiceException {
		List<Ingredient> ingred =  new ArrayList<Ingredient>();
        Ingredient ii = new Ingredient();
        ii.setIngredientID(22);
        ii.setIngredientID(24);
        ingred.add(ii);
		Product actual = new Product();
		actual.setProductName("cheese");
		actual.setDescription("Testy Pizza");
		actual.setImage("resources/images/pizza_images/pizza10.jpg");
		actual.setIngredientlist(ingred);
		actual.setPsmall(120);
		actual.setPmedium(150);
		actual.setPlarge(200);
		String var = productservice.editPizza(actual);
		Assert.assertEquals("success", var);
	}
	
	/**
	 * Test remove pizza.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testRemovePizza() throws ServiceException {
		int ii = 23;
		Integer i = Integer.valueOf(ii);
		String var = productservice.removePizza(i);
		 Assert.assertEquals("success", var);
	}
}
