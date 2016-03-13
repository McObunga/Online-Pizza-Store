package com.impetus.pizza.service;

import java.util.List;

import com.impetus.pizza.domain.UserRecord;
import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.DuplicateUserException;
import com.impetus.pizza.exception.ServiceException;

// TODO: Auto-generated Javadoc
/**
 * The Interface UserinfoService.
 */
public interface UserinfoService {
	
	/**
	 * Register user.
	 *
	 * @param user the user
	 * @return the string
	 * @throws ServiceException the service exception
	 * @throws DuplicateUserException the duplicate user exception
	 */
	 String registerUser(Userinfo user) throws ServiceException, DuplicateUserException;
	
	/**
	 * History.
	 *
	 * @param userid the userid
	 * @return the list
	 * @throws ServiceException the service exception
	 */
	List<UserRecord> history(int userid) throws ServiceException;
	
	/**
	 * Save order.
	 *
	 * @param record the record
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String saveOrder(UserRecord record) throws ServiceException;
	
	/**
	 * Gets the user.
	 *
	 * @param User_name the user_name
	 * @return the user
	 * @throws ServiceException the service exception
	 */
	Userinfo getUser(String User_name) throws ServiceException;
	
	/**
	 * Register bpo.
	 *
	 * @param user the user
	 * @return the string
	 * @throws ServiceException the service exception
	 */
	String registerBpo(Userinfo user) throws ServiceException;
}
