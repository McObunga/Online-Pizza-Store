package com.impetus.webService;
import java.util.ArrayList;
import java.util.List;

//import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
//import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

@Path("/payment")
public class HelloWorld {

    @GET
    @Path("/cvvno/{input}")
    @Produces("text/plain")
    public Response ping(@PathParam("input") int cvvno) {
    	String message = "Service can't be done";
    	List<Integer> cvvlist = getCvvList();
        for (int i = 0; i < cvvlist.size(); i++) {
        	if (cvvno == cvvlist.get(i)) {
        		message = "Transaction was done successfully!";
        		break;
        	}
        	else {
        		message = "Transaction got failed!";
        	}
        }
    	return Response.status(200).entity(message).build();
    }

    public List<Integer> getCvvList() {
		List<Integer> list = new ArrayList<Integer>();
		for( int i = 150; i < 200; i++) {
			Integer cvv = i;
			list.add(cvv);
		}
    	return list;
    }
    
    
    /*@POST
    @Produces("application/json")
    @Consumes("application/json")
    @Path("/jsonBean")
    public Response modifyJson(JsonBean input) {
	input.setVal2(input.getVal1());
	return Response.ok().entity(input).build();
    }*/
}

