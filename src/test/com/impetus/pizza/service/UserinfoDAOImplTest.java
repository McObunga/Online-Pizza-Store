package test.com.impetus.pizza.service;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.DuplicateUserException;
import com.impetus.pizza.persistence.UserinfoDAOImpl;
 

// TODO: Auto-generated Javadoc
/**
 * The Class UserinfoDAOImplTest.
 */
 
@ContextConfiguration(locations = { "file:src/test/com/impetus/pizza/service/application-context.xml" })
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager")
public class UserinfoDAOImplTest {

	/** The userinfodao. */
	@Autowired
	private UserinfoDAOImpl userinfodao;
	
	/**
	 * Test get user.
	 */
	@Test
	public void testGetUser() {
		Userinfo actual = new Userinfo();
		actual.setUserPassword("12345");
		Userinfo var = userinfodao.getUser("deepak@gmail.com");
		Assert.assertEquals(actual.getUserPassword(), var.getUserPassword());
	}
	
	/**
	 * Test register user.
	 *
	 * @throws DuplicateUserException the duplicate user exception
	 */
	@Test
	public void testRegisterUser() throws DuplicateUserException {
		Userinfo user = new Userinfo("srinagar, indore", "9834423788", "depak@gmail.com", "1234567");
		String var = userinfodao.registerUser(user);
		Assert.assertEquals("success", var);	
	}
}
