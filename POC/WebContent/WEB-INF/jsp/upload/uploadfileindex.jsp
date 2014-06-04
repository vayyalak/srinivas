<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Welcome</title>
</head>
<body>
<div class="midarea">
<ul>
	<core:forEach items="${files}" var="file" >
		<li>${file}</li>
	</core:forEach>
</ul>
</div>
</body>
</html>