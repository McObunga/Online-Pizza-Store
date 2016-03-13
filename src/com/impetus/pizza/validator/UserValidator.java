package com.impetus.pizza.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.impetus.pizza.domain.Userinfo;

// TODO: Auto-generated Javadoc
/**
 * The Class UserValidator.
 */
@Component("userValidator")
public class UserValidator implements Validator{
	
	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
	@Override
	public boolean supports(Class<?> userClass) {
		// TODO Auto-generated method stub
		return Userinfo.class.isAssignableFrom(userClass);
	}

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
	@Override
	public void validate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "userName.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "password.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userAddress1", "address1.required");
        //ValidationUtils.rejectIfEmpty(errors, "productlist", "preference.required", "choose your pizza");
        
		int i = 10;
        Userinfo user = (Userinfo)obj;
        if(user.getUserName() != null && (!user.getUserName().equals("")) && !user.getUserName().matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}")) {
	    	   errors.rejectValue("userName", "invalid.email");
	        }
        
        if(!user.getUserAddress1().equals("") && user.getUserAddress1().length()< i) {
	    	  errors.rejectValue("userAddress1", "invalid.address1");
	      }
        /*Integer i = user.getUser_mobile();
	       if(i != null  && (!i.toString().equals("")) && !(i.toString().matches("^[789][0-9]{9}$"))) {
	    	   result.rejectValue("User_mobile", "invalid.mobile");
	       } */
	}

	
}
