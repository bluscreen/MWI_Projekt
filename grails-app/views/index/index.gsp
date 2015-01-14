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
		
		<script src='https://api.tiles.mapbox.com/mapbox.js/v2.1.4/mapbox.js'></script>
		<link href='https://api.tiles.mapbox.com/mapbox.js/v2.1.4/mapbox.css' rel='stylesheet' />
		<script src='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-markercluster/v0.4.0/leaflet.markercluster.js'></script>
		<link href='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-markercluster/v0.4.0/MarkerCluster.css' rel='stylesheet' />
		<link href='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-markercluster/v0.4.0/MarkerCluster.Default.css' rel='stylesheet' />
		
		<script type="text/javascript">
		// include coordinates from search here
		<g:applyCodec encodeAs="none"> var koord = [ ${markers} ]; </g:applyCodec>
			function calculateMiddlePoint(){
				clearMarkers();
				if(koord.length != 1){
					for(var i=0; i<koord.length; i++){
						cluster(koord[i][0], koord[i][1], koord[i][2]);
					}
					fitTheBounds();
				}
			
				//Nur eine Position
				else{
					showMarker(koord[0][0], koord[0][1],koord[i][2]);
					fitTheBounds();
					showPopup();
				}
			}

			function updateModal(data){
				 $("#dialog").html(data);
				 $("#dialog").dialog("open");
			 }

			function popupInfos(event){
				ev = event || window.event;
				${remoteFunction( action:'popup',
                        params: '\'id=\'+escape(ev.id)',
						onSuccess: 'updateModal(data)')} 
			}
		  </script>
		  <r:layoutResources/>
	</head>
	
	<body onload="calculateMiddlePoint();">
		<section class="module parallax parallax-1 test">
			<div class="stripe">
				<div class="left">OpenData</div>
				<div class="right">
					Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
					nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
					erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
					et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
					Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur
					sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
					et dolore magna aliquyam erat, sed diam voluptua.<br />
					<h2>[[ skrəʊl daʊn ]]</h2><br/>
					<g:select class="languages" name="systemLanguage"
					onchange="${remoteFunction( action:'updateLanguage',
	                                          params: '\'lang=\'+escape(this.value)',
											  onComplete: 'location.reload();')}"
					from="${languages}" optionKey="languageId"
					optionValue="languageName"
					value="${session.getAttribute("systemLanguage")}" />
				</div>
			</div>
		</section> 
	
		<section class="module content">
			<div class="container">
			
				<a href="#page-body" class="skip"><g:message
						code="default.link.skip.label" default="Skip to content&hellip;" /></a>
				<div id="status">
					<g:form action="index" method="get"> 
					<ul>
						<li><g:textField class="searchfields" 
								name="staat"
								placeholder="${labels.getText(labels.TEXTID_State, session.getAttribute("systemLanguage"))}"
								value="${params['staat']}" /></li>
						<li><g:textField class="searchfields" 
								name="ort"
								placeholder="${labels.getText(labels.TEXTID_City, session.getAttribute("systemLanguage")) }"
								value="${params['ort']}" /></li>
						<li><g:textField class="searchfields"
								name="bildungseinrichtung"
								placeholder="${labels.getText(labels.TEXTID_Education_Institute, session.getAttribute("systemLanguage")) }"
								value="${params['bildungseinrichtung']}"/></li>
						<li><g:textField class="searchfields" 
								name="person"
								placeholder="${labels.getText(labels.TEXTID_Person, session.getAttribute("systemLanguage")) }"
								value="${params['person']}"/></li>
						<li><g:textField class="searchfields" 
								name="beruf"
								placeholder="${labels.getText(labels.TEXTID_Job, session.getAttribute("systemLanguage")) }"
								value="${params['beruf']}"/></li>
						<li><g:submitButton id="searchButton" name="search"/></li>
					</ul>
					</g:form>
					
					<ul>
						<li>ergebnisse: ${session.getAttribute("systemLanguage")}</li>
						<g:each var="i" in="${institutes}">
							<li>
								${i}
							</li>
						</g:each>
					</ul>
					
				</div>
	
	
				<div id="map"></div>
	
				<div id="dialog" style="display:none" title="Basic dialog">
				  <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
				</div>
				<g:javascript>
				    var markerArray = null;
				    var markers = null;
				    var poly = null;
				 	 // create a map in the "map" div, set the view to a given place and zoom
					var map = L.map('map').setView([49.0158491, 8.4095339], 13);
					 
					// add an OpenStreetMap tile layer
					L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { attribution: '&copy; <a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.openstreetmap.org/copyright">Mitwirkende</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/deed.de">CC-BY-SA</a>'}).addTo(map);
					 
					 function clearMarkers(){
						markerArray = new Array();
						markers = new L.MarkerClusterGroup();			
					 }
					 
					// add a marker in the given location, attach some popup content to it and open the popup
					function showMarker(latitude, longitude){
						poly =  L.marker([latitude, longitude]);
						markerArray.push(poly);
					}
						
					//Objekte gruppieren
					 function cluster(latitude, longitude, objid){
						poly =  L.marker([latitude, longitude]);
						link = '<button id="'+objid+'" onclick="popupInfos('+objid+')">ER KLICKE</button>';
						d=document.createElement('div');
					 	$(d).html("ID: "+objid+"<br/>"+link);
					 	poly.bindPopup($(d).prop('outerHTML'));
					 	markerArray.push(poly);
						markers.addLayer(poly);
					 }
					 
					//zoom and center
					 function fitTheBounds(){
					 	var group = new L.featureGroup(markerArray);
					 	map.addLayer(markers);
						map.fitBounds(group.getBounds());
					 }
	 
					 function showPopup(){
					 	poly.openPopup();
					 }
					  $(function() {
				 $("#dialog").dialog({autoOpen:false, modal: true, width: 800, height:500});
				});
				 </g:javascript>
			</div>
		</section>
		<r:layoutResources/>
	</body>
</html>
