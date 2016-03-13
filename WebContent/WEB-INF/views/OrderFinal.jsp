<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Final order</title>
<style type="text/css">
.address {
	width: 100px;
	height: 50px;
	margin-left: 125px;
	margin-right: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#address').hide();

		$('#type1').click(function() {
			$('#address').show();
			$('#store').hide();
		});
		$('#type2').click(function() {
			$('#store').show();
			$('#address').hide();
		});
	});

	function sub() {
		var flag = false;
		var card = document.getElementById("card").value;
		var cvv = document.getElementById("cvv").value;
		var name = document.getElementById("name").value;

		if (card == "" || card == null) {
			window.alert("Please enter a card number");
			card.focus();
			flag = true;
		} else if (card.length < 16) {
			window.alert("Enter valid card number");
			card.focus();
			flag = true;
		} else if (cvv == "" || cvv == null) {
			window.alert("Please enter cvv number");
			cvv.focus();
			flag = true;
		} else if (cvv.length < 3) {
			window.alert("Enter valid cvv number");
			cvv.focus();
			flag = true;
		} else if (name == "" || name == null) {
			window.alert("Please enter name");
			name.focus();
			flag = true;
		} else if (name.length < 6) {
			window.alert("Enter valid name");
			name.focus();
			flag = true;
		} else if (!flag) {
			document.finalorder.action = "payment";
			document.finalorder.submit();
		}
	}
</script>
</head>
<body bgcolor="#212121">
	<form:form name="finalorder" method="POST" modelAttribute="userrecord">
		<div align="center">
			<div align="center"
				style="width: 800px; vertical-align: middle; height: 950px; margin-top: 100px; background-color: teal; border-style: inset;">
				<img src="resources/images/deliver.jpg"
					style="width: 102px; height: 75px;" align="right" />
				<div align="center" style="width: 400px; height: 250px;">
					<div align="center" style="margin-top: 20px;">
						<label
							style="font-size: x-large; font: fantasy; font-style: oblique;">I
							Would Like To Order For </label>
					</div>
					<table style="margin-top: 20px; border-style: outset;">
						<tr>
							<td align="center"><form:radiobutton path="orderType"
									value="home delivery" name="type" id="type1" /><img
								src="resources/images/homed.jpg" /> <form:radiobutton
									path="orderType" checked="checked" name="type" id="type2"
									value="take away" /><img src="resources/images/take.jpg" /></td>
						<tr>
							<td colspan="2">
								<div align="left"
									style="margin-top: 10px; margin-bottom: 10px; margin-left: 10px;"
									id="address">
									<label
										style="font-size: large; font: fantasy; font-style: italic;">DELIVERY
										ADDRESS</label>
									<form:textarea path="deliveryAddress" rows="4" cols="40" />
								</div>
								<div align="left"
									style="margin-top: 10px; margin-bottom: 10px; margin-left: 10px;"
									id="store">
									<label
										style="font-size: large; font: fantasy; font-style: italic; margin-bottom: 5px;">STORE
										ADDRESS</label>
									<textarea readonly="readonly" rows="4" cols="40">C21 MALL, SHOP NO. 27, GROUND FLOOR, A.B.ROAD, INDORE - 452001, PH.NO. 0731-4044555 
					</textarea>
								</div></td>
						</tr>
					</table>
				</div>
				<div style="width: 500px; height: 450px; margin-top: 70px"
					align="center">
					<div align="center"
						style="width: 400px; margin-top: 20px; margin-bottom: 20px;">
						<img src="resources/images/payment.jpg" />
					</div>
					<table cellspacing="25" style="border-style: groove; width: 500px;">

						<tr>
							<td><label
								style="font-size: large; font: fantasy; font-style: italic;">CARD
									NO</label></td>
							<td><form:input path="" size="20" id="card" /></td>
						</tr>
						<tr>
							<td><label
								style="font-size: large; font: fantasy; font-style: italic;">CVV
									NO</label></td>
							<td><form:input path="" size="20" name="cvv" id="cvv" /></td>
						</tr>
						<tr>
							<td><label
								style="font-size: large; font: fantasy; font-style: italic;">NAME
									ON CARD </label></td>
							<td><form:input path="" size="20" id="name" /></td>
						</tr>
						<tr>
							<td><label
								style="font-size: large; font: fantasy; font-style: italic;">AMOUNT&nbsp;<span>(Rs)</span>
							</label></td>
							<td><form:input path="" size="20"
									value="${userrecord.grandTotal}" readonly="true" />
							</td>
						</tr>
					</table>
					<div align="center" style="margin-top: 10px;">

						<table align="center">
							<tr>
								<td><input type="button" value="" id="pay" onclick="sub()"
									style="background-image: url('resources/images/pay.jpg'); height: 48px; width: 48px;" />
								</td>
							 	<td><c:if test="${user.role.roleType eq 'ROLE_ADMIN' }">
										<a href="loginadmin"><input type="button" value=""
											id="send"
											style="background-image: url('resources/images/cancel.jpg'); width: 48px; height: 48px;" />
										</a>
									</c:if> <c:if test="${user.role.roleType eq 'ROLE_USER' }">
										<a href="loginuser"><input type="button" value=""
											id="send"
											style="background-image: url('resources/images/cancel.jpg'); width: 48px; height: 48px;" />
										</a>
									</c:if> <c:if test="${user.role.roleType eq 'ROLE_BPO' }">
										<a href="loginbpo"><input type="button" value="" id="send"
											style="background-image: url('resources/images/cancel.jpg'); width: 48px; height: 48px;" />
										</a>
									</c:if></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>