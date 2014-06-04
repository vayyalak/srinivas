<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="js/jquery/jquery-1.4.2.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payload Input Form</title>
<script type="text/javascript">
var rowData="";
var row=2;
var dynamicVal='';
var rowId="#dynamicData_";
$(function(){
	rowData=document.getElementById('dynamicData_1').innerHTML;
});

function add(){
	var addData='<tr id="dynamicOption_'+row+'">';
	addData+='<td colspan="4" align="right"><a href="#" onclick="show('+row+')">Show</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="hide('+row+')">Hide</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="remove('+row+')">Remove</a></td></tr>';
	$('#dynamicTable').append(addData);
	var addData1='<tr id="dynamicRow_'+row+'"><td colspan="4" id="dynamicData_'+row+'">';
	addData1+=rowData;
	addData1+='</td></tr>';
	$('#dynamicTable').append(addData1);
	row++;
}
function show(rowID){
	$("#dynamicRow_"+rowID).show();
	
}
function hide(rowID){
	$("#dynamicRow_"+rowID).hide();
}
function remove(rowID){
	$("#dynamicOption_"+rowID).remove();
	$("#dynamicRow_"+rowID).remove();
	
}
</script>
</head>
<body>
	<div class="midarea">
		<form:form method="post" action="saveDynamicForm.html">
			<table width="100%" id="dynamicTable">
				<tr id="dynamicOption_1"><td colspan="4" align="right"><a href="#" onclick="add()">Add</a></td></tr>
				<tr id="dynamicRow_1">
					<td colspan="4" id="dynamicData_1">
						<table width="100%">
							<tr>
								<td><form:label path="field1">Field 1 :</form:label></td>
								<td><form:input path="field1"></form:input> </td>
								<td><form:label path="field2">Field 2 :</form:label> </td>
								<td><form:input path="field2" /> </td>
							</tr>
							<tr>
								<td><form:label path="field3">Field 3 :</form:label> </td>
								<td><form:textarea path="field3" cssStyle="vertical-align:top;" /> </td>
								<td><form:label path="field4">Field 4 :</form:label> </td>
								<td><form:select path="field4">
										<form:option value="" label="select" />
										<form:option value="option1" label="option1" />
										<form:option value="option2" label="option2" />
									</form:select>
								</td>
							</tr>
							<tr>
								<td><form:label path="field5">Field 5 :</form:label></td>
								<td><form:select path="field5" multiple="true">
										<form:option value="" label="select" />
										<form:option value="option1" label="option1" />
										<form:option value="option2" label="option2" />
									</form:select>
								</td>
								<td><form:label path="field6">Field 6 :</form:label></td>
								<td><form:checkbox path="field6" label=" CheckBox1" value="CheckBox1" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="3"></td>
					<td align="right"><input type="submit" class="button-style"
						id="submit" value="Submit" />
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>