<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Welcome</title>
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/upload/fileuploader.js"></script>
<script type="text/javascript" src="js/datatable/jquery.dataTables.js"></script>

<link href="css/upload/fileuploader.css" rel="stylesheet" type="text/css"/>
<link href="css/datatable/demo_page.css" rel="stylesheet" type="text/css" />
<link href="css/datatable/jquery.dataTables_themeroller.css" rel="stylesheet" type="text/css" />
<link href="css/smoothness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#filesTable').dataTable( {
					"bJQueryUI": true,
					"sPaginationType": "full_numbers"
				} );
			} );
		</script>
		
<script type="text/javascript">
giCount=1;
function createUploader(){
    var uploader = new qq.FileUploader({
    	button: $('#file-uploader').parent()[0],
        element: document.getElementById('file-uploader'),
        action: 'multipleUpload.html',  //action class path
        allowedExtensions: ['jpg', 'jpeg', 'gif','png'], //input file types
		sizeLimit: 512000, // max size
		onComplete: function(id, fileName, response){
			if(response!=null && response.success==true){
				$(".qq-upload-success").remove();
				$('#filesTable').dataTable().fnAddData( [giCount++,fileName,"SUCCESS",""] );
			}else{
				$(".qq-upload-success").remove();
				$('#filesTable').dataTable().fnAddData( [giCount++,fileName,"FAILED",""] );
			}
			
			                                    
        },
        debug: true
    });
}

// in your app create uploader as soon as the DOM is ready
// don't wait for the window to load
window.onload = createUploader;

</script>
</head>
<body>
<div class="midarea">
	<div id="file-uploader" style="margin-left:40px">
		<noscript>
			<p>Please enable JavaScript to use file uploader.</p> 
		</noscript>
	</div>
	<input type="hidden" name="qqFiles" id="qqFilesId"/>
	<div style="width: 80%;margin-left:50px">
	<table cellpadding="0" cellspacing="0" border="0" class="display" align="center" id="filesTable" width="100%">
	<thead>
			<tr>
				<th>S.No</th>
				<th>FileName</th>
				<th>Status</th>
				<th>OP</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	</div>
</div>
</body>
</html>