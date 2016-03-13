<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Crust's</title>
<style type="text/css">
 .mainTable
{
    border-style:inset;
    font-size:large;
	margin-top:100px;
	background-color:  white;
	width:50%;
}

.error {
	color: #212121;
	font-style: italic;
}
</style>
</head>
<body>

<c:if test="${!empty crustList}">
		<table class="mainTable" cellpadding="5" cellspacing="5" >
            <tr>
               <td> <h3 style="color: orange;text-align: center;size: 20px;">Crust's Are -:</h3> </td>
            </tr>
			<tr>
				<th align="left" bgcolor="#565656">Name</th>
				<th align="left" bgcolor="#565656">Small(Rs)</th>
				<th align="left" bgcolor="#565656">Medium(Rs)</th>
				<th align="left" bgcolor="#565656">Large(Rs)</th>
				 
			</tr>
			<c:forEach items="${crustList}" var="Crust">
				<tr>
					<td>${Crust.ingredientName}</td>
					<td>${Crust.psmall}</td>
					<td>${Crust.pmedium}</td>
					<td>${Crust.plarge}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
</body>
</html>