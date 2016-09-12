<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<jsp:setProperty name="user" property="*"/>
<html>
<head>
<title>PRODUCT</title>
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
<A HREF="catalog.jsp">VIEW CATALOGUE</A>
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:400px;height:150px;">
PRODUCT: 
<br />
<br />
<c:forEach items="${user.productList}" var="catalog">
	  <c:if test="${catalog.id == param.catalogID}">
		  <c:url var="cartURL" value = "cart.jsp">
			<c:param name="productCODE" value="${catalog.code}"/>
			<c:param name="command" value="add"/>
		  </c:url>
  	  ${catalog.id}  ${catalog.code} ${catalog.description} ${catalog.price} <br /><br/>
	  </c:if>
</c:forEach>
</div>

<div style="opacity:0.8;position:absolute;left:800px;width:200px;height:150px;">
<br /><br /><br />
	
	<c:url var="sampleURL" value = "sample.jsp">
		<c:param name="catalogID" value="${param.catalogID}"/>
    </c:url>
<A HREF="${cartURL}">ADD TO CART</A><br />
<A HREF="cart.jsp">SHOW CART</A><br />
<A HREF="${sampleURL}">LISTEN SAMPLES</A>
</div>

</body>
</html>
