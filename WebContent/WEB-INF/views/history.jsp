<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/Home.css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>
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

	<table align="center" cellpadding="5" cellspacing="5">
		<tr>
			<td><c:if test="${user.role.roleType eq 'ROLE_USER' }">
					<a href="loginuser"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if>
			</td>
		</tr>
	</table>
	<img id="logo" src="resources/images/logo1.jpg"
		style="margin-top: 20px;" />
	<table class="mainTable" cellspacing="5">
		<tr>
			<td colspan="2" class="menuLink"></td>
		</tr>
	</table>

	<div align="center" style="height: 500px; margin-top: 100px;">
		<div align="center"
			style="background-color: #FFFFFF; width: 1300px; overflow: scroll;">
			<div align="center" style="width: 1280px; height: 480px;">
				<c:if test="${empty userrecord }">
					<br />
					<label
						style="font-size: x-large; font-style: oblique; font-family: Verdana; color: #565656;">
						You Haven't Ordered Anything </label>
					<div style="margin-top: 50px;">
						<marquee behavior="scroll" direction="left" width="800"
							height="120" truespeed="truespeed">
							<label
								style="font-size: x-large; font-style: oblique; font-family: Arial; color: #565656; margin-top: 30px;">
								Place An Order &amp; Become Fan Of Us.....</label>
						</marquee>
					</div>
					<br />
					<br />
					<div align="center" style="margin-bottom: 20px;">
						<a href="${url2}"><img src="resources/images/order.png"
							height="80px" id="order" /> </a>
					</div>
				</c:if>
				<c:if test="${!empty userrecord}">
					<div align="center" style="margin-top: 10px; margin-bottom: 20px;">
						<label
							style="font-size: x-large; font-style: italic; font-family: Verdana; color: #565656; text-decoration: underline;">
							Your Past Order's</label>
					</div>
					<table width="1250" border="0" cellspacing="3" cellpadding="3"
						align="center" style="border: outset; margin-bottom: 5px;"
						rules="rows">
						<tr>
							<th align="left" bgcolor="#565656" width="90" style="color: #FFFFFF;">Order ID</th>
							<th align="left" bgcolor="#565656" width="130" style="color: #FFFFFF;">Order Date</th>
							<th align="left" bgcolor="#565656" width="140" style="color: #FFFFFF;">Order Type</th>
							<th align="left" bgcolor="#565656" width="120" style="color: #FFFFFF;">Amount&nbsp;<span>(Rs)</span></th>
							<th align="left" bgcolor="#565656" width="130" style="color: #FFFFFF;">Discount&nbsp;<span>(Rs)</span></th>
						</tr>
						<c:forEach items="${userrecord}" var="order">
							<tr style="margin-top: 5px; margin-bottom: 5px;">
								<td align="left" valign="top" class="regtxt">${order.orderID}</td>
								<td align="left" valign="top" class="regtxt">${order.orderDate}</td>
								<td align="left" valign="top" class="regtxt">${order.orderType}</td>
								<td align="left" valign="top" class="regtxt">${order.amount}</td>
								<td align="left" valign="top" class="regtxt">${order.discount}</td>
								<td align="left" valign="top"><table border="0"
										cellspacing="3" cellpadding="3" align="center" rules="groups"
										style="border: inset; margin-top: 5px; margin-bottom: 5px;">
										<tr>
											<th align="left" bgcolor="#565656" width="100" style="color: #FFFFFF;">Detail ID</th>
											<th align="left" bgcolor="#565656" width="130" style="color: #FFFFFF;">Pizza
												Name</th>
											<th align="left" bgcolor="#565656" width="100" style="color: #FFFFFF;">Size</th>
											<th align="left" bgcolor="#565656" width="100" style="color: #FFFFFF;">Quantity</th>
											<th align="left" bgcolor="#565656" width="100" style="color: #FFFFFF;">Price&nbsp;<span>(Rs)</span></th>
										</tr>
										<c:forEach items="${order.orderlist}" var="pizza">
											<tr>
												<td align="left" valign="top" class="regtxt">${pizza.detailID}</td>
												<td align="left" valign="top" class="regtxt">${pizza.product.productName}</td>
												<td align="left" valign="top" class="regtxt">${pizza.size}</td>
												<td align="left" valign="top" class="regtxt">${pizza.quantity}</td>
												<td align="left" valign="top" class="regtxt">${pizza.price}</td>
											</tr>
										</c:forEach>
									</table></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
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