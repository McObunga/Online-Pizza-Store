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

import com.impetus.pizza.domain.Coupon;
import com.impetus.pizza.domain.Offer;

// TODO: Auto-generated Javadoc
/**
 * The Class SchemeDAOImpl.
 */
@Repository("SchemeDAO")
public class SchemeDAOImpl implements SchemeDAO{

	/** The logger. */
	private Logger logger = Logger.getLogger("persistence");
	

	/** The session factory. */
	@Autowired
	private SessionFactory sessionFactory;
	
	/** The session. */
	private Session session = null;
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#addOffer(com.impetus.pizza.domain.Offer)
	 */
	@Override
	public String addOffer(Offer offer) {
		try {
			session = sessionFactory.getCurrentSession();
			session.save(offer);
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#listOffer()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Offer> listOffer() {
		List<Offer> offer = null;
		try {
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Offer");		
		    offer = query.list();
			Hibernate.initialize(offer);
			return offer;
		}catch(JDBCException e ) {
			logger.error(e);
		}
		return offer;
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#getOffer(java.lang.Integer)
	 */
	@Override
	public Offer getOffer(Integer id) {
		Offer offer = null;
		try {
			  offer = ((Offer)sessionFactory.getCurrentSession().createQuery("from Offer where offerId='"+ id +"'").uniqueResult());
		}catch(JDBCException e) {
			logger.error(e);
		}
		return  offer;
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#removeOffer(java.lang.Integer)
	 */
	@Override
	public String removeOffer(Integer id) {
		try {
			session = sessionFactory.getCurrentSession();
		    Offer offer = (Offer)session.load(Offer.class, id);
		    Hibernate.initialize(offer);
	        if (offer != null) {
	        	session.delete(offer);
	        }
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#addCoupon(com.impetus.pizza.domain.Coupon)
	 */
	@Override
	public String addCoupon(Coupon coupon) {
		coupon.setStatus(true);
		try {
			session = sessionFactory.getCurrentSession();
			session.save(coupon);
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#listCoupon()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Coupon> listCoupon() {
		List<Coupon> coupon = null;
		try {
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Coupon");		
			coupon = query.list();
			Hibernate.initialize(coupon);
			return coupon;
		}catch(JDBCException e ) {
			logger.error(e);
		}
		return coupon;
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#getCoupon(java.lang.Integer)
	 */
	@Override
	public Coupon getCoupon(String no) {
		Coupon coupon = null;
		try {
			coupon = ((Coupon)sessionFactory.getCurrentSession().createQuery("from Coupon where CouponNo='"+ no +"'").uniqueResult());
		}catch(JDBCException e) {
			logger.error(e);
		}
		return  coupon;
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.SchemeDAO#removeCoupon(java.lang.Integer)
	 */
	@Override
	public String removeCoupon(String no) {
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("delete from Coupon where CouponNo='"+ no +"'");
			query.executeUpdate();
		}catch(JDBCException e) {
			logger.error(e);
		}
		return "success";
	}
}
