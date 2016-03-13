<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add pizza</title>
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
	width: 30%;
}

.label {
	width: 30px;
	font-size: x-large;
	font-style: oblique;
}
</style>
<script type="text/javascript">
	function validate() {
        
		var flag = false;
		var string = "Enter Pizza Name";
		var string1 = "Description For Pizza";
		var image_file = document.addPizza.image.value;
		var image_length = document.addPizza.image.value.length;
		var name = document.getElementById("name").value;
		var psmall = document.getElementById("psmall").value;
		var pmedium = document.getElementById("pmedium").value;
		var plarge = document.getElementById("plarge").value;
	    var desc = document.getElementById("desc").value;
		var len = document.addPizza.list.length;
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
				if (document.addPizza.list[i].checked) {
					count = 1;
				}
			}
			if (count == 0) {
				window.alert("Please select an item");
				flag = true;
			}
		} 

		if (!flag) {
			//document.addPizza.action = "addNewPizza";
			document.addPizza.submit();
		}
	}
</script>
</head>
<body>

	<form:form name="addPizza" id="addPizza" method="post" modelAttribute="addNewPizza"
		enctype="multipart/form-data">

		<table class="mainTable" cellpadding="5" cellspacing="5">
			<tr>
				<td>
					<h3 style="color: orange; text-align: center; font-size: x-large;">Add
						Pizza -:</h3>
				</td>
			</tr>
			<tr>
				<td><form:label path="fileData" cssClass="label">Pizza Image<span> * </span></form:label>
				</td>
				<td><form:input id="image" name="image" class="required" path="fileData"
						type="file" onClick="this.value='';"
						onblur="this.value=!this.value?'Enter Image Location':this.value;"
						value="Enter Image Location" />
				</td>
			</tr>
			<tr>
				<td><form:label path="productName" cssClass="label">Pizza Name<span> * </span></form:label>
				</td>
				<td><form:input id="name" path="productName" maxlength="20"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Enter Pizza Name':this.value;"
						value="Enter Pizza Name" />
				</td>
			</tr>
			<tr>
				<td><form:label path="psmall" cssClass="label">Price(Small)<span> * </span></form:label>
				</td>
				<td><form:input path="psmall" maxlength="20" id="psmall"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Price for Small':this.value;"
						value="Price for Small" />
				</td>
			</tr>
			<tr>
				<td><form:label path="pmedium" cssClass="label">Price(Medium)<span> * </span></form:label>
				</td>
				<td><form:input path="pmedium" maxlength="20" id="pmedium"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Price for Medium':this.value;"
						value="Price for Medium" />
				</td>
			</tr>
			<tr>
				<td><form:label path="plarge" cssClass="label">Price(Large)<span> * </span></form:label>
				</td>
				<td><form:input path="plarge" maxlength="20" id="plarge"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Price for Large':this.value;"
						value="Price for Large" />
				</td>
			</tr>
			<tr>
				<td><form:label path="description" cssClass="label">Description<span> * </span></form:label>
				</td>
				<td><form:input path="description" maxlength="100" id="desc"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Description For Pizza':this.value;"
						value="Description For Pizza" />
				</td>
			</tr>
			<tr>
				<td><form:label path="toppingList" cssClass="label">Select Toppings<span> * </span></form:label>
				</td>
				<td><fieldset style="border: outset;">
						<ul>
							<c:forEach items="${toppingList}" var="topping">
								<li style="display: table-row-group;"><form:checkbox
										value="${topping.ingredientID}"
										name="list" id="list"
										label="${topping.ingredientName}" path="toppingList"></form:checkbox>
								</li>
							</c:forEach>
						</ul>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="Save"  onClick="validate()"
					style="width: 100px; font-size: large; margin-left: 200px;" />
				</td>
			</tr>
		</table>

	</form:form>
</body>
</html>