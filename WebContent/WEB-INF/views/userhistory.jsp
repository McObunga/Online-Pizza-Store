<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/Home.css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User History</title>
<script src="resources/js/Home.js"></script>

<script type="text/javascript" src="resources/js/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.js"></script>

<script type="text/javascript">
	jQuery.validator.setDefaults({
		debug : true,
		success : "valid"
	});;
</script>
<script>
	$(document).ready(function() {
		$("#searchform").validate({
			rules : {
				userName : {
					required : true,
					email : true
				}
			}
		});
		$("#search").click(function() {
			var str = $("#searchform").serialize();
			var url1 = $("#find").val();
			$.ajax({
				url : url1,
				data : str,
				type : "POST",
				dataType : "html",
				success : function(result) {
					$("#history").html(result);
				}
			});
		});
	});
</script>
<style>
#field {
	margin-left: .5em;
	float: left;
}

#field,label {
	float: left;
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
}

br {
	clear: both;
}

input {
	border: 1px solid black;
	margin-bottom: .5em;
}

input.error {
	border: 1px solid red;
}

label.error {
	background:
		url('http://dev.jquery.com/view/trunk/plugins/validate/demo/images/unchecked.gif')
		no-repeat;
	padding-left: 16px;
	margin-left: .3em;
	color: black;
}

label.valid {
	background:
		url('http://dev.jquery.com/view/trunk/plugins/validate/demo/images/checked.gif')
		no-repeat;
	display: block;
	width: 16px;
	height: 16px;
	color: black;
}
</style>
</head>
<body>

	<s:url var="history" value="/search"></s:url>
	<input type="hidden" value="${history}" id="find" />

	<table align="center">
		<tr>
			<td><c:if test="${user.role.roleType eq 'ROLE_BPO' }">
					<a href="loginbpo"><input type="button" value="" id="send"
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

	<div align="center" style="height: 550px; margin-top: 100px;">
		<div align="center"
			style="background-color: #FFFFFF; width: 1300px; overflow: scroll;">

			<div id=display align="center"
				style="margin-top: 20px; margin-bottom: 10px;">
				<form:form name="searchform" id="searchform" method="POST"
					modelAttribute="user">
					<table cellspacing="5" cellpadding="5">
						<tr>
							<td><label for="field" style="color: black;"></label></td>
							<td><form:input path="userName" id="userName"
									name="userName" size="25" onClick="this.value='';"
									onblur="this.value=!this.value?'Enter User email-Id':this.value;"
									value="Enter User's email-Id" /></td>
							<td><input type="button" value="Search" id="search"
								style="width: 80px; font-size: large;" /></td>
						</tr>
					</table>
				</form:form>
			</div>

			<div id="history" align="center"
				style="width: 1280px; height: 480px; margin-top: 10px;"></div>
		</div>
	</div>

	<table class="mainTable" cellspacing="10">
		<tr>
			<td colspan="2"></td>
		</tr>
	</table>
</body>
</html>