<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/Home.css"
	media="all" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>user registration</title>
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
	margin-top:80px;
	margin-left:10%;
	margin-right:10%;	
	background-color:#BBBB77;
	width:50%;
	border-style: inset;
}
</style>

<script type="text/javascript">
	function validate() {

		var flag = false;
		var email = document.getElementById("userName");
		var pass = document.getElementById("password").value;
		var match = document.getElementById("confirm").value;
		var mobile = document.getElementById("userMobile").value;
		var address = document.getElementById("address").value;
		var len = document.userForm.list.length;
		var count = 0;

		if (email.value == "") {
			window.alert("Please enter e-mail address.");
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
		} else if (pass == "" || pass == null) {
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
		} else if (mobile == "") {
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
		} else if (address.length < 10) {
			window.alert("Enter atleast 10 charcters");
			address.focus();
			flag = true;
		} else {
			for ( var i = 0; i < len; i++) {
				if (document.userForm.list[i].checked) {
					count = 1;
				}
			}
			if (count == 0) {
				window.alert("Please select an item");
				flag = true;
			}
		}

		if (!flag) {
			document.userForm.action = "register";
			document.userForm.submit();
		}
	}
</script>
</head>

<body bgcolor="#212121">
   <div align="center">
	<div  align="center" style="vertical-align:middle; background-image: url('resources/images/pizza-free.jpg');border:outset; width: 1000px; height: 1000px;">
	<h2 style="font-family: cursive;font-size: xx-large; font-style: oblique;font-stretch: ultra-condensed;">User Registration</h2>
	<form:form name="userForm" method="POST" modelAttribute="user">

		<table class="mainTable" align="center" cellspacing="5" height="600" width="700">
			<tr>
				<td><form:label path="userName" cssClass="label">
				       Username <span> * </span>
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
				        Password <span> * </span>
					</form:label>
				</td>
				<td><form:password path="userPassword" id="password" />
				</td>
				<td><form:errors path="userPassword" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><form:label path="confirmPassword" cssClass="label">
				      Confirm Password <span> * </span>
				</form:label>
				</td>
				<td><form:password path="confirmPassword" id="confirm" />
				</td>
				<td><form:errors path="confirmPassword" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><form:label path="userMobile" cssClass="label">
						Mobile <span> * </span>
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
                       Address	<span> * </span>					
					</form:label>
				</td>
				<td><form:input path="userAddress1" id="address"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Enter Your address':this.value;"
						value="Enter Your address" />
				</td>
				<td><form:errors path="userAddress1" cssClass="error" />
				</td>
			</tr>
			
			<tr>
				<td><form:label path="pizzalist" cssClass="label">Give Your Preferences <span> * </span></form:label>
				<td><fieldset style="width: 210px; float: right;">
						<ul>
							<c:forEach items="${pizzalist}" var="pizza">
								<li style="display: table-row-group;"><form:checkbox
										value="${pizza.productID}" name="list" id="list"
										label="${pizza.productName}" path="pizzalist"></form:checkbox>
								</li>
							</c:forEach>
						</ul>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="Save"
					style="width: 100px; font-size: large;" onClick="validate()" />
				</td>
			</tr>
		</table>
	</form:form></div></div>
</body>
</html>