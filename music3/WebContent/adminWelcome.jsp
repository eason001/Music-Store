<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- create a bean or look it up -->
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<html>
<head>
<title>Welcome to Music Order Shop</title>
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
  	<form action="initializeDB.jsp" method="get">
	<input type="submit" value="Initialize DataBase">
	</form>
	<ul>
	<LI><A HREF="invoice.jsp"> Process Invoice </A></LI>
	<LI><A HREF="report.jsp"> Display Report</A></LI>
	<LI><A HREF="welcome.html"> Back to Store Homepage</A></LI>
	</ul>
 </body>
  
</html>
