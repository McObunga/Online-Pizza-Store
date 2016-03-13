<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Crust</title>
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
	width: 40%;
}

.label {
	width: 30px;
	font-size: x-large;
	font-style: oblique;	
}
</style>
<script type="text/javascript">
	document.getElementById("name").focus();
	function validate() {
		var flag = false;	
		var string = "Enter Crust Name";
		var name = document.getElementById("name").value;
		var psmall = document.getElementById("psmall").value;
		var pmedium = document.getElementById("pmedium").value;
		var plarge = document.getElementById("plarge").value; 

		if (name == "" || name == null) {
			window.alert("Please enter a name");
			name.focus();
			flag = true;
		} else if (name == string) {
			window.alert("Enter Crust name");
			name.focus();
			flag = true;
		} else if (name.length < 5) {
			window.alert("Enter full Crust name");
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
			document.addCrust.submit();
		}
	}
</script>
</head>
<body>

<form:form id="addCrust" name="addCrust" method="post" modelAttribute="addNewCrust">
		 
			<table class="mainTable" cellpadding="5" cellspacing="5">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; font-size: x-large;">Add
							Crust -:</h3></td>
				</tr>
				<tr>
					<td><form:label path="ingredientName" cssClass="label">Crust Name<span> * </span></form:label>
					</td>
					<td><form:input id="name" path="ingredientName" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'Enter Crust Name':this.value;"
							value="Enter Crust Name" /></td>
				</tr>
				<tr>
					<td><form:label path="psmall" cssClass="label">Price for Small<span> * </span></form:label>
					</td>
					<td><form:input path="psmall" id="psmall" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'Price For Small Size':this.value;"
							value="Price For Small Size" /></td>
				</tr>
				<tr>
					<td><form:label path="pmedium" cssClass="label">Price for Medium<span> * </span></form:label>
					</td>
					<td><form:input path="pmedium" id="pmedium" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'Price For Medium Size':this.value;"
							value="Price For Medium Size" /></td>
				</tr>
				<tr>
					<td><form:label path="plarge" cssClass="label">Price for Large<span> * </span></form:label>
					</td>
					<td><form:input path="plarge" id="plarge" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'Price For Large Size':this.value;"
							value="Price For Large Size" /></td>
				</tr>
				<tr>
					<td><input type="button" value="Save" onClick="validate()"
						style="width: 100px; font-size: large; margin-left: 200px" /></td>
				</tr>
			</table>
		 
	</form:form>
	
</body>
</html>