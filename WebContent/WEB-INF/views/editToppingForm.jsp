<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Topping</title>
<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}

.mainTable {
	border-style: inset;
	font-size: large;
	margin-top: 50px;
	background-color:#FFFFFF;
	width: 40%;
	height: 400px;
}

.label {
	width: 30px;
	font-size: x-large;
	font-family: Arial;
	margin: 10px;
}

.like {
   background-image: url("resources/images/pizza-free.jpg");
}
</style>
<script type="text/javascript">
function validate() {
	var flag = false;	
	var string = "Enter Topping Name";
	var name = document.getElementById("name").value;
	var psmall = document.getElementById("psmall").value;
	var pmedium = document.getElementById("pmedium").value;
	var plarge = document.getElementById("plarge").value; 

	if (name == "" || name == null) {
		window.alert("Please enter a name");
		name.focus();
		flag = true;
	} else if (name == string) {
		window.alert("Enter Topping name");
		name.focus();
		flag = true;
	} else if (name.length < 5) {
		window.alert("Enter full Topping name");
		name.focus();
		flag = true;
	}  else if (psmall == "") {
		window.alert("please Enter the price");
		document.getElementById("psmall").focus();
		flag = true;
	}  else if (isNaN(psmall)) {
		window.alert("Enter the price in number");
		document.getElementById("psmall").focus();
		flag = true;
	}  else if (pmedium == "") {
		window.alert("please Enter the price");
		document.getElementById("pmedium").focus();
		flag = true;
	}  else if (isNaN(pmedium)) {
		window.alert("Enter the price in number");
		document.getElementById("pmedium").focus();
		flag = true;
	}  else if (plarge == "") {
		alert("please Enter the price");
		document.getElementById("plarge").focus();
		flag = true;
	}  else if (isNaN(plarge)) {
		alert("Enter the price in number");
		document.getElementById("plarge").focus();
		flag = true;
	}  
	if (!flag) {
		//document.addPizza.action = "addNewPizza";
		document.editTopping.submit();
	}
}
</script>
</head>

<body bgcolor="#668A68">
	<form:form id="editTopping" name="editTopping" method="post" modelAttribute="editTopping"  cssClass="like">
		<form:hidden path="ingredientID" />
		<form:hidden path="Category.categoryID" />
		 
			<table class="mainTable" align="center" cellpadding="5" cellspacing="5">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; font-size: x-large;">Edit
							Toppings -:</h3></td>
				</tr>
				<tr>
					<td><form:label path="ingredientName" cssClass="label">Topping Name<span> * </span></form:label>
					</td>
					<td><form:input path="ingredientName" maxlength="20" id="name"
							value="${editTopping.ingredientName}" /></td>
				</tr>
				<tr>
					<td><form:label path="psmall" cssClass="label">Price for Small<span> * </span></form:label>
					</td>
					<td><form:input path="psmall" maxlength="20" id="psmall"
							value="${editTopping.psmall}" /></td>
				</tr>
				<tr>
					<td><form:label path="pmedium" cssClass="label">Price for Medium<span> * </span></form:label>
					</td>
					<td><form:input path="pmedium" maxlength="20" id="pmedium"
							value="${editTopping.pmedium}" /></td>
				</tr>
				<tr>
					<td><form:label path="plarge" cssClass="label">Price for Large<span> * </span></form:label>
					</td>
					<td><form:input path="plarge" maxlength="20" id="plarge"
							value="${editTopping.plarge}" /></td>
				</tr>
				<tr>
					<td><input align="middle" type="button" value="Save"  onClick="validate()"
						style="width: 100px; font-size: large;" /></td>
				</tr>
			</table>
		 
	</form:form>
</body>
</html>