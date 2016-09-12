<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id = "admin" class="cs636.music.presentation.web.AdminBean" scope="session"/>
<jsp:setProperty name="admin" property="*"/>
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
<A HREF="adminWelcome.jsp">ADMIN HOME PAGE</A><br /><br /><br />
<p><a href="allInvoice.jsp" target="iframe_a">List all Invoices</a></p>
<p><a href="allDownload.jsp" target="iframe_a">List all Downloads</a></p>
</div>

<div style="opacity:0.8;position:absolute;left:350px;width:400px;height:150px;">
REPORT: 
<br />
<iframe src="allInvoice.jsp" name="iframe_a" width="800" height="800"></iframe>
<br />
<br />

</div>

<div style="opacity:0.8;position:absolute;left:800px;width:200px;height:150px;">

</div>

</body>
</html>
