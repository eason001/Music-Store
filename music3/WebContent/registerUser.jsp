<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id = "user" class="cs636.music.presentation.web.UserBean" scope="session"/>
<jsp:setProperty name="user" property="lname" param="FirstName"/>
<jsp:setProperty name="user" property="fname" param="LastName"/>
<jsp:setProperty name="user" property="email" param="Email"/>
<html>
<head>
<title>REPORT</title>
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
	<c:url value="catalog.jsp" var="catalogURL"/>
	<c:url value="cart.jsp" var="cartURL"/>
	
	<LI><A href="${catalogURL}"> Browse Catalog </a></LI>
	<LI><A HREF="${cartURL}"> Show Cart </A></LI>
	<LI><A HREF="welcome.html"> Back to Site Homepage</A></LI>
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:400px;height:150px;">
<br />
<br />
<br />
<br />
REGISTER COMPLETED! 

</div>

<div style="opacity:0.8;position:absolute;left:800px;width:200px;height:150px;">

</div>

</body>
</html>
