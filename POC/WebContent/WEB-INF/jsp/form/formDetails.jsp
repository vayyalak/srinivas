<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
	<title></title>
</head>
<script type="text/javascript" src="js/jquery/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/tabs/ui.tab.js"></script>
<script type="text/javascript" src="js/datepicker/ui.datepicker.js"></script>
<link href="css/tabs/tabsStyle.css" rel="stylesheet" type="text/css" />
<link href="css/datepicker/ui.all.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
var tab; // global var
$(document).ready(function() {
	tab = new $.fn.tab({
		tabList : ".ui-tab-container .ui-tab-list li",
		contentList : ".ui-tab-container .ui-tab-content",
		tabActiveClass : "hot",
		showType : "fade"
	});
	tab.setDisable(1);
	tab.setDisable(2);
	tab.setDisable(3);
	//$("#tabssub").tabs('disable','#tab2');
	//$("#tabssub").tabs("option", "disabled", [1,2,3]);
	
	//set create user hot
	//$('#menu_admin').addClass("hot"); // parent tab
	$('#tab1').removeClass();
	$('#tab1').addClass('hot');

	$("#tab1").click(function() {
			$('#tab1').removeClass().addClass('hot');
			$('#tab2').removeClass();
			$('#tab3').removeClass();
			$('#tab4').removeClass();
			
	});
	
	$("#tab2").click(function() {
		if(isTabDisable(1)==false){
			$('#tab2').removeClass().addClass('hot');
			$('#tab1').removeClass();
			$('#tab3').removeClass();
			$('#tab4').removeClass();
		}						
	});
	
	$("#tab3").click(function() {
		if(isTabDisable(2)==false){
			$('#tab3').removeClass().addClass('hot');
			$('#tab2').removeClass();
			$('#tab1').removeClass();
			$('#tab4').removeClass();
		}
	});
	
	$("#tab4").click(function() {
		if(isTabDisable(3)==false){
		$('#tab4').removeClass().addClass('hot');
		$('#tab2').removeClass();
		$('#tab3').removeClass();
		$('#tab1').removeClass();
		}
	});
	
	$("#tab1Next").click(function(){
		tab.setEnable(1);
		$("#tab2").trigger('click');
	});
	
	$("#tab2Next").click(function(){
		tab.setEnable(2);
		$("#tab3").trigger('click');
	});
	$("#tab2Prev").click(function(){
		$("#tab1").trigger('click');
	});
	
	$("#tab3Next").click(function(){
		tab.setEnable(3);
		$("#tab4").trigger('click');
	});
	$("#tab3Prev").click(function(){
		$("#tab2").trigger('click');
	});
	$("#tab4Prev").click(function(){
		$("#tab3").trigger('click');
	});
	
	$("#formFinish").click(function(){
		
	});
	function isTabDisable(currentTab){
		var isDisable=false;
		var disableTab=tab.disableArr;
		for(i=0;i<disableTab.length;i++){
			if(disableTab[i]==currentTab){
				isDisable=true;
			}
		}
		return isDisable;
	}

	$("#field11").datepicker({
		
		changeYear:true,
		changeMonth: true,
		
		yearRange: "-25:+50",			
		numberOfMonths: 1			  
	});
});

