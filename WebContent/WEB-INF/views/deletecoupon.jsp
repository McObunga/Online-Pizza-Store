<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coupons Available</title>
<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}

.mainTable {
	border-style: inset;
	font-size: large;
	margin-top: 130px;
	background-color: white;
	width: 30%;
}
</style>
</head>
<body>

	<div id="formDiv" align="justify">
		<c:if test="${!empty couponlist}">
			<table class="mainTable" cellpadding="5" cellspacing="5">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; size: 20px;">Delete
							Coupon -:</h3>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#565656">Name</th>
				</tr>
				<c:forEach items="${couponlist}" var="coupon">
					<tr>
						<td><a id="link" href="coupon/delete/${coupon.couponNo}">${coupon.couponNo}</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>