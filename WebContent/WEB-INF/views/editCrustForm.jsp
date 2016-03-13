<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Crust</title>
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
	width: 30%;
	height: 400px;
}

.label {
	width: 20px;
	font-size: x-large;
	font-family: Arial;
	margin: 10px;
}

.like {
   background-image: url("resources/images/pizza-free.jpg");
}
</style>
</head>
<body bgcolor="#668A68">

<form:form id="editCrust" method="post" modelAttribute="editCrust"  cssClass="like">
		<form:hidden path="ingredientID" />
		<form:hidden path="Category.categoryID" />
		 
			<table class="mainTable" align="center" cellpadding="5" cellspacing="5">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; font-size: x-large;">Edit
							Crusts -:</h3></td>
				</tr>
				<tr>
					<td><form:label path="ingredientName" cssClass="label">Crust Name<span> * </span></form:label>
					</td>
					<td><form:input path="ingredientName" maxlength="20"
							value="${editCrust.ingredientName}" /></td>
				</tr>
				<tr>
					<td><form:label path="psmall" cssClass="label">Price for Small<span> * </span></form:label>
					</td>
					<td><form:input path="psmall" maxlength="20"
							value="${editCrust.psmall}" /></td>
				</tr>
				<tr>
					<td><form:label path="pmedium" cssClass="label">Price for Medium<span> * </span></form:label>
					</td>
					<td><form:input path="pmedium" maxlength="20"
							value="${editCrust.pmedium}" /></td>
				</tr>
				<tr>
					<td><form:label path="plarge" cssClass="label">Price for Large<span> * </span></form:label>
					</td>
					<td><form:input path="plarge" maxlength="20"
							value="${editCrust.plarge}" /></td>
				</tr>
				<tr>
					<td><input align="middle" type="submit" value="Save"
						style="width: 100px; font-size: large;" /></td>
				</tr>
			</table>
		 
	</form:form>
	
</body>
</html>