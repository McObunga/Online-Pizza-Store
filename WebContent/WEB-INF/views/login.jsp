<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login To Pizza Store</title>
<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}

.label {
	width: 30px;
	font-size: x-large;
	font-style: oblique;
	margin-left: 40px;
}

.mainTable {
	margin-top: 20px;
	margin-left: 11%;
	margin-right: 11%;
	background-color: #BBBB77;
	width: 80%;
	height:25%;
	border-style: inset;
}
</style>
<script type="text/javascript">
	document.getElementById("userName");
</script>
</head>
<body bgcolor="#212121">
	<form:form method="POST" modelAttribute="user" action="userlogin">
		<div align="center">
			<table
				style="background-image: url('resources/images/pizza-free.jpg'); border-style:outset; width: 800px; height: 700px;  margin-top: 50px;">
				<tr>
					<td>
						<table class="mainTable" cellspacing="0" >
							<tr align="center">
								<td><form:label path="userName" cssClass="label">
				       Username <span> * </span>
					</form:label>
								</td>
								<td><form:input path="userName" id="userName"
										onClick="this.value='';"
										onblur="this.value=!this.value?'Enter email-Id':this.value;"
										value="Enter email-Id" /></td>
								<td><form:errors path="userName" cssClass="error" /></td>
							</tr>
							<tr align="center">
								<td><form:label path="userPassword" cssClass="label">
				       Password <span> * </span>
					</form:label>
								</td>
								<td><form:password path="userPassword" /></td>
								<td><form:errors path="userPassword" cssClass="error" /></td>
							</tr>
							<tr>
								<td><br> </td>
							</tr>
							<tr align="center">
								<td><input type="submit" value="Submit"
									style="width: 100px; font-size: large; margin-left: 40px"
									name="Submit"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>