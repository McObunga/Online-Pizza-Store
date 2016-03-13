<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add bpo</title>
<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}

.label {
	width: 30px;
	font-size: x-large;
	font-style: oblique;
}

.mainTable
{
	margin-top:40px;
	margin-left:10%;
	margin-right:175px;	
	background-color:#FFFFFF;
	width:70%;
	border-style: inset;
	height: 300px;
}
</style>
<script type="text/javascript">
	function test() { 
		var flag = false;
		var email = document.getElementById("userName");
		var pass = document.getElementById("password").value;
		var match = document.getElementById("confirm").value;
		var mobile = document.getElementById("userMobile").value;
		var address = document.getElementById("address").value;

		if (email.value == "") {
			window.alert("Please enter a valid e-mail address.");
			email.focus();
			flag = true;
		} else if (email.value.indexOf("@", 0) < 0) {
			window.alert("Please enter a valid e-mail address.");
			email.focus();
			flag = true;
		} else if (email.value.indexOf(".", 0) < 0) {
			window.alert("Please enter a valid e-mail address.");
			email.focus();
			flag = true;
		} 	else if (pass == "" || pass == null) {
			window.alert("Please enter a password");
			pass.focus();
			flag = true;
		} else if (pass.length < 6) {
			window.alert("Enter atleast 6 charcters");
			pass.focus();
			flag = true;
		} else if (match == "" || match == null) {
			window.alert("Please confirm your password");
			match.focus();
			flag = true;
		} else if (pass != match) {
			window.alert("Password do not match");
			pass.focus();
			flag = true;
		}else if (mobile == "") {
			alert("please Enter the Contact Number");
			document.getElementById("userMobile").focus();
			flag = true;
		} else if (isNaN(mobile)) {
			alert("Enter the valid Mobile Number(Like : 9566137117)");
			document.getElementById("userMobile").focus();
			flag = true;
		} else if (mobile.length != 10) {
			alert(" Your Mobile Number must be of 10 digits");
			document.getElementById("userMobile").select();
			flag = true;
		} else if (address == "" || address == null) {
			window.alert("Please enter a address");
			address.focus();
			flag = true;
		} 
 
		if (!flag) {
			document.userForm.action = "registerbpo";
			document.userForm.submit();
		}
	}
</script>	
</head>
<body>
    <div align="center">
	<div  align="center" style="vertical-align:middle; width: 800px; height: 800px;margin-top: 100px;">
	<form:form name="userForm" method="POST" modelAttribute="user">
		<table class="mainTable" align="center" cellpadding="5" cellspacing="5">
			<tr>
				<td><form:label path="userName" cssClass="label">
				       User Name<span> * </span>
					</form:label>
				</td>
				<td><form:input path="userName" id="userName"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Enter email-Id':this.value;"
						value="Enter email-Id" />
				</td>
				<td><form:errors path="userName" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><form:label path="userPassword" cssClass="label">
				        Password<span> * </span>
					</form:label>
				</td>
				<td><form:password path="userPassword" id="password" />
				</td>
				<td><form:errors path="userPassword" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><form:label path="confirmPassword" cssClass="label">
				      Confirm Password<span> * </span>
				</form:label>
				</td>
				<td><form:password path="confirmPassword" id="confirm" />
				</td>
				<td><form:errors path="confirmPassword" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><form:label path="userMobile" cssClass="label">
						Mobile<span> * </span>
					</form:label>
				</td>
				<td><form:input path="userMobile" id="userMobile"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Enter Mobile Number':this.value;"
						value="Enter Mobile Number" />
				</td>
			</tr>
			<tr>
				<td><form:label path="userAddress1" cssClass="label">
                       Address<span> * </span>					
					</form:label>
				</td>
				<td><form:input path="userAddress1" id="address"
						onClick="this.value='';"
						value="Enter Your address" />
				</td>
				<td><form:errors path="userAddress1" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="Save"
					style="width: 100px; font-size: large;" onclick="test();" />
				</td>
			</tr>
		</table>
	</form:form></div></div>

</body>

</html>