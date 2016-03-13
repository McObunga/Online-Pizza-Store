<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/file.css" type="text/css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Order</title>
<script src="resources/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.hashchange.min.js"
	type="text/javascript"></script>
<script src="resources/js/jquery.easytabs.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tab-container').easytabs();
		$('#addition').easytabs();
		$('#addition').hide();
		//$('#cart').hide();
		$('.link').click(function() {
			$('#addition').show();
		});
		$('.spinner_up').click(function(){
			quant();
		});
		$('.spinner_down').click(function(){
			quant();
		});
		$("#add").click(function() {
			getAddon();
			var str = $("#order").serialize();
			var url2 = $("#option").val();
			$.ajax({
				url : url2,
				data : str,
				type : "POST",
				dataType : "html",
				success : function(result) {
					$("#cart").html(result);
					total();
				}
			});
			
		});
		
		function getAddon() {
			var len1 = document.order.toppings.length;
			var count1 = 0;
			for ( var i = 0; i < len1; i++) {
				if (document.order.toppings[i].checked) {
					count1 = 1;
				}
			}
			if (count1 == 0) {
				window.alert("Please select any topping(s) of your choice");
				return false;
			}
			var len2 = document.order.crust.length;
			var count2 = 0;
			for ( var i = 0; i < len2; i++) {
				if (document.order.crust[i].checked) {
					count2 = 1;
					return true;
				}
			}
			if (count2 == 0) {
				window.alert("Please select anyone crust of your choice");
				return false;
			}
		}
		
		
		$("#redeem").click(function(){
			var couponNo = document.getElementById("coupon").value;
			var coupons = document.getElementsByName("couponlist");
			var string = "Enter Coupon Number";
			 if(document.getElementById("coupon").value == string) {
				 alert("Please Enter coupon No.");
				 return false;
			 }
			for(var i=0; i < coupons.length; i++){ 
				if(coupons[i].getAttribute('status') == "false") {
					alert("Sorry! This coupon has been used.");
					return false;
				}
				if(couponNo == coupons[i].getAttribute("coupon")){ 
					alert("You Got Discount Rs." + "  " + coupons[i].getAttribute("discount"));
					document.getElementById("discount").value = coupons[i].getAttribute("discount");
					document.getElementById("grandTotal").value = document.getElementById("amount").value - document.getElementById("discount").value;
					return false;
				}
			}	
			if(document.getElementById("discount").value == 0) {		
			   alert("Enter Valid Coupon No.");	        
			}
		});
	});
	
	function total() {
		document.getElementById("amount").value = document.getElementById("total").getAttribute('value');
		document.getElementById("grandTotal").value = document.getElementById("amount").value - document.getElementById("discount").value;
	} 
	
	function checkcart() {
		var grand = document.getElementById("grandTotal").value;
		if(Number(grand) == 0) {
			alert("Please select any pizza in your cart.");
			return false;
		} else {
			alert1();
		}
		
	}
	function hide() {
		$('#addition').hide();
		TotalPrice = 0;
		priceT = 0;
		priceC = 0;
		priceP = 0;
		quan = 1;
		var i;
		document.getElementById("Quantity").value = 1;
		var toplist = document.getElementsByName("toppings");
		for(i=0; i < toplist.length; i++) {
			if(toplist[i].checked == true) {
				toplist[i].checked = false;
			}
		}
		var crulist = document.getElementsByName("crust");
		for(var i=0; i < crulist.length; i++) {
			if(crulist[i].checked == true) {
				crulist[i].checked = false;
			}
		}
	}
	
	 var sizes, selectedsize = "psmall", quan = 1, selectedpizzaID, priceT = 0, priceP = 0, priceC = 0, temp, TotalPrice = 0;
		
		function getSize() {
		sizes = document.getElementsByName("size");
	    for (var x=0; x < sizes.length; x++) {
	      if(sizes[x].checked) {
	    	 selectedsize = sizes[x].value;
	      }	
	     }
		}
		
	 function gettid(toppingId) {
		var i;
		priceT = 0, temp = 0;
		var toplist = document.getElementsByName("toppings");
		for(i=0; i < toplist.length; i++) {
			if(toplist[i].checked == true) {
				if(selectedsize == "psmall") {
				  temp =  Number(temp) + Number(document.getElementById('topping'+toppingId).getAttribute('Tsmall'));
				} else  if(selectedsize == "pmedium") {
					temp = Number(temp) + Number(document.getElementById('topping'+toppingId).getAttribute('Tmedium'));
				} else  if(selectedsize == "plarge") {
					temp = Number(temp) + Number(document.getElementById('topping'+toppingId).getAttribute('Tlarge'));
				}
			}
			priceT =  Number(temp);
		}
		calculate();
	}
	
	function getcid(crustId) {
		var i;
		priceC = 0, temp = 0;
		var crulist = document.getElementsByName("crust");
		for(var i=0; i < crulist.length; i++) {
			if(crulist[i].checked == true) {
				if(selectedsize == "psmall") {
					temp = Number(temp) + Number(document.getElementById('crust'+crustId).getAttribute('Csmall'));
				} else  if(selectedsize == "pmedium") {
					temp = Number(temp) + Number(document.getElementById('crust'+crustId).getAttribute('Cmedium'));
				} else  if(selectedsize == "plarge") {
					temp = Number(temp) + Number(document.getElementById('crust'+crustId).getAttribute('Clarge'));
				} 
			}
			priceC = Number(temp);
		}
		calculate();
	}
	 
	 
    function getpid(productId) {
    	hide();
    	priceP = 0;
		//selectedpizzaID = productId;
		document.getElementById("productID").value = productId;
		if(selectedsize == "psmall") {
			priceP = document.getElementById('small'+productId).getAttribute('price');
			}
		else if(selectedsize == "pmedium") {
			priceP = document.getElementById('medium'+productId).getAttribute('price');
		}
		else if(selectedsize == "plarge") {
			priceP = document.getElementById('large'+productId).getAttribute('price');
		}
		calculate();
	}
	
    function quant() {
        quan = parseInt(document.getElementById("Quantity").value);
        calculate();
    }
    
	function calculate() {
		TotalPrice = Number(priceP) + Number(priceT) + Number(priceC); 
		TotalPrice = Number(TotalPrice) * quan;
		document.getElementById("price").value = TotalPrice;
	}
	
	function alert1() {
         document.cart.submit();
	}
