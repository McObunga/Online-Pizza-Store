package com.impetus.pizza.exception;

// TODO: Auto-generated Javadoc
/**
 * The Class ServiceException.
 */
@SuppressWarnings("serial")
public class ServiceException extends Exception{

	/**
	 * Instantiates a new service exception.
	 */
	public ServiceException() {
		
	}
	
	/**
	 * Instantiates a new service exception.
	 *
	 * @param root the root
	 */
	public ServiceException(Exception root) {
		super(root);
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Throwable#toString()
	 */
	@Override
	public String toString() 
	{
		String exceptionMessage = "Exception was thrown form service layer" + super.toString();
		return exceptionMessage;
	}

}
