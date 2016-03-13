<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cart</title>

</head>

<body>     
  <input type="hidden" id="total" value="${total}">
	<c:if test="${!empty cartlist}">
		<table align="center" cellspacing="3" cellpadding="0" id="cartable"
			style="width: 410px; vertical-align: top;">
			<tr>
					<th align="center" style="font-style: italic; font-size: large; font: bold; color: green; ">Pizza</th>
					<th align="center" style="font-style: italic; font-size: large; font: bold; color: green; ">Quantity</th>
					<th align="center" style="font-style: italic; font-size: large; font: bold; color: green; ">Size</th>
					<th align="center" style="font-style: italic; font-size: large; font: bold; color: green; ">Price</th>
				</tr>
			<c:forEach items="${cartlist}" var="order" varStatus="status">			  
				<tr valign="middle"
					style="margin-left: 5px; margin-right: 5px; margin-top: 3px; margin-bottom: 2px; border-color: green; border-style: dashed;"> 
					<td align="center"><label>${order.product.productName}</label>
					</td>
					<td align="center"><label>${order.quantity}</label>
					</td>
					<td align="center"><label>${order.size}</label></td>
					<td align="center"><label>${order.price}</label></td>
					<td align="center"><div align="left">
							<a  id="remove" href="cart/remove/${status.count}" ><img src="resources/images/delete.jpg"
								style="margin-bottom: 3px;"> </a> <!-- <a href=""> <img
								src="resources/images/edit.jpg"> </a> -->
						</div></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>