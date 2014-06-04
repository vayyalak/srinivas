<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="js/jquery/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/datepicker/ui.datepicker.js"></script>
<link href="css/tabs/tabsStyle.css" rel="stylesheet" type="text/css" />
<link href="css/datepicker/ui.all.css" rel="stylesheet" type="text/css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payload Input Form</title>
<script type="text/javascript">
$(document).ready(function() {
$("#field8").datepicker({
		
		changeYear:true,
		changeMonth: true,
		
		yearRange: "-25:+50",			
		numberOfMonths: 1			  
	});
});
	</script>
</head>
<body>
<div class="midarea">
<form:form method="post" action="saveForm.html">
<table width="100%">
				<tr>
				<td colspan="4">
				<table width="100%">
					<tr>
						<td><form:label path="field1">Field 1 :</form:label></td>
						<td><form:input path="field1"></form:input></td>
						<td><form:label path="field5">Field 5 :</form:label></td>
						<td><form:password path="field5"/></td>
					</tr>
					<tr>
						<td><form:label path="field2">Field 2 :</form:label></td>
						<td><form:textarea path="field2" cssStyle="vertical-align:top;"/></td>
						<td><form:label path="field6">Field 6 :</form:label></td>
						<td><form:select path="field6">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						
					</tr>
					<tr>
						<td><form:label path="field3">Field 3 :</form:label></td>
						<td><form:select path="field3" multiple="true">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						<td><form:label path="field7">Field 7 :</form:label></td>
						<td><form:checkbox path="field7" label=" CheckBox1" value="CheckBox1"/></td>
					</tr>
					<tr>
						<td><form:label path="field4">Field 4 :</form:label></td>
						<td><form:radiobutton path="field4" label="Male" value="Male"/>
						<form:radiobutton path="field4" label="Female" value="Female"/></td>
						<td><form:label path="field8">Field 8 :</form:label></td>
						<td><form:input path="field8" id="field8"></form:input></td>
					</tr>
				</table>
				</td>
				</tr>
				<tr>
					<td colspan="3"></td>
					<td align="right"><input type="submit" class="button-style" id="submit" value="Submit"/></td>
				</tr>
			</table>
			</form:form>
			</div>
</body>
</html>