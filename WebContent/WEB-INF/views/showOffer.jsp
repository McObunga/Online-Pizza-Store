<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/Home.css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Offer's Available</title>
<script src="resources/js/Home.js"></script>
<style type="text/css">
.regtxt {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 18px;
	font-weight: normal;
	color: #333333;
	text-decoration: none;
}
</style>
</head>
<body>

	<s:url var="url2" value="/order"></s:url>
	<input type="hidden" value="${url2}" id="option" />

	<table align="center">
		<tr>
			<td><c:if test="${user.role.roleType eq 'ROLE_ADMIN' }">
					<a href="loginadmin"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if> <c:if test="${user.role.roleType eq 'ROLE_USER' }">
					<a href="loginuser"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if> <c:if test="${user.role.roleType eq 'ROLE_BPO' }">
					<a href="loginbpo"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if></td>
		</tr>
	</table>
	<img id="logo" src="resources/images/logo1.jpg"
		style="margin-top: 20px;" />
	<table class="mainTable" cellspacing="5">
		<tr>
			<td colspan="2" class="menuLink"></td>
		</tr>
	</table>

	<div align="center" style="margin-top: 100px;">
		<div align="center"
			style="background-color: #FFFFFF; width: 1000px; height: 353px; overflow: scroll;">
			<div style="width: 790px; float: left; margin-top: 30px;">
				<c:if test="${!empty offerlist}">
					<label
						style="font-size: large; font-style: oblique; font-family: Verdana; color: #565656;">
						Offer's We Have For You... </label>
					<table width="785"
						style="border: outset; margin: 10px; float: left;"
						"cellspacing="3" cellpadding="3" rules="rows">
						<tr>
							<th align="left" bgcolor="#565656">Name</th>
							<th align="left" bgcolor="#565656">Start Date</th>
							<th align="left" bgcolor="#565656">End Date</th>
							<th align="left" bgcolor="#565656">Discount(%)</th>
							<th align="left" bgcolor="#565656">Quantity Exceeds</th>
							<th align="left" bgcolor="#565656">Amount Exceeds</th>
						</tr>
						<c:forEach items="${offerlist}" var="offer">
							<tr height="50" style="margin: 10px;">
								<td style="color: #565656;">${offer.offerName}</td>
								<td style="color: #565656;">${offer.startDate}</td>
								<td style="color: #565656;">${offer.endDate}</td>
								<td style="color: #565656;">${offer.discount}</td>
								<td style="color: #565656;">${offer.quantity}</td>
								<td style="color: #565656;">${offer.amount}</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
			<div style="float: right; margin-right: 10px;">
				<img src="resources/images/offer.jpg" />
			</div>
		</div>
	</div>

	<table class="mainTable" cellspacing="10">
		<tr>
			<td colspan="2"></td>
		</tr>
	</table>
</body>
</html>