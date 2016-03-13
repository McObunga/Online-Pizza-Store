package com.impetus.pizza.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Offer;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.persistence.SchemeDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class SchemeServiceImpl.
 */
@Service
public class SchemeServiceImpl implements SchemeService{

	/** The scheme dao. */
	@Autowired
	private SchemeDAO schemeDAO;
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#addOffer(com.impetus.pizza.domain.Offer)
	 */
	@Override
	@Transactional
	public String addOffer(Offer offer) throws ServiceException {
		schemeDAO.addOffer(offer);
		return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#listOffer()
	 */
	@Override
	@Transactional
	public List<Offer> listOffer() throws ServiceException{
		return schemeDAO.listOffer();
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#getOffer(java.lang.Integer)
	 */
	@Override
	@Transactional
	public Offer getOffer(Integer id) throws ServiceException{
		return (Offer)schemeDAO.getOffer(id);
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#removeOffer(java.lang.Integer)
	 */
	@Override
	@Transactional
	public String removeOffer(Integer id) throws ServiceException{
		schemeDAO.removeOffer(id);
		return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#addCoupon(com.impetus.pizza.domain.Coupon)
	 */
	@Override
	@Transactional
	public String addCoupon(Coupon coupon) throws ServiceException{
		schemeDAO.addCoupon(coupon);
		return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#listCoupon()
	 */
	@Override
	@Transactional
	public List<Coupon> listCoupon() throws ServiceException{
		return schemeDAO.listCoupon();
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#getCoupon(java.lang.String)
	 */
	@Override
	@Transactional
	public Coupon getCoupon(String No) throws ServiceException{
		return schemeDAO.getCoupon(No);
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.SchemeService#removeCoupon(java.lang.String)
	 */
	@Override
	@Transactional
	public String removeCoupon(String No) throws ServiceException{
		schemeDAO.removeCoupon(No);
		return "success";
	}
}
