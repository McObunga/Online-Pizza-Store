<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transcation success</title>

</head>
<body bgcolor="#212121">

	<div align="center" style="margin-top: 200px;">
		<label
			style="font-style: italic; font-size: xx-large; font: bold; color: green; text-align: center; text-decoration: underline;">Your
			Transaction Was Successful </label>

		<table align="center">
			<tr>
				<td><c:if test="${user.role.roleType eq 'ROLE_ADMIN' }">
						<a href="loginadmin"><input type="button" value="" id="send"
							style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;"/>
						</a>
					</c:if> <c:if test="${user.role.roleType eq 'ROLE_USER' }">
						<a href="loginuser"><input type="button" value="" id="send"
							style="background-image: url('resources/images/hom.jpg');width: 62px; height: 55px;" />
						</a>
					</c:if> <c:if test="${user.role.roleType eq 'ROLE_BPO' }">
						<a href="loginbpo"><input type="button" value="" id="send"
							style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
						</a>
					</c:if></td>
			</tr>
		</table>
	</div>
</body>
</html>