</script>
<style type="text/css">
.link {
	margin-top: 4px;
}

.cpn {
	margin-top: 30px;
	height: 25px;
}
</style>
</head>
<body bgcolor="#212121">

	<s:url var="url2" value="/order"></s:url>
	<input type="hidden" value="${url2}" id="option" />

	<s:url var="url" value="login"></s:url>
	<input type="hidden" value="${url}" id="urlID2" />

	<c:forEach items="${couponlist}" var="coupon">
		<input id="couponlist${Id}" name="couponlist"
			coupon="${coupon.couponNo}" startdate="${coupon.startDate}"
			endate="${coupon.endDate}" status="${coupon.status}"
			discount="${coupon.discount}" type="hidden" />
	</c:forEach>



	<c:if test="${empty user.userName}">
		<c:redirect url="${url}">
		</c:redirect>
	</c:if>

	<table align="center">
		<tr>
			<td><c:if test="${user.role.roleType eq 'ROLE_ADMIN' }">
					<a href="loginadmin"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if> <c:if test="${user.role.roleType eq 'ROLE_USER' }">
					<a href="loginuser"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if> <c:if test="${user.role.roleType eq 'ROLE_BPO' }">
					<a href="loginbpo"><input type="button" value="" id="send"
						style="background-image: url('resources/images/hom.jpg'); width: 62px; height: 55px;" />
					</a>
				</c:if></td>
		</tr>
	</table>

	<table align="center"
		style="border-style: inset; border-color: black; background-color: #FFFFCC">
		<tr>
			<td colspan="2" align="center"><img
				src="resources/images/imgres.jpg" style="border-style: outset;" /></td>
		</tr>
		<tr>
			<form:form method="POST" modelAttribute="order" name="order"
				id="order">
				<form:input type="hidden" path="product.productID" id="productID" />
				<td><c:if test="${not empty user.userName}">
						<div style="width: 700px; margin-left: 270px; margin-top: 20px"
							align="center">
							<table
								style="border: dotted; border-color: gray; background-color: white;">
								<tr>
									<td><form:radiobutton path="size" name="group"
											value="psmall" id="r1" checked="checked" onchange="getSize()"
											onclick="hide()" /> <img src="resources/images/small.png" />
										<form:radiobutton path="size" name="group" id="r2"
											value="pmedium" onchange="getSize()" onclick="hide()" /> <img
										src="resources/images/medium.png" /> <form:radiobutton
											path="size" name="group" id="r3" value="plarge"
											onchange="getSize()" onclick="hide()" /> <img
										src="resources/images/large.png" /></td>
								</tr>
							</table>
						</div>

						<div id="tab-container" class='tab-container'
							style="width: 700px; margin-left: 150px; margin-top: 1px">
							<ul class='etabs'>
								<li class='tab'><a href="#tabs1-html"
									style="font-size: x-large;">Your Pizza</a>
								</li>
								<li class='tab'><a href="#tabs1-js"
									style="font-size: x-large;">Have Sides</a>
								</li>
							</ul>
							<div class='panel-container'>
								<div id="tabs1-html" style="background-color: #BBBB77;">
									<c:if test="${!empty pizzalist}">
										<table cellspacing="15" align="center">
											<c:forEach items="${pizzalist}" var="pizza"
												varStatus="status">
												<c:if test="${status.count % 3 == 1}">
													<tr style="overflow: scroll">
												</c:if>
												<td>
													<div align="center" style="width: 200px;">
														<fieldset style="border-style: dashed;">
															<img src="${pizza.image}" style="margin-bottom: 5px;"><br>
															<form:label path="product" id="${pizza.productID}"
																style="text-decoration: blink; font-size: large; font: fantasy; font-style: italic; background-color: #eee;">${pizza.productName}</form:label>
															<br>
															<form:label style="text-decoration: underline;"
																path="product" id="small${pizza.productID}"
																price="${pizza.psmall}">${pizza.psmall}</form:label>
															<span>|</span>
															<form:label style="text-decoration: underline;"
																path="product" id="medium${pizza.productID}"
																price="${pizza.pmedium}">${pizza.pmedium}</form:label>
															<span>|</span>
															<form:label style="text-decoration: underline;"
																path="product" id="large${pizza.productID}"
																price="${pizza.plarge}">${pizza.plarge}</form:label>
															<br>
															<form:input size="50px" value="Add Pizza" path="product"
																type="button" onclick="getpid(${pizza.productID})"
																cssClass="link" id="pizza${pizza.productID}" />
														</fieldset>
													</div></td>
												<c:if test="${status.count % 3 == 0}">
													</tr>
												</c:if>
											</c:forEach>
										</table>
									</c:if>
								</div>
								<div id="tabs1-js" style="background-color: #BBBB77;">
									<h2>We Would Come with Sides As Well</h2>
								</div>
							</div>
						</div>
					</c:if> <!-- Displays the available toppings ang crust for Pizza's -->
					<div id="addition" class='tab-container'
						style="width: 700px; margin-left: 150px; margin-top: 20px">
						<ul class='etabs'>
							<li class='tab'><a href="#top"
								style="font-size: x-large; font-style: italic;">Your Taste</a>
							</li>
							<!-- <li class='tab'><a href="#crus" style="font-size: x-large;">Select
									Crust</a>
							</li> -->
						</ul>

						<div class='panel-container'>
							<div id="top" style="background-color: #BBBB77;">
								<c:if test="${!empty toppinglist}">
									<table cellspacing="10" align="center"
										style="border-style: outset; border-color: white; margin-bottom: 5px; margin-top: 5px; margin-left: 5px; margin-right: 5px">
										<legend
											style="font-style: italic; font-size: x-large; font: bold; color: green; text-align: center; text-decoration: underline;">Topping's</legend>
										<c:forEach items="${toppinglist}" var="topping"
											varStatus="status">
											<c:if test="${status.count % 3 == 1}">
												<tr style="overflow: scroll">
											</c:if>
											<td>
												<div align="justify" style="width: 205px">
													<form:checkbox cssClass="check"
														value="${topping.ingredientID}" name="toppings"
														id="topping${topping.ingredientID}"
														Tsmall="${topping.psmall}" Tmedium="${topping.pmedium}"
														Tlarge="${topping.plarge}"
														label="${topping.ingredientName}(${topping.psmall}|${topping.pmedium}|${topping.plarge})"
														path="toppings" onchange="gettid(${topping.ingredientID})"></form:checkbox>
												</div>
											</td>
											<c:if test="${status.count % 3 == 0}">
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</c:if>
								<c:if test="${!empty crustlist}">
									<table cellspacing="10" align="center"
										style="border-style: outset; border-color: white; margin-bottom: 5px; margin-top: 5px; margin-left: 5px; margin-right: 5px">
										<legend
											style="font-style: italic; font-size: x-large; font: bold; color: green; text-align: center; text-decoration: underline;">Crust's</legend>
										<c:forEach items="${crustlist}" var="crustjs"
											varStatus="status">
											<c:if test="${status.count % 3 == 1}">
												<tr style="overflow: scroll">
											</c:if>
											<td>
												<div align="justify" style="width: 205px">
													<form:radiobutton cssClass="check"
														value="${crustjs.ingredientID}" name="crust"
														id="crust${crustjs.ingredientID}"
														Csmall="${crustjs.psmall}" Cmedium="${crustjs.pmedium}"
														Clarge="${crustjs.plarge}"
														label="${crustjs.ingredientName}(${crustjs.psmall}|${crustjs.pmedium}|${crustjs.plarge})"
														path="crust" onchange="getcid(${crustjs.ingredientID})"></form:radiobutton>
												</div>
											</td>
											<c:if test="${status.count % 3 == 0}">
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</c:if>
							</div>

							<%-- <div id="crus" style="background-color: #BBBB88;">
								<c:if test="${!empty crustlist}">
									<table cellspacing="20" align="center">
										<c:forEach items="${crustlist}" var="crustjs" varStatus="status">
											<c:if test="${status.count % 3 == 1}">
												<tr style="overflow: scroll">
											</c:if>
											<td>
												<div align="justify" style="width: 210px">
													<form:radiobutton cssClass="check"
														value="${crustjs.ingredientID}" name="crust"
														id="crust${crustjs.ingredientID}" Csmall="${crustjs.psmall}"
														Cmedium="${crustjs.pmedium}" Clarge="${crustjs.plarge}"
														label="${crustjs.ingredientName}(${crustjs.psmall}|${crustjs.pmedium}|${crustjs.plarge})"
														path="crust" onchange="getcid(${crustjs.ingredientID})"></form:radiobutton>
												</div>
											</td>
											<c:if test="${status.count % 3 == 0}">
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</c:if>
							</div> --%>
						</div>

						<!--quatity and price  -->
						<div class="order-total">
							<table width="500px" style="border: dashed; border-color: black;">
								<tr valign="middle">
									<td
										style="padding-left: 20px; width: 90px; font-size: 16px; font-weight: bold; color: #212121;">Quantity</td>
									<td><span class="spinner">
											<table>
												<tr>
													<td rowspan="2"><form:input id="Quantity" type="text"
															path="Quantity"
															onBlur="if(this.form.Quantity.value < 1){this.form.Quantity.value = 1;}"
															value="1" name="Quantity" class="order_quantity"
															readonly="true" />
													</td>
													<td><form:input type="button" path=""
															onClick="this.form.Quantity.value++;" class="spinner_up"
															name="up" />
													</td>
												</tr>
												<tr>
													<td><form:input type="button" path=""
															onClick="if(this.form.Quantity.value!=1){this.form.Quantity.value--;}"
															class="spinner_down" name="down" />
													</td>
												</tr>


											</table> </span></td>
									<td
										style="width: 60px; font-size: 16px; font-weight: bold; color: #212121;">Price<span>(Rs)</span>
									</td>
									<td style="font-size: 16px; font-weight: bold; color: #CD0029;">
										<form:input id="price" type="text" size="5" value=""
											name="price" path="price" readonly="true" /></td>
									<td><input type="button" value="" id="add"
										style="background-image: url('resources/images/AddPizza.jpg'); height: 34px; width: 125px;" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</form:form>
			<!-- Shopping cart -->
			<td rowspan="2" valign="top">
				<div id="main"
					style="background-image: url('resources/images/back.jpg'); height: 600px; border: dotted; border-color: gray; margin-right: 150px; margin-top: 200px; width: 450px;">
					<div id="head" style="margin-top: 2px; vertical-align: top;">
						<img src="resources/images/cart.jpg" />
						<div align="center">
							<label
								style="font-style: italic; font-size: x-large; font: bold; color: green; text-decoration: underline;">Your
								Order</label>
						</div>
					</div>
					<div id="cart"
						Style="height: 200px; width: 435px; overflow: auto; vertical-align: top;">
						<!-- Cart Loaded Using Ajax Call-->

						<!-- For cart item deletion -->
						<jsp:include page="../views/cart.jsp"></jsp:include>
					</div>
					<form:form name="cart" method="GET" modelAttribute="cartorder"
						action="cart">

						<div
							style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px; margin-bottom: 5px; height: 280px; width: 425px; background-color: #BBBB77;"
							align="center">
							<div align="center" style="margin-bottom: 10px;">
								<form:input size="25" type="text" id="coupon" path=""
									cssClass="cpn" value="Enter Coupon Number"
									onClick="this.value='';"
									onblur="this.value=!this.value?'Enter Coupon Number':this.value;" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value=""
									id="redeem" class="cpn"
									style="background-image: url('resources/images/redeem_now.png'); height: 35px; width: 145px;" />
							</div>
							<table cellspacing="15" align="center">
								<tr>
									<td align="left"><label
										style="font-size: large; font-family: fantasy; margin-top: 10px; margin-left: 10px; margin-right: 10px;">Total
											Amount&nbsp;<span>(Rs)</span></label></td>
									<td><form:input id="amount" type="text" size="20"
											value="${total}" name="amount" path="amount" readonly="true" />
									</td>
								</tr>
								<tr>
									<td align="left"><label
										style="font-size: large; font-family: fantasy;margin-top: 10px; margin-left: 10px; margin-right: 10px;">Discount&nbsp;<span>(Rs)</span></label>
									</td>
									<td><form:input id="discount" type="text" size="20"
											value="" name="discount" path="discount" readonly="true" />
									</td>
								</tr>
								<tr>
									<td align="left"><label
										style="font-size: large; font-family: fantasy; margin-top: 10px; margin-left: 10px; margin-right: 10px;">Grand
											Total&nbsp;<span>(Rs)</span></label>
									</td>
									<td><form:input id="grandTotal" type="text" size="20"
											value="" name="grandTotal" path="grandTotal" readonly="true" />
									</td>
								</tr>
							</table>
							<br>
							<div align="center" style="margin-top: 6px;"></div>
							<input type="button" value="" id="cart" onClick="checkcart()"
								style="background-image: url('resources/images/order.jpg'); height: 34px; width: 125px;" />
							<!-- <a href="cart"><img src="resources/images/order.jpg" /> </a> -->
						</div>
					</form:form>
				</div></td>
		</tr>
	</table>
</body>
</html>