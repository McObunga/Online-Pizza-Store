package com.impetus.pizza.exception;

@SuppressWarnings("serial")
public class PaymentException extends java.net.ConnectException{

	public PaymentException() {
		
	}
	
	public PaymentException(String root) {
		super(root);
	}
}
