<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Topping</title>
<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}

.mainTable {
	border-style: inset;
	font-size: large;
	margin-top: 100px;
	background-color: white;
	width: 20%;
}
</style>
<%-- <script type="text/javascript">
$(document).ready(function(){
	$("a#link").click(function(){
		confirm("Are you sure?");
	});
});
</script> --%>
</head>

<body>

	<s:url var="topping" value="topping/delete/{ingredientID}"></s:url>
	<input type="hidden" value="${topping}" id="toppingvar3" />

	<div id="formDiv" align="justify">
		<c:if test="${!empty toppingList}">
			<table class="mainTable" cellpadding="5" cellspacing="5">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; size: 20px;">
							Delete Toppings -:</h3>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#565656">Name</th>
				</tr>
				<c:forEach items="${toppingList}" var="topping">
					<tr>
						<td><a id="link" href="topping/delete/${topping.ingredientID}">${topping.ingredientName}</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>