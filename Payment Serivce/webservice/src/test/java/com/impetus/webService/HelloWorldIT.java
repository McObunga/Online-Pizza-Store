package com.impetus.webService;

import static org.junit.Assert.assertEquals;

import java.io.InputStream;
 
import javax.ws.rs.core.Response;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.jaxrs.client.WebClient;
import org.junit.Test;

public class HelloWorldIT {
	
	@Test
	public void testPing() throws Exception {
		WebClient client = WebClient.create("http://localhost:8081/webservice/payment/cvvno/175");
		Response r = client.accept("text/plain").get();
		assertEquals(Response.Status.OK.getStatusCode(), r.getStatus());
		String value =  (IOUtils.toString((InputStream)r.getEntity()));
		assertEquals("Transaction was done successfully!", value);
	}
	
}
