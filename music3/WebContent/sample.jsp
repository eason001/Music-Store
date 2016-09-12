<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="cs636.music.presentation.web.UserBean" scope="session" />
<jsp:setProperty name="user" property="*"/>
<jsp:setProperty name="user" property="lname" param="FirstName"/>
<jsp:setProperty name="user" property="fname" param="LastName"/>
<jsp:setProperty name="user" property="email" param="Email"/>
<jsp:setProperty name="user" property="prodID" param="catalogID"/>
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
<c:forEach items="${user.productList}" var="catalog">
	  <c:if test="${catalog.id == user.prodID}">
		  <c:url var="cartURL" value = "cart.jsp">
			<c:param name="productCODE" value="${catalog.code}"/>
			<c:param name="command" value="add"/>
		  </c:url>
  	  ${catalog.description} ${catalog.price} <br /><br/>
	  TRACKS: <br/><br/>
		  <c:forEach items="${catalog.getTracks()}" var="tracks">
		  <c:url var="listenMP3" value = "listen.jsp">
		     <c:param name="trackMP3" value = "sound/${catalog.code}/${tracks.sampleFilename}"/>
			 <c:param name="sampleFilename" value = "${tracks.sampleFilename}"/>
			 <c:param name="title" value = "${tracks.title}"/>
			 <c:param name="trackNumber" value = "${tracks.trackNumber}"/>
			 <c:param name="pcode" value = "${tracks.product.code}"/>
			 <c:param name="tid" value = "${tracks.id}"/>
		  </c:url>
		  ${tracks.id} ${tracks.title}  <a href="${listenMP3}">MP3</a><br/>
		  </c:forEach>
	  </c:if>
</c:forEach>
</div>

<div style="opacity:0.8;position:absolute;left:800px;width:200px;height:150px;">
<br /><br /><br />

<A HREF="${cartURL}">ADD TO CART</A><br />
<A HREF="cart.jsp">SHOW CART</A><br />
</div>

</body>
</html>
