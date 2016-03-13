package com.impetus.pizza.persistence;

import java.util.List;

import com.impetus.pizza.domain.UserRecord;
import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.DuplicateUserException;

// TODO: Auto-generated Javadoc
/**
 * The Interface UserinfoDAO.
 */
public interface UserinfoDAO {

	/**
	 * Register user.
	 *
	 * @param user the user
	 * @return the string
	 * @throws DuplicateUserException the duplicate user exception
	 */
	 String registerUser(Userinfo user) throws DuplicateUserException;
	
	/**
	 * History.
	 *
	 * @param userid the userid
	 * @return the list
	 */
	 List<UserRecord> history(int userid);
	
	/**
	 * Save order.
	 *
	 * @param record the record
	 * @return the string
	 */
	 String saveOrder(UserRecord record);
		
	/**
	 * Gets the user.
	 *
	 * @param User_name the user_name
	 * @return the user
	 */
	 Userinfo getUser(String User_name);
	 
	 /**
 	 * Register bpo.
 	 *
 	 * @param user the user
 	 * @return the string
 	 */
 	String registerBpo(Userinfo user);
}
