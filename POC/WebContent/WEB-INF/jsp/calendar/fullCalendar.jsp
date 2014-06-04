<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Full Calendar</title>
<script type='text/javascript' src='js/jquery/jquery-1.8.1.min.js'></script>
<script type='text/javascript' src='js/jquery/jquery-ui-1.8.23.custom.min.js'></script>
<script type='text/javascript' src='js/fullcalendar/fullcalendar.min.js'></script>

<link rel='stylesheet' type='text/css' href='css/fullcalendar/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='css/fullcalendar/fullcalendar.print.css' media='print' />
<link href="css/datatable/jquery.dataTables_themeroller.css" rel="stylesheet" type="text/css" />
<link href="css/smoothness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>

	$(document).ready(function() {
	
		$('#calendar').fullCalendar({
		
			editable: true,
			
			eventDrop: function(event, delta) {
				alert(event.title + ' was moved ' + delta + ' days\n' +
					'(should probably update your database)');
			},
			
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		});
		
		$('#calendar').fullCalendar('addEventSource', function (start, end, callback) {
			var curDate = $('#calendar').fullCalendar('getDate');

            $.ajax({
                    type: 'GET',
                    url: 'getEvents.html',
                    async: false,
                    dataType: "json",
                    data: {
                        // our hypothetical feed requires UNIX timestamps
                        start: start,
                        end: end,
                        id: 1,
                        currentYear: $.fullCalendar.formatDate(curDate, "yyyy"),
                        currentMonth: $.fullCalendar.formatDate(curDate, "MM")

                    },
                    success: function (doc) {
                        callback(doc);
                    },
                    error: function (xhr, status, error) {
                        document.appendChild(xhr.responseText);
                    }
                }); //end ajax
        });
		
	});

</script>
<style type='text/css'>

	body {
		margin-top: 40px;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}
		
	#loading {
		position: absolute;
		top: 5px;
		right: 5px;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>
<body>
	<div class="midarea">
	<div id='loading' style='display:none'>loading...</div>
		<div id='calendar'></div>
	</div>
</body>
</html>