<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<jsp:setProperty name="user" property="quantity" param="quantity"/>
<jsp:setProperty name="user" property="command" param="command"/>
<jsp:setProperty name="user" property="prodCode" param="productCODE"/>
<jsp:setProperty name="user" property="lname" param="FirstName"/>
<jsp:setProperty name="user" property="fname" param="LastName"/>
<jsp:setProperty name="user" property="email" param="Email"/>
<c:if test="${empty user.email}">
  		  <c:url var="registerURL" value = "register.jsp">
			<c:param name="previousURL" value="checkout.jsp"/>
			<c:param name="catalogID" value="param.catalogID"/>
		  </c:url>
	<jsp:forward page="${registerURL}"/>
</c:if>

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
<%user.checkout();%>
</c:otherwise>
</c:choose>
<br /><br /><br />
<A HREF="userWelcome.jsp">USER HOME PAGE</A><br />
<A HREF="catalog.jsp">VIEW CATALOGUE</A><br />
<A HREF="cart.jsp">SHOW CART</A><br />
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:700px;height:150px;">
YOUR INVOICE: 
<br />
<br />
<c:forEach items="${user.cartList}" var="lineitem">
<c:choose>
  <c:when test="${!empty lineitem}">
    <span style="color:#EE872A;">Product: </span> ${lineitem.product.description}  <span style="color:#EE872A;"> Price: </span> ${lineitem.product.price} 
	<span style="color:#EE872A;"> Quantity: </span>${lineitem.quantity}
	<c:set var="invoiceID" value="${lineitem.invoice.invoiceId}" /> 
	<c:set var="DATE" value="${lineitem.invoice.invoiceDate}" /> 
	<c:set var="TOTAL" value="${lineitem.invoice.totalAmount}" /> 
	<c:set var="process" value="${lineitem.invoice.isProcessed}" /> 
	<br/>
  </c:when>
  <c:otherwise>
  Note: YOUR CART IS EMPTY NOW!   
  </c:otherwise>
</c:choose>
</c:forEach>
<%user.cartclear();%>
<br />
<br />--------------------------------------------------------------------------------------
<br />
<span style="color:#EE872A;">Invoice Number: </span> ${invoiceID}  <span style="color:#EE872A;"> DATE: </span> ${DATE} 
	<span style="color:#EE872A;"> TOTAL: </span>  ${TOTAL} <span style="color:#EE872A;"> Processed: </span>  ${process} 
	<br/>
</div>

<div style="opacity:0.8;position:absolute;left:1050px;width:200px;height:150px;">
<br /><br /><br />
<h3 style="color:#EE872A;">YOUR INVOICE IS ALREADY CHECKED OUT! </h3>
</div>

</body>
</html>
