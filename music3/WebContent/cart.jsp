<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<jsp:setProperty name="user" property="quantity" param="quantity"/>
<jsp:setProperty name="user" property="command" param="command"/>
<jsp:setProperty name="user" property="prodCode" param="productCODE"/>

<html>
<head>
<title>MY CART</title>
<style type="text/css">
body {background-color:#DBDBE9}
#titulo1 {background-color:#B4009E;color:#ffffff;}
a:link {color:#6600FF;text-decoration:none;}      /* unvisited link */
a:visited {color:#6600FF;text-decoration:none;}  /* visited link */
a:hover {color:#6600FF;text-decoration:underline;}  /* mouse over link */
a:active {color:#6600FF;text-decoration:underline;}  /* selected link */
</style>
</head>

<body>

<div style="opacity:0.8;position:absolute;left:10px;width:300px;height:150px;">
<span style="color:#EE872A;">User: </span> 
<c:choose>
<c:when test="${empty user.email}">
  GUEST
</c:when>
<c:otherwise>
<%=user.getEmail()%>
</c:otherwise>
</c:choose>
<br /><br /><br />
<A HREF="userWelcome.jsp">USER HOME PAGE</A><br />
<A HREF="catalog.jsp">VIEW CATALOGUE</A>
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:700px;height:150px;">
MY CART: 
<br />
<br />
<c:forEach items="${user.cartList}" var="lineitem">
<c:choose>
  <c:when test="${!empty lineitem}">
	<c:url var="plusURL" value = "cart.jsp">
		<c:param name="productCODE" value="${lineitem.product.code}"/>
		<c:param name="command" value="add"/>
    </c:url>
	<c:url var="menosURL" value = "cart.jsp">
		<c:param name="productCODE" value="${lineitem.product.code}"/>
		<c:param name="command" value="sub"/>
    </c:url>
    <span style="color:#EE872A;">Product: </span> ${lineitem.product.description}  <span style="color:#EE872A;"> Price: </span> ${lineitem.product.price} 
	<span style="color:#EE872A;"> Quantity: </span> <A HREF="${plusURL}">+</A> ${lineitem.quantity} <A HREF="${menosURL}">-</A>
	<br/>
  </c:when>
  <c:otherwise>
  Note: YOUR CART IS EMPTY NOW!   
  </c:otherwise>
</c:choose>

</c:forEach>
</div>

<div style="opacity:0.8;position:absolute;left:1050px;width:200px;height:150px;">
<br /><br /><br />
<A HREF="catalog.jsp">CONTINUE SHOPPING</A>
<A HREF="checkout.jsp">CHECK OUT</A><br />
</div>

</body>
</html>
