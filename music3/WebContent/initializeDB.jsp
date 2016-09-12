<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id = "admin" class="cs636.music.presentation.web.AdminBean"/>
<html>
  <head>
    <title>Initialize data base</title>
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
    Initialize DataBase: <%=admin.initDB()%>
    <br>
	<A HREF="adminWelcome.jsp"> Back to Admin page </A> 
  </body>
</html>
