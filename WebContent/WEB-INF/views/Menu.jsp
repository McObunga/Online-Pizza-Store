<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Our Pizza Menu</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"
	type="text/javascript">
	
</script>
<style type="text/css">
h2 {
	padding: 10px;
	font-size: 20px;
	color: #243953;
	background-color: #fafafa;
	border: 1px solid #a9a9a9;
	-moz-border-radius: 7px;  
	-webkit-border-radius: 7px;
	-khtml-border-radius: 7px;
	text-align: center;
	font-family: Georgia, "Times New Roman", Times, serif;
	margin-bottom: 5px;
	width: 250px;
}

.togglebox {
	background-color: #CCC;
	border: 1px solid #a9a9a9;
	/* Rounder Corner */
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
	-khtml-border-radius: 7px;
	overflow: hidden;
	font-size: 1.2em;
	width: 295px;
	clear: both;
	margin-bottom: 10px;
}

.togglebox .content {
	padding: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//Hide the tooglebox when page load
		$(".togglebox").hide();
		//slide up and down when hover over heading 2
		$("h2").hover(function() {
			// slide toggle effect set to slow you can set it to fast too.
			$(this).next(".togglebox").slideToggle("slow");
			return true;
		});
	});
</script>
</head>
<body bgcolor="#212121">
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
				</c:if>
			</td>
		</tr>
	</table>
	<div align="center">
		<table
			style="background-image: url('resources/images/Food.jpg'); width: 1024px; position: relative; margin-top: 10px;">
			<tr><td align="center" style=" background-color:silver;"> <h3 style=" font-family:cursive; font-weight:700; font-style: oblique; font-size: x-large;large;">WE SERVE YOUR TASTE</h3> 
			</td></tr>
			<tr>
				<td align="center"><c:if test="${!empty list}">
						<c:forEach items="${list}" var="pizza">
							<h2>${pizza.productName}</h2>
							<div class="togglebox">
								<div class="content">
									<h2>${pizza.description}</h2>
								</div>
							</div>
						</c:forEach>
					</c:if></td>
			</tr>
		</table>
		<div><a href="${url2}"><img src="resources/images/order.png" height="120px" id="order" /></a></div>
	</div>
</body>
</html>