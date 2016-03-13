<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>offer's are</title>
<style type="text/css">
.mainTable {
	border-style: inset;
	font-size: large;
	margin-top: 100px;
	background-color: white;
	width: 60%;
}

.error {
	color: #212121;
	font-style: italic;
}
</style>
</head>
<body>
      
      <c:if test="${!empty offerlist}">
		<table cellpadding="5" cellspacing="5" class="mainTable">
			<tr>
				<td>
					<h3 style="color: orange; text-align: center; size: 20px;">Offers
						Are -:</h3></td>
			</tr>
			<tr>
				<th align="left" bgcolor="#565656">Name</th>
				<th align="left" bgcolor="#565656">Start Date</th>
				<th align="left" bgcolor="#565656">End Date</th>
				<th align="left" bgcolor="#565656">Discount(%)</th>
				<th align="left" bgcolor="#565656">Quantity</th>
				<th align="left" bgcolor="#565656">Amount</th>
			</tr>
			<c:forEach items="${offerlist}" var="offer">
				<tr>
					<td>${offer.offerName}</td>
					<td>${offer.startDate}</td>
					<td>${offer.endDate}</td>
					<td>${offer.discount}</td>
					<td>${offer.quantity}</td>
					<td>${offer.amount}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
 
</body>
</html>