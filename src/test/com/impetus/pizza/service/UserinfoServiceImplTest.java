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

import com.impetus.pizza.domain.UserRecord;
import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.DuplicateUserException;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.UserinfoService;

// TODO: Auto-generated Javadoc
/**
 * The Class UserinfoServiceImplTest.
 */
 
@ContextConfiguration(locations = { "file:src/test/com/impetus/pizza/service/application-context.xml" })
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager")
public class UserinfoServiceImplTest {

	/** The userinfoservice. */
	@Autowired 
	private UserinfoService userinfoservice;
	
	/**
	 * Test register user.
	 *
	 * @throws DuplicateUserException the duplicate user exception
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testRegisterUser() throws DuplicateUserException, ServiceException {
		Userinfo user = new Userinfo("srinagar, indore", "9834423788", "deee@gmail.com", "1234567");	
		String var = userinfoservice.registerUser(user);
		Assert.assertEquals("success", var);	 
	}
	
	/**
	 * Test get user.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetUser() throws ServiceException {
		Userinfo actual = new Userinfo();
		actual.setUserPassword("12345");
		Userinfo var = userinfoservice.getUser("deepak@gmail.com");
		Assert.assertEquals(actual.getUserPassword(), var.getUserPassword());
	}
	
	/**
	 * Testhistory.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testhistory() throws ServiceException {
		int ii = 2;
		Integer id = Integer.valueOf(ii);
		List<UserRecord> var = userinfoservice.history(id);
		Assert.assertNotNull(var);
	}
}
