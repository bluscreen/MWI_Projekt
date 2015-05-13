<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>openData</title>
		<g:javascript library="jquery"/>
		<r:require module="jquery-ui"/>
		<asset:stylesheet src="leaflet.css" />
		<asset:stylesheet src="screen.css" />
		<asset:stylesheet src="main.css" />
		<asset:stylesheet src="application.css" />
		<asset:javascript src="application.js" />
	
		  <r:layoutResources/>
	</head>
	
	<body onload="calculateMiddlePoint();">
		<div class="banner test">
			<div class="stripe">
				<div class="left">alumNET</div>
				</div>
		</div> 
	
	
		<div class="container">
				
				<a href="#page-body" class="skip"><g:message
						code="default.link.skip.label" default="Skip to content&hellip;" /></a>
			
				<div id="searchBox" class="Box">
				<b>Fehler!</b><br/><br/>Leider ist ein Fehler aufgetreten.<br/>Bitte versuchen Sie es später nochmal.
<%--					<g:renderException exception="${exception}" />--%>
				</div>
		
		<r:layoutResources/>
	</body>
</html>
