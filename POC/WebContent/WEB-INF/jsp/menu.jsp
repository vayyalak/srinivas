<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>POC Template</title>
<link href="css/menu/sdmenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/sdmenu.js"></script>
  <script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
	</script>
</head><body>	
  <div class="left">
  <div  id="my_menu" class="sdmenu">
      <div>
        <span>Form</span>
        <a href="<c:url value="formDetails.html"/>">PayLoad Template</a>
        <a href="<c:url value="payLoadInputForm.html"/>">PayLoad Form</a>
        <a href="<c:url value="dynamicInputDetails.html"/>">Dynamic Form</a>           
      </div>
      <div>
        <span>File Upload</span>
        <a href="<c:url value="uploadfile.html"/>">Single File Upload</a>
        <a href="<c:url value="multipleUpload.html"/>">Multiple File Upload</a>
      </div>
      <div>
        <span>Template Layout</span>
        <a href="<c:url value="showEvents.html"/>">Calendar Layout</a>
        <a href="#">Sub Menu 2</a>
        <a href="#">Sub Menu 3</a>        
      </div>
    </div>
  </div>
  </body></html>