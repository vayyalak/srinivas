<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<div class="midarea">
<br/>
Form Details
<c:forEach items="${formDetails}" var="formData" varStatus="status">
<table width="90%" align="center" id="dynamicTable" style="border:1px solid black;">
	
	<tr>
			<td>Field 1 :</td>
			<td>${formData[0]}</td>
			<td>Field 2 :</td>
			<td>${formData[1]}</td>
	</tr>
	<tr>
			<td>Field 3 :</td>
			<td>${formData[2]} </td>
			<td>Field 4 : </td>
			<td>${formData[3]}</td>
	</tr>
	<tr>
			<td>Field 5 :</td>
			<td> ${formData[4]} </td>
			<td>Field 6 :</td>
			<td>${formData[5]}</td>
	</tr>
</table>
	</c:forEach>
</div>
</body>
</html>