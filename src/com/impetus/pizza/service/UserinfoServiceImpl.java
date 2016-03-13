package com.impetus.pizza.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.impetus.pizza.domain.Role;
import com.impetus.pizza.domain.UserRecord;
import com.impetus.pizza.domain.Userinfo;
import com.impetus.pizza.exception.DuplicateUserException;
import com.impetus.pizza.exception.ServiceException;
import com.impetus.pizza.persistence.UserinfoDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class UserinfoServiceImpl.
 */
@Service
public class UserinfoServiceImpl implements UserinfoService {
     	
	/** The userinfo dao. */
	@Autowired
	private UserinfoDAO userinfoDAO;
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.UserinfoService#registerUser(com.impetus.pizza.domain.Userinfo)
	 */
	
	@Override
	@Transactional
	public String registerUser(Userinfo user) throws ServiceException, DuplicateUserException {
		// TODO Auto-generated method stub
		 int i = 3;
		 Role role = new Role();
 		 role.setRoleID(i);
 		 user.setRole(role);
		 userinfoDAO.registerUser(user);
         return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.UserinfoService#registerBpo(com.impetus.pizza.domain.Userinfo)
	 */
	@Override
	@Transactional
	public String registerBpo(Userinfo user) throws ServiceException  {
		 int i = 2; 
		 Role role = new Role();
		 role.setRoleID(i);
		 user.setRole(role);
		 userinfoDAO.registerBpo(user);
		 return "success";
	}
	
	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.UserinfoService#updateUser(com.impetus.pizza.domain.Userinfo)
	 */
	@Override
	@Transactional
	public List<UserRecord> history(int userid) throws ServiceException{
		// TODO Auto-generated method stub	
		return userinfoDAO.history(userid);	 
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.UserinfoService#deleteUser(com.impetus.pizza.domain.Userinfo)
	 */
	@Override
	@Transactional
	public String saveOrder(UserRecord record) throws ServiceException{
		// TODO Auto-generated method stub
		userinfoDAO.saveOrder(record);
		return "success";
	}

	/* (non-Javadoc)
	 * @see com.impetus.pizza.service.UserinfoService#getUser(java.lang.String)
	 */
	@Override
	@Transactional
	public Userinfo getUser(String User_name) throws ServiceException {
		// TODO Auto-generated method stub
		return userinfoDAO.getUser(User_name);
		
	}

}
