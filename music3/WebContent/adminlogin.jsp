<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id = "admin" class="cs636.music.presentation.web.AdminBean" scope="session"/>

<c:choose>
<c:when test="${admin.checklogin(param.username,param.password)}">
  <jsp:forward page="adminWelcome.jsp"/>
</c:when>
<c:otherwise>
<script>alert('Please enter a valid username and password!')</script>
</c:otherwise>
</c:choose>
<html>
<head>
<title>ADMIN LOGIN PAGE</title>
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
<A HREF="welcome.html">MUSCI STORE HOME PAGE</A><br />
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:400px;height:150px;">
PLEASE LOGIN FIRST:
<br />
<br />
	<form name="input" action="adminlogin.jsp" method="get">
	Username: <input type="text" name="username" ><br>
	Password: <input type="text" name="password" ><br>
	<input type="submit" value="LOGIN">
</form> 
</div>

<div style="opacity:0.8;position:absolute;left:800px;width:200px;height:150px;">

</div>

</body>
</html>
