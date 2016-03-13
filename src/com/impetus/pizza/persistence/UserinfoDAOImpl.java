 package com.impetus.pizza.persistence;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.JDBCException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.impetus.pizza.domain.UserRecord;
import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.DuplicateUserException;

// TODO: Auto-generated Javadoc
/**
 * The Class UserinfoDAOImpl.
 */
@Repository("userinfoDAO")
public class UserinfoDAOImpl implements UserinfoDAO{

	/** The logger. */
	private Logger logger = Logger.getLogger(UserinfoDAOImpl.class);
	
	/** The session factory. */
	@Autowired
    private SessionFactory sessionFactory;
	
	/** The session. */
	private Session session = null;
		
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.UserinfoDAO#registerUser(com.impetus.pizza.domain.Userinfo)
	 */
	@Override
    public String registerUser(Userinfo user) throws DuplicateUserException{
		// TODO Auto-generated method stub
	  try { 
			 session = sessionFactory.getCurrentSession();
			 if(getUser(user.getUserName())!=null)
				{
					throw new DuplicateUserException();
				}
			 session.save(user);
		 }catch(JDBCException e) {
			 logger.error(e);
		 }
		 return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.UserinfoDAO#registerBpo(com.impetus.pizza.domain.Userinfo)
	 */
	@Override
	public String registerBpo( Userinfo user) {
		 try { 
			 session = sessionFactory.getCurrentSession();
			 session.save(user);
		 }catch(JDBCException e) {
			 logger.error(e);
		 }
		 return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.UserinfoDAO#getUser(java.lang.String)
	 */
	@Override
	public Userinfo getUser(String User_name) {
		// TODO Auto-generated method stub
		Userinfo user = null;
		try {
			 user= ((Userinfo)sessionFactory.getCurrentSession().createQuery("from Userinfo where userName='"+ User_name +"'").uniqueResult());
		}catch(JDBCException e) {
			logger.error(e);
		}
		return user;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.UserinfoDAO#updateUser(com.impetus.pizza.domain.Userinfo)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserRecord> history(int userid) {
		// TODO Auto-generated method stub
		List<UserRecord> record = new ArrayList<UserRecord>();
		try {
			record = ((List<UserRecord>)sessionFactory.getCurrentSession().createQuery("from UserRecord where userID ='" + userid + "'").list());
			Hibernate.initialize(record);
		} catch (Exception e) {
			logger.error(e); 
		}
		return record;
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.persistence.UserinfoDAO#deleteUser(com.impetus.pizza.domain.Userinfo)
	 */
	@Override
	public String saveOrder(UserRecord record) {
		// TODO Auto-generated method stub
		 try { 
			 session = sessionFactory.getCurrentSession();
			 session.save(record);
		 }catch(JDBCException e) {
			 logger.error(e);
		 }
		return "success";
	}

}
