<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<jsp:setProperty name="user" property="*"/>
<html>
<head>
<title>CATALOGUE</title>
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
<br /><br /><br />
<A HREF="userWelcome.jsp">USER HOME PAGE</A><br />
<A HREF="cart.jsp">SHOW CART</A>
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:600px;height:150px;">
CATALOGUE: 
<br />
<br />
<c:forEach items="${user.productList}" var="catalog">
	<c:url var="productURL" value = "product.jsp">
   	<c:param name="catalogID" value="${catalog.id}"/>
    </c:url>
  	 <A HREF="${productURL}"> ${catalog.id}  ${catalog.code} ${catalog.description} ${catalog.price}</A><br />
</c:forEach>
</div>


</body>
</html>
