<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Coupon</title>
<script type="text/javascript" src="resources/js/jquery-1.7.1.min.js"></script>
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
$(document).ready(function(){
	$("#datepicker").datepicker();
});
</script>
</head>
<body>

	<form:form id="addcoupon" method="post" modelAttribute="addcoupon">
		<table class="mainTable" cellpadding="5" cellspacing="5">
			<tr>
				<td>
					<h3 style="color: orange; text-align: center; font-size: x-large;">Add
						Coupon -:</h3>
				</td>
			</tr>
			<tr>
				<td><form:label path="couponNo" cssClass="label">Coupon No<span> * </span></form:label>
				</td>
				<td><form:input id="couponNo" path="couponNo" maxlength="20"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Enter Coupon No':this.value;"
						value="Enter Coupon No" />
				</td>
			</tr>
			<tr>
				<td><form:label path="startDate" cssClass="label">Start Date<span> * </span></form:label>
				</td>
				<td><form:input path="startDate" id="datepicker" type="text"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Start Of Coupon':this.value;"
						value="Start Of Coupon" />
				</td>
			</tr>
			<tr>
				<td><form:label path="endDate" cssClass="label">End Date<span> * </span></form:label>
				</td>
				<td><form:input path="endDate" id="datepicker1" type="text"
						onClick="this.value='';"
						onblur="this.value=!this.value?'End Of Coupon':this.value;"
						value="End Of Coupon" />
				</td>
			</tr>
			<tr>
				<td><form:label path="discount" cssClass="label">Discount(Rs)<span> * </span></form:label>
				</td>
				<td><form:input path="discount" maxlength="20"
						onClick="this.value='';"
						onblur="this.value=!this.value?'Discount Rs. is':this.value;"
						value="Discount Rs. is" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Save"
					style="width: 100px; font-size: large; margin-left: 200px" />
				</td>
			</tr>
		</table>

	</form:form>

</body>
</html>