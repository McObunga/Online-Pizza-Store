package com.impetus.pizza.persistence;

import java.util.List;

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Offer;

// TODO: Auto-generated Javadoc
/**
 * The Interface SchemeDAO.
 */
public interface SchemeDAO {

	/**
	 * Adds the offer.
	 *
	 * @param offer the offer
	 * @return the string
	 */
	String addOffer(Offer offer);
	
	/**
	 * List offer.
	 *
	 * @return the list
	 */
	List<Offer> listOffer();
	
	/**
	 * Gets the offer.
	 *
	 * @param id the id
	 * @return the offer
	 */
	Offer getOffer(Integer id);
	
	/**
	 * Removes the offer.
	 *
	 * @param id the id
	 * @return the string
	 */
	String removeOffer(Integer id);
	
	/**
	 * Adds the coupon.
	 *
	 * @param coupon the coupon
	 * @return the string
	 */
	String addCoupon(Coupon coupon);
	
	/**
	 * List coupon.
	 *
	 * @return the list
	 */
	List<Coupon> listCoupon();
	
	/**
	 * Gets the coupon.
	 *
	 * @param id the id
	 * @return the coupon
	 */
	Coupon getCoupon(String id);
	
	/**
	 * Removes the coupon.
	 *
	 * @param id the id
	 * @return the string
	 */
	String removeCoupon(String id);
}
