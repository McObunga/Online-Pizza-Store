package com.impetus.pizza.util;

import org.apache.cxf.jaxrs.client.WebClient;

// TODO: Auto-generated Javadoc
/**
 * The Class PaymentImpl.
 */
public class PaymentImpl implements Payment{

	/* (non-Javadoc)
	 * @see com.impetus.pizza.util.Payment#makePayment(int)
	 */
	@Override
	public String makePayment(int cvvno) {
		// TODO Auto-generated method stub
		WebClient client = WebClient.create("http://localhost:8081/webservice/payment/cvvno/"+cvvno);
		client.accept("text/plain");
		String paymentStatus = client.get(String.class); 
		return paymentStatus;
	 }
	} 


