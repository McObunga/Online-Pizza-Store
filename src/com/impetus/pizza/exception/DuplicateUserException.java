package com.impetus.pizza.exception;

// TODO: Auto-generated Javadoc
/**
 * The Class DuplicateUserException.
 */
public class DuplicateUserException extends Exception{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Instantiates a new duplicate user exception.
	 */
	public DuplicateUserException() {
		
	}
	
	/**
	 * Instantiates a new duplicate user exception.
	 *
	 * @param root the root
	 */
	public DuplicateUserException(Exception root) {
		super(root);
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Throwable#toString()
	 */
	@Override
	public String toString() 
	{
		String exceptionMessage = "Duplicate entry already exist in database. " + super.toString();
		return exceptionMessage;
	}

}
