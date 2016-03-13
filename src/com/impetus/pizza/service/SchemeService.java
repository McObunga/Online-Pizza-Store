package com.impetus.pizza.service;

import java.util.List;

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Offer;
import com.impetus.pizza.exception.ServiceException;

// TODO: Auto-generated Javadoc
/**
 * The Interface SchemeService.
 */
public interface SchemeService {

	/**
	 * Adds the offer.
	 *
	 * @param offer the offer
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String addOffer(Offer offer) throws ServiceException;
	
	/**
	 * List offer.
	 *
	 * @return the list
	 * @throws ServiceException the service exception
	 */
	List<Offer> listOffer() throws ServiceException;
	
	/**
	 * Gets the offer.
	 *
	 * @param id the id
	 * @return the offer
	 * @throws ServiceException the service exception
	 */
	Offer getOffer(Integer id) throws ServiceException;
	
	/**
	 * Removes the offer.
	 *
	 * @param id the id
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String removeOffer(Integer id) throws ServiceException;
	
	/**
	 * Adds the coupon.
	 *
	 * @param coupon the coupon
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String addCoupon(Coupon coupon) throws ServiceException;
	
	/**
	 * List coupon.
	 *
	 * @return the list
	 * @throws ServiceException the service exception
	 */
	List<Coupon> listCoupon() throws ServiceException;
	
	/**
	 * Gets the coupon.
	 *
	 * @param No the no
	 * @return the coupon
	 * @throws ServiceException the service exception
	 */
	Coupon getCoupon(String No) throws ServiceException;
	
	/**
	 * Removes the coupon.
	 *
	 * @param No the no
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String removeCoupon(String No) throws ServiceException;
}
