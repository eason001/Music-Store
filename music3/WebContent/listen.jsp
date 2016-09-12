<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<jsp:setProperty name="user" property="*"/>
<jsp:setProperty name="user" property="sampleFilename" param="sampleFilename"/>
<jsp:setProperty name="user" property="title" param="title"/>
<jsp:setProperty name="user" property="trackNumber" param="trackNumber"/>
<jsp:setProperty name="user" property="pcode" param="pcode"/>
<jsp:setProperty name="user" property="tid" param="tid"/>
<c:if test="${empty user.email}">
		  <c:url var="registerURL" value = "register.jsp">
			<c:param name="previousURL" value="sample.jsp"/>
		  </c:url>
<jsp:forward page="${registerURL}"/>
</c:if>

<html>
<head>
<title>SAMPLE</title>
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

<div style="opacity:0.8;position:absolute;left:350px;width:400px;height:150px;">
PRODUCT: 
<br />
<br />
<%user.addDownload();%>
<iframe src="${param.trackMP3}"></iframe>
</div>


</body>
</html>
