<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id = "admin" class="cs636.music.presentation.web.AdminBean" scope="session"/>
<jsp:setProperty name="admin" property="*"/>

<html>
<head>
<title>ALL INVOICES</title>
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

INVOICES: 
<br />
<br />
<c:forEach items="${admin.listofInvoices}" var="listinvoice">
<c:choose>
  <c:when test="${!empty listinvoice}">

    <span style="color:#EE872A;">Invoice ID: </span> ${listinvoice.invoiceId}  <span style="color:#EE872A;"> DATE: </span> ${listinvoice.invoiceDate} 
	<span style="color:#EE872A;"> TOTAL: </span>  ${listinvoice.totalAmount} <span style="color:#EE872A;"> User: </span>  ${listinvoice.user.emailAddress} <span style="color:#EE872A;"> Processed: </span>  ${listinvoice.isProcessed}
	<br/>
  </c:when>
  <c:otherwise>
  Note: Invoice List empty!   
  </c:otherwise>
</c:choose>

</c:forEach>




</body>
</html>