</script>
<body>
<div class="midarea">
	<h2>Form Details</h2>
	<form:form method="post" action="saveForm.html">
		
		<div id="tabsmain" class="ui-tab-container">
			<div id="tabssub">
				<ul id="primary" class="ui-tab-list clearfix">
					<li><a href="#" id="tab1">&nbsp; Tab 1 &nbsp;</a></li>
					<li><a href="#" id="tab2">&nbsp; Tab 2 &nbsp;</a></li>
					<li><a href="#" id="tab3">&nbsp; Tab 3 &nbsp;</a></li>
					<li><a href="#" id="tab4">&nbsp; Tab 4 &nbsp;</a></li>
					
				</ul>
			</div>

			<div class="ui-tab-content" style="display: block" id="tabData1">
			
			<table width="100%">
				<tr>
				<td colspan="4">
				<table width="100%">
					<tr>
						<td><form:label path="field1">Field 1 :</form:label></td>
						<td><form:input path="field1"></form:input></td>
						<td><form:label path="field4">Field 4 :</form:label></td>
						<td><form:password path="field4"/></td>
					</tr>
					<tr>
						<td><form:label path="field2">Field 2 :</form:label></td>
						<td><form:textarea path="field2" cssStyle="vertical-align:top;"/></td>
						<td><form:label path="field5">Field 5 :</form:label></td>
						<td><form:select path="field5">
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
						<td><form:label path="field6">Field 6 :</form:label></td>
						<td><form:checkbox path="field6" label=" CheckBox1" value="CheckBox1"/></td>
					</tr>
				</table>
				</td>
				</tr>
				<tr>
					<td colspan="3"></td>
					<td align="right"><input type="button" class="button-style" id="tab1Next" value="Next"/></td>
				</tr>
			</table>
				
			</div>	
			<div class="ui-tab-content" style="display: none" id="tabData2">
				
				<table width="100%">
					<tr>
						<td colspan="4">
				<table width="100%">
					<tr>
						<td><form:label path="field7">Field 7 :</form:label></td>
						<td><form:input path="field7"></form:input></td>
						<td><form:label path="field10">Field 10 :</form:label></td>
						<td><form:radiobutton path="field10" label="Male" value="Male"/>
						<form:radiobutton path="field10" label="Female" value="Female"/></td>
					</tr>
					<tr>
						<td><form:label path="field8">Field 8 :</form:label></td>
						<td><form:textarea path="field8" cssStyle="vertical-align:top;"/></td>
						<td><form:label path="field11">Field 11 :</form:label></td>
						<td><form:input path="field11" id="field11"></form:input></td>
						
					</tr>
					<tr>
						<td><form:label path="field9">Field 9 :</form:label></td>
						<td><form:select path="field9" multiple="true">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						<td><form:label path="field12">Field 12 :</form:label></td>
						<td><form:checkbox path="field12" label=" CheckBox1" value="CheckBox1"/></td>
					</tr>
				</table>
				</td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td align="right"><input type="button" class="button-style" id="tab2Prev" value="Previous"/></td>
						<td align="right"><input type="button" class="button-style" id="tab2Next" value="Next"/></td>
					</tr>
				</table>
			</div>	
			
			<div class="ui-tab-content" style="display: none" id="tabData3">
				<table width="100%">
					<tr>
						<td colspan="4">
				<table width="100%">
					<tr>
						<td><form:label path="field13">Field 13 :</form:label></td>
						<td><form:input path="field13"></form:input></td>
						<td><form:label path="field16">Field 16 :</form:label></td>
						<td><form:password path="field16"/></td>
					</tr>
					<tr>
						<td><form:label path="field14">Field 14 :</form:label></td>
						<td><form:textarea path="field14" cssStyle="vertical-align:top;"/></td>
						<td><form:label path="field17">Field 17 :</form:label></td>
						<td><form:select path="field17">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						
					</tr>
					<tr>
						<td><form:label path="field15">Field 15 :</form:label></td>
						<td><form:select path="field15" multiple="true">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						<td><form:label path="field18">Field 18 :</form:label></td>
						<td><form:checkbox path="field18" label=" CheckBox1" value="CheckBox1"/></td>
					</tr>
				</table>
				</td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td align="right"><input type="button" class="button-style" id="tab3Prev" value="Previous"/></td>
						<td align="right"><input type="button" class="button-style" id="tab3Next" value="Next"/></td>
					</tr>
				</table>
			</div>	
			
			<div class="ui-tab-content" style="display: none" id="tabData4">
				<table width="100%">
					<tr>
						<td colspan="4">
				<table width="100%">
					<tr>
						<td><form:label path="field19">Field 19 :</form:label></td>
						<td><form:input path="field19"></form:input></td>
						<td><form:label path="field22">Field 22 :</form:label></td>
						<td><form:password path="field22"/></td>
					</tr>
					<tr>
						<td><form:label path="field20">Field 20 :</form:label></td>
						<td><form:textarea path="field20" cssStyle="vertical-align:top;"/></td>
						<td><form:label path="field23">Field 23 :</form:label></td>
						<td><form:select path="field23">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						
					</tr>
					<tr>
						<td><form:label path="field21">Field 21 :</form:label></td>
						<td><form:select path="field21" multiple="true">
						<form:option value="" label="select" />
				          <form:option value="option1" label="option1" />
				          <form:option value="option2" label="option2" /></form:select></td>
						<td><form:label path="field24">Field 24 :</form:label></td>
						<td><form:checkbox path="field24" label=" CheckBox1" value="CheckBox1"/></td>
					</tr>
				</table>
				</td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td align="right"><input type="button" class="button-style" id="tab4Prev" value="Previous"/></td>
						<td align="right"><input class="button-style" name="submit" type="submit" id="formFinish" value="Finish"/></td>
					</tr>
				</table>
			</div>		
		</div>
	</form:form>
  </div>
</body>
</html>
