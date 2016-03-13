<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/style.css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Your Store</title>

<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="resources/js/dmenu.js"></script>
<script type="text/javascript" src="resources/js/data.js"></script>
<script type="text/javascript" src="resources/js/jquery.datePicker-2.1.2.js"></script>

<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#top1").click(function() {
			var url1 = $("#toppingvar").val();
			$.ajax({
				url : url1,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#top2").click(function() {
			var url2 = $("#toppingvar1").val();
			$.ajax({
				url : url2,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#top3").click(function() {
			var url3 = $("#toppingvar2").val();
			$.ajax({
				url : url3,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#top4").click(function() {
			var url4 = $("#toppingvar3").val();
			$.ajax({
				url : url4,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#piz1").click(function() {
			var urlp1 = $("#pizzavar1").val();
			$.ajax({
				url : urlp1,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#piz2").click(function() {
			var urlp2 = $("#pizzavar2").val();
			$.ajax({
				url : urlp2,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#piz3").click(function() {
			var urlp3 = $("#pizzavar3").val();
			$.ajax({
				url : urlp3,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#piz4").click(function() {
			var urlp4 = $("#pizzavar4").val();
			$.ajax({
				url : urlp4,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cru1").click(function() {
			var urlp1 = $("#crustvar1").val();
			$.ajax({
				url : urlp1,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cru2").click(function() {
			var urlp2 = $("#crustvar2").val();
			$.ajax({
				url : urlp2,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cru3").click(function() {
			var urlp3 = $("#crustvar3").val();
			$.ajax({
				url : urlp3,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cru4").click(function() {
			var urlp4 = $("#crustvar4").val();
			$.ajax({
				url : urlp4,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#off1").click(function() {
			var urlo1 = $("#offer1").val();
			$.ajax({
				url : urlo1,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cou1").click(function() {
			var urlo1 = $("#coupon1").val();
			$.ajax({
				url : urlo1,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#off2").click(function() {
			var urlo2 = $("#offer2").val();
			$.ajax({
				url : urlo2,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cou2").click(function() {
			var urlo2 = $("#coupon2").val();
			$.ajax({
				url : urlo2,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#off3").click(function() {
			var urlo3 = $("#offer3").val();
			$.ajax({
				url : urlo3,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#cou3").click(function() {
			var urlo2 = $("#coupon3").val();
			$.ajax({
				url : urlo2,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
		$("#bpo1").click(function() {
			var urlb = $("#bpo").val();
			$.ajax({
				url : urlb,
				success : function(result) {
					$("#toppingDiv").html(result);
				}
			});
		});
	});
</script>
</head>

<body style="background-image: url('resources/images/pizza3.jpg');"
	bgcolor="#A52A2A">

	<s:url var="topping" value="/topping"></s:url>
	<input type="hidden" value="${topping}" id="toppingvar" />

	<s:url var="topping" value="/addToppingForm"></s:url>
	<input type="hidden" value="${topping}" id="toppingvar1" />

	<s:url var="topping" value="/editTopping"></s:url>
	<input type="hidden" value="${topping}" id="toppingvar2" />

	<s:url var="topping" value="/deleteTopping"></s:url>
	<input type="hidden" value="${topping}" id="toppingvar3" />

	<s:url var="pizza" value="/pizza"></s:url>
	<input type="hidden" value="${pizza}" id="pizzavar1" />

	<s:url var="pizza" value="/addNewPizza"></s:url>
	<input type="hidden" value="${pizza}" id="pizzavar2" />

	<s:url var="pizza" value="/editPizza"></s:url>
	<input type="hidden" value="${pizza}" id="pizzavar3" />

	<s:url var="pizza" value="/deletePizza"></s:url>
	<input type="hidden" value="${pizza}" id="pizzavar4" />

	<s:url var="crust" value="/crust"></s:url>
	<input type="hidden" value="${crust}" id="crustvar1" />

	<s:url var="crust" value="/addCrustForm"></s:url>
	<input type="hidden" value="${crust}" id="crustvar2" />

	<s:url var="crust" value="/editCrust"></s:url>
	<input type="hidden" value="${crust}" id="crustvar3" />

	<s:url var="crust" value="/deleteCrust"></s:url>
	<input type="hidden" value="${crust}" id="crustvar4" />

    <s:url var="offer" value="/offer"></s:url>
	<input type="hidden" value="${offer}" id="offer1" />
	
	<s:url var="coupon" value="/coupon"></s:url>
	<input type="hidden" value="${coupon}" id="coupon1" />
	
	<s:url var="offer" value="/addOffer"></s:url>
	<input type="hidden" value="${offer}" id="offer2" />
	
	<s:url var="coupon" value="/addCoupon"></s:url>
	<input type="hidden" value="${coupon}" id="coupon2" />
	
	<s:url var="offer" value="/deleteOffer"></s:url>
	<input type="hidden" value="${offer}" id="offer3" />
	
	<s:url var="coupon" value="/deleteCoupon"></s:url>
	<input type="hidden" value="${coupon}" id="coupon3" />
		
	<s:url var="bpo" value="/addbpo"></s:url>
	<input type="hidden" value="${bpo}" id="bpo" />

    <table align="center">
		<tr>
			<td><c:if test="${user.role.roleType eq 'ROLE_ADMIN' }">
					<a href="loginadmin"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if> 
			</td>
		</tr>
	</table>
	
	<div id="formDiv" align="justify">
		<div align="justify">
			<font size="30px" style="font-family: inherit; font-style: oblique;">
				Manage Your Store </font>
		</div>
		<ul id="dark-orange-menu" style="margin-top: 30px">

			<li class="istylei0"><a class="istylei0" href="#"><span>Pizza</span>
			</a>
				<ul class="istylem0" style="width: 152px;">
					<li><a id="piz1">View Pizza</a></li>
					<li><a id="piz2">Add Pizza</a></li>
					<li><a id="piz3">Edit Pizza</a></li>
					<li><a id="piz4">Delete Pizza</a></li>
				</ul>
			</li>

			<li class="istylei0"><a class="istylei0" href="#"><span>Topping</span>
			</a>
				<ul class="istylem0" style="width: 152px;">
					<li><a id="top1">View Topping</a></li>
					<li><a id="top2">Add Topping</a></li>
					<li><a id="top3">Edit Topping</a></li>
					<li><a id="top4">Delete Topping</a></li>
				</ul>
			</li>

			<li class="istylei0"><a class="istylei0" href="#"><span>Crust</span>
			</a>
				<ul class="istylem0" style="width: 152px;">
					<li><a id="cru1">View Crust</a></li>
					<li><a id="cru2">Add Crust</a></li>
					<li><a id="cru3">Edit Crust</a></li>
					<li><a id="cru4">Delete Crust</a></li>
				</ul>
			</li>

			<li class="istylei0"><a class="istylei0" href="#"><span>Scheme</span>
			</a>
				<ul class="istylem0" style="width: 152px;">
					<li><a id="view">View</a>
						<ul class="istylem0" style="width: 110px;">
							<li><a id="off1">Offer</a>
							</li>
							<li><a id="cou1">Coupon</a>
							</li>
						</ul></li>
					<li><a id="add">Add</a>
						<ul class="istylem0" style="width: 110px;">
							<li><a id="off2">Offer</a>
							</li>
							<li><a id="cou2">Coupon</a>
							</li>
						</ul></li>
					<li><a id="delete">Delete</a>
						<ul class="istylem0" style="width: 110px;">
							<li><a id="off3">Offer</a>
							</li>
							<li><a id="cou3">Coupon</a>
							</li>
						</ul></li>
				</ul>
			</li>

			<li class="istylei0"><a class="istylei0" href="#"><span>Employee</span>
			</a>
				<ul class="istylem0" style="width: 152px;">
					<li><a id="bpo1">Add BPO</a></li>
				</ul>
			</li>

		</ul>
	</div>
	<div id="toppingDiv"></div>
</body>

</html>