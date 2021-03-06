<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/ie.css" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="resources/css/Home.css"
	media="all" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pizza-Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="resources/js/MyriadPro.font.js"></script>
<script type="text/javascript" src="resources/js/ArialBold.font.js"></script>
<script type="text/javascript" src="resources/js/jquery-func.js"></script>
<script src="resources/js/slides.min.jquery.js"></script>
<script src="resources/js/Home.js"></script>

<style type="text/css">
.error {
	color: #ff0000;
	font-style: italic;
}
</style>

</head>
<body>

	<s:url var="url4" value="/aboutus">
	</s:url>
	<input type="hidden" value="${url4}" id="urlID" />

	<s:url var="urll" value="/NewUser"></s:url>
	<input type="hidden" value="${urll}" id="urlID1" />

	<s:url var="url" value="/login"></s:url>
	<input type="hidden" value="${url}" id="urlID2" />

	<s:url var="url1" value="/menu">
	</s:url>
	<input type="hidden" value="${url1}" id="urlID3" />

	<s:url var="url2" value="/order">
	</s:url>
	<input type="hidden" value="${url2}" id="urlID4" />
	
	<s:url var="offer" value="/showoffer"></s:url>
	<input type="hidden" value="${offer}" id="offer1" />

	<div class="headerDiv" style="margin-top: 10px;" align="right">
		<a class="menuLink" href="${urll}"><span><img
				src="resources/images/btn_sign_up_off.png" style="height: 35px" />
		</span> </a> <a class="menuLink" href="${url}">&nbsp; <span><img
				src="resources/images/btn_sign_IN_off.png" style="height: 35px" />
		</span> </a>
	</div>

	<img id="logo" src="resources/images/logo1.jpg" />
	<table class="mainTable" cellspacing="10">
		<tr>
			<td colspan="2">
				<div id="left1">
					<a class="menuLink" href="${url4}">AboutUs</a>
				</div>
				<div id="left1">
					<a class="menuLink" href="${offer}">Offer</a>
				</div>
				<div id="left1">
					<a class="menuLink" href="${url1}">Menu</a>
				</div>
				<div id="left1">
					<a class="menuLink" id="order" href="${url2}">Order</a>
				</div> <br> <br>
				<hr align="right" width="450px">
			</td>
		</tr>
	</table>
	
	<div style="margin-top: 50px;" align="center">
		<marquee behavior="scroll" direction="right" width="600" height="20"
			truespeed="truespeed">
			<label
				style="font-size: x-large; font-style: oblique; font-family: Arial; color: #565656; margin-top: 30px;">
				We Welcome You In Our Shop.....</label>
		</marquee>
	</div>

	<div id="intro" style="margin-top: 70px;">
		<div class="shell">
			<!-- Slider Holder -->
			<div class="slider-holder">
				<ul>
					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-1.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-2.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-3.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-4.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-5.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-6.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-7.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->

					<!-- Offer -->
					<li>
						<div class="offer-image">
							<img src="resources/images/offer-image-8.jpg" alt=" " />
						</div>
					</li>
					<!-- /Offer -->
				</ul>
			</div>
			<!-- /Slider Holder -->
			<!-- Slider Navigation -->
			<div class="slider-navigation">
				<ul>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
				</ul>
			</div>
			<!-- /Slider Navigation -->
		</div>
	</div>
	<table class="mainTable" cellspacing="10">
		<tr>
			<td colspan="2"><hr id="hr">
				<div align="center">ęCopyright 2012 Impetus Infotech(India)
					Pvt.Ltd. All Rights Reserved.</div>
			</td>
		</tr>
	</table>

</body>
</html>