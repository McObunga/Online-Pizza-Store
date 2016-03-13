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
<title>About us</title>
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

	<s:url var="url4" value="/aboutus">
	</s:url>
	<input type="hidden" value="${url4}" id="urlID" />

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
	<img id="logo" src="resources/images/logo1.jpg" style="margin-top: 20px;" />
	<table class="mainTable" cellspacing="5">
		<tr>
			<td colspan="2" class="menuLink">
			</td>
		</tr>
	</table>
	<div align="center">
		<div align="center"
			style="background-color: #FFFFFF; width: 960px; height: 353px;">
			<div align="center" style="width: 890px; margin-top: 100px;">
				<table width="884" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="72%" align="left" valign="top" class="regtxt"
							style="padding-left: 20px;"><img
							src="resources/images/contact.jpg" alt="" /><br /> <br /> <strong>YUMMY!
								RESTAURANT INDIA </strong><br /> C21 MALL, SHOP NO. 27, GROUND FLOOR,
							A.B.ROAD <br /> INDORE - 452001 <br /> Indore, India <br /> <br />
							<strong>Tel No. </strong>: +91-731-4044555<br /></td>
					</tr>
				</table>
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

