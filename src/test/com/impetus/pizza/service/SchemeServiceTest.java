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

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Offer;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.service.SchemeService;

// TODO: Auto-generated Javadoc
/**
 * The Class SchemeServiceTest.
 */
@ContextConfiguration(locations = {"file:src/test/com/impetus/pizza/service/application-context.xml"})
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "transactionManager")
public class SchemeServiceTest {

	/** The schemeservice. */
	@Autowired
	private SchemeService schemeservice;
	
	/**
	 * Test add offer.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testAddOffer() throws ServiceException {
		Offer offer = new Offer();
		//Date date = new Date(01/06/2012);
		offer.setAmount(1000);
		offer.setDiscount(3);
		offer.setEndDate("01/06/2012");
		offer.setStartDate("01/06/2012");
		offer.setOfferName("amountBased");
		String var = schemeservice.addOffer(offer);
		Assert.assertEquals("success", var);
	}
	
	/**
	 * Test add coupon.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testAddCoupon() throws ServiceException {
	    Coupon coupon = new Coupon();
	    //Date date = new Date(2013/01/05);
	    coupon.setCouponNo("cou232252");
	    coupon.setDiscount(100);
	    coupon.setEndDate("2013/01/05");
	    coupon.setStartDate("2013/01/05");
	    String var = schemeservice.addCoupon(coupon);
	    Assert.assertEquals("success", var);
	}
	
	/**
	 * Test list offer.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testListOffer() throws ServiceException {
		List<Offer> offerlist = schemeservice.listOffer();
		Assert.assertNotNull(offerlist);
	}
	
	/**
	 * Test list coupon.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testListCoupon() throws ServiceException {
		List<Coupon> coupon = schemeservice.listCoupon();
		Assert.assertNotNull(coupon);
	}
	
	/**
	 * Test remove offer.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testRemoveOffer() throws ServiceException {
		int ii = 14;
		Integer id = Integer.valueOf(ii);
		String var = schemeservice.removeOffer(id);
		 Assert.assertEquals("success", var);
	}
	
	/**
	 * Test remove coupon.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testRemoveCoupon() throws ServiceException {
		String No = new String("cou121212");
		String var = schemeservice.removeCoupon(No);
		 Assert.assertEquals("success", var);
	}
	
	/**
	 * Test get offer.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetOffer() throws ServiceException {
		Offer offer = new Offer();
		offer.setDiscount(4);
		int ii = 14;
		Integer id = Integer.valueOf(ii);
		Offer var = schemeservice.getOffer(id);
		 Assert.assertEquals(offer.getDiscount(), var.getDiscount());
	}
	
	/**
	 * Test get coupon.
	 *
	 * @throws ServiceException the service exception
	 */
	@Test
	public void testGetCoupon() throws ServiceException {
		Coupon coupon = new Coupon();
		coupon.setDiscount(100);
		String No = new String("cou121212");
		Coupon var = schemeservice.getCoupon(No);
		Assert.assertEquals(coupon.getDiscount(), var.getDiscount());
	}
}
