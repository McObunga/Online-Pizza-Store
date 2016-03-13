package com.impetus.pizza.exception;

// TODO: Auto-generated Javadoc
/**
 * The Class ApplicationException.
 */
@SuppressWarnings("serial")
public class ApplicationException extends Exception{
	
	/**
	 * Instantiates a new application exception.
	 */
	public ApplicationException() {
		
	}

    /**
     * Instantiates a new application exception.
     *
     * @param root the root
     */
    public ApplicationException(Exception root) {
		super(root);
	}
    
    /* (non-Javadoc)
     * @see java.lang.Throwable#toString()
     */
    @Override
	public String toString() 
	{
		String exceptionMessage = "Exception was thrown form application layer" + super.toString();
		return exceptionMessage;	 
	}
}
