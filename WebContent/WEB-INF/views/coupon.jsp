<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coupon's are</title>
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

   <c:if test="${!empty couponlist}">
		<table  cellpadding="5" cellspacing="5" class="mainTable">
			<tr>
				<td>
					<h3 style="color: orange; text-align: center; size: 20px;">Coupon's
						Available -:</h3></td>
			</tr>
			<tr>
				<th align="left" bgcolor="#565656">Coupon No.</th>
				<th align="left" bgcolor="#565656">Start Date</th>
				<th align="left" bgcolor="#565656">End Date</th>
				<th align="left" bgcolor="#565656">Discount(Rs)</th>
				<th align="left" bgcolor="#565656">Status</th>
			</tr>
			<c:forEach items="${couponlist}" var="coupon">
				<tr>
					<td>${coupon.couponNo}</td>
					<td>${coupon.startDate}</td>
					<td>${coupon.endDate}</td>
					<td>${coupon.discount}</td>
					<td>${coupon.status}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
</body>
</html>