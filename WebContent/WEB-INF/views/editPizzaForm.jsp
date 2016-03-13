<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Your Product </title>
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
<script type="text/javascript">
function validate() {
     
	var flag = false;
	var string = "Enter Pizza Name";
	var string1 = "Description For Pizza";
	var image_file = document.editPizza.image.value;
	var image_length = document.editPizza.image.value.length;
	var name = document.getElementById("name").value;
	var psmall = document.getElementById("psmall").value;
	var pmedium = document.getElementById("pmedium").value;
	var plarge = document.getElementById("plarge").value;
    var desc = document.getElementById("desc").value;
	var len = document.editPizza.list.length;
	var count = 0;

	if (image_file == "") {
		window.alert("Please choose a image");
		image_file.focus();
		flag = true;
	} else if (image_file != "") {
		var extensions = new Array("jpg","jpeg","gif","png");
		var pos = image_file.lastIndexOf('.') + 1;
		var ext = image_file.substring(pos, image_length);
		var final_ext = ext.toLowerCase();
		if(final_ext == "jpg" || final_ext == "jpeg" || final_ext == "gif" || final_ext == "png")
		   document.getElementById('image').src = image_file;
		else {
		window.alert("You must upload an image file with one of the following extensions: "+ extensions.join(', ') +".");
        image_file.focus();
        flag = true;
		}
	} 
	
	if (name == "" || name == null) {
		window.alert("Please enter a name");
		name.focus();
		flag = true;
	} else if (name == string) {
		window.alert("Enter pizza name");
		name.focus();
		flag = true;
	} else if (name.length < 5) {
		window.alert("Enter full pizza name");
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
	} if (desc == "" || desc == null) {
		window.alert("Please enter a description");
		desc.focus();
		flag = true;
	} else if (desc == string1) {
		window.alert("Enter pizza description");
		desc.focus();
		flag = true;
	}  else if (desc.length < 15) {
		window.alert("Enter full pizza description");
		name.focus();
		flag = true;
	}   else {
		for ( var i = 0; i < len; i++) {
			if (document.editPizza.list[i].checked) {
				count = 1;
			}
		}
		if (count == 0) {
			window.alert("Please select an item");
			flag = true;
		}
	} 

	if (!flag) {
		//document.editPizza.action = "addNewPizza";
		document.editPizza.submit();
	}
}

</script>
</head>
<body bgcolor="#668A68">

<form:form id="editPizza" name="editPizza" method="post" modelAttribute="editPizza"  cssClass="like" enctype="multipart/form-data">
		<form:hidden path="productID" />
		<form:hidden path="Category.categoryID" />
		 
			<table class="mainTable" align="center" cellpadding="5" cellspacing="5" rules="groups">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; font-size: x-large;">Edit
							Pizza's -:</h3></td>
				</tr>
				<tr>
					<td><form:label path="fileData" cssClass="label">Pizza Image<span> * </span></form:label>
					</td>
					<td><form:input  id="image" class="required" path="fileData"  type="file"  value="${editPizza.image}"/></td>
				</tr>
				<tr>
					<td><form:label path="productName" cssClass="label">Pizza Name<span> * </span></form:label>
					</td>
					<td><form:input id="name" path="productName" maxlength="20"
							value="${editPizza.productName}" /></td>
				</tr>
				<tr>
					<td><form:label path="psmall" cssClass="label">Price(Small)<span> * </span></form:label>
					</td>
					<td><form:input path="psmall" maxlength="20" id="psmall"
							value="${editPizza.psmall}" /></td>
				</tr>
				<tr>
					<td><form:label path="pmedium" cssClass="label">Price(Medium)<span> * </span></form:label>
					</td>
					<td><form:input path="pmedium" maxlength="20" id="pmedium"
							value="${editPizza.pmedium}" /></td>
				</tr>
				<tr>
					<td><form:label path="plarge" cssClass="label">Price(Large)<span> * </span></form:label>
					</td>
					<td><form:input path="plarge" maxlength="20" id="plarge"
							value="${editPizza.plarge}" /></td>
				</tr>
				<tr>
					<td><form:label path="description" cssClass="label">Description<span> * </span></form:label>
					</td>
					<td><form:input path="description" maxlength="100" id="desc"
							value="${editPizza.description}" /></td>
				</tr>
				<tr>
					<td><form:label path="toppingList" cssClass="label">Select Toppings<span> * </span></form:label>
					</td>
					<td><fieldset style="border: outset;"><ul>
							<c:forEach items="${toppingList}" var="topping">
								<li style="display:table-row-group;"><form:checkbox value="${topping.ingredientID}"
									name="list" id="list"
									label="${topping.ingredientName}" path="toppingList"></form:checkbox></li>
							</c:forEach></ul>
						</fieldset></td>
				</tr>
				<tr>
					<td><input type="button" value="Save"  onClick="validate()"
						style="width: 100px; font-size: large; margin-left: 200px" /></td>
				</tr>
			</table>
		 
	</form:form>
</body>
</html>