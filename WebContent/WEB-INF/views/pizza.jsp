<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pizza Available</title>
<style type="text/css">
.mainTable {
	border-style: inset;
	font-size: large;
	margin-top: 100px;
	background-color: white;
	width: 50%;
}

.error {
	color: #212121;
	font-style: italic;
}
</style>
</head>
<body>

	<c:if test="${!empty pizzaList}">
		<table class="mainTable" cellpadding="5" cellspacing="5" >
			<tr>
				<td>
					<h3 style="color: orange; text-align: center; size: 20px;">Pizzas
						Are -:</h3></td>
			</tr>
			<tr>
				<th align="left" bgcolor="#565656" width="100">Pizza</th>
				<th align="left" bgcolor="#565656" width="100">Name</th>
				<th align="left" bgcolor="#565656" width="100">Price(Small)</th>
				<th align="left" bgcolor="#565656" width="100">Price(Medium)</th>
				<th align="left" bgcolor="#565656" width="100">Price(Large)</th>
				<th align="left" bgcolor="#565656" width="150">Description</th>
				<th align="left" bgcolor="#565656" width="150">Ingredient</th>

			</tr>
			<c:forEach items="${pizzaList}" var="product">
				<tr>
					<td><img src="${product.image}">
					</td>
					<td>${product.productName}</td>
					<td>${product.psmall}</td>
					<td>${product.pmedium}</td>
					<td>${product.plarge}</td>
					<td>${product.description}</td>
					<td><c:forEach items="${product.ingredientlist}"
							var="ingredient">
							<ul>
							<li>${ ingredient.ingredientName}</li>
							</ul>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>