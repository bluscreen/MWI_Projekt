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
			$(document).ready(function() {
				// Tooltip only Text
				$('.masterTooltip').hover(function(){
				// Hover over code
			    var title = $(this).attr('title');
				$(this).data('tipText', title).removeAttr('title');
				$('<p class="tooltip"></p>')
				.text(title)
				.appendTo('body')
				.fadeIn('slow');
			}, function() {
				// Hover out code
				$(this).attr('title', $(this).data('tipText'));
				$('.tooltip').remove();
			}).mousemove(function(e) {
				var mousex = e.pageX + 20; //Get X coordinates
				var mousey = e.pageY + 10; //Get Y coordinates
				$('.tooltip')
				.css({ top: mousey, left: mousex })
				});
			});

			// include coordinates from search here
			var koord = [ ${raw(markers)} ];
			function calculateMiddlePoint(){
				clearMarkers();
				for(var i=0; i<koord.length; i++){
					cluster(koord[i][0], koord[i][1], koord[i][2], koord[i][3], koord[i][4]);
				}
				fitTheBounds();
				if(koord.length == 1){
					showPopup();
				}
			}
		  </script>
		  <r:layoutResources/>
	</head>
	
	<body onload="calculateMiddlePoint();">
		<div class="banner test">
			<div class="stripe">
				<div class="left">alumNET</div>
					<div class="right">
						<div class="right-top">
						</div>
						<div class ="right-infocontainer">
							<a id="infoLink" href='<g:createLink controller="index" action="info"/>'>${labels.getText(textId.TEXTID_AboutUs.getTextid(), session.getAttribute("systemLanguage"))}</a>
							<b>/</b>
							<a id="impressum" href='<g:createLink controller="index" action="impressum"/>'>${labels.getText(textId.TEXTID_Imprint.getTextid(), session.getAttribute("systemLanguage"))}</a>
						</div>
					</div>
			</div>
		</div> 
	
		<div class="container">
				<a href="#page-body" class="skip"><g:message
						code="default.link.skip.label" default="Skip to content&hellip;" /></a>
				<div id="searchBox" class="Box">
					<g:form action="index" method="get"> 
					<ul><li><g:select id="language" class="searchfields masterTooltip" name="systemLanguage"
								title="Please select the language you wish the search is being performed"
								onchange="${remoteFunction( action:'updateLanguage',
					                                          params: '\'lang=\'+escape(this.value)',
															  onComplete: 'location.reload();')}"
								from="${languages}" optionKey="languageId"
								optionValue="languageName"
								value="${session.getAttribute("systemLanguage")}" /></li>
						<li><g:textField class="searchfields masterTooltip" 
								title="Please enter the name of the state the educational institution is located in"
								name="staat"
								placeholder="${labels.getText(textId.TEXTID_State.getTextid(), session.getAttribute("systemLanguage"))}"
								value="${params['staat']}" /></li>
						<li><g:textField class="searchfields masterTooltip" 
								title="Please enter the name of the city the educiotional institution is located in"
								name="ort"
								placeholder="${labels.getText(textId.TEXTID_City.getTextid(), session.getAttribute("systemLanguage")) }"
								value="${params['ort']}" /></li>
						<li><g:textField class="searchfields masterTooltip"
								title="Please enter the name of the educational institution"
								name="bildungseinrichtung"
								placeholder="${labels.getText(textId.TEXTID_Education_Institute.getTextid(), session.getAttribute("systemLanguage")) }"
								value="${params['bildungseinrichtung']}"/></li>
						<li><g:textField class="searchfields masterTooltip"
								title="Please enter the name of the Alumni"
								name="person"
								placeholder="${labels.getText(textId.TEXTID_Person.getTextid(), session.getAttribute("systemLanguage")) }"
								value="${params['person']}"/></li>
						<li><g:textField class="searchfields masterTooltip" 
								title="Please enter the profession of the Alumni" 
								name="beruf"
								placeholder="${labels.getText(textId.TEXTID_Job.getTextid(), session.getAttribute("systemLanguage")) }"
								value="${params['beruf']}"/></li>
						<li><g:actionSubmitImage id="searchButton" class="masterTooltip"  title="Go!" name="search" value="index"
                     src="${resource(dir: 'images', file: 'lupe.png')}" /></li>
					</ul>
					</g:form>
					
					<g:if test="${renderList}">
					<ul style="width:15em; overflow:auto;cursor: pointer">
						<li class="masterTooltip " title="Your search returned ${institutes.size()} results:">${institutes.size()} results</li>
<!--						${indexCounter = -1}  -->
						<g:each var="i" in="${institutes}">
						<li class="results" onclick="zoomToMarker(${++indexCounter})">
								${i.name}, ${i.city}
						</li>
						</g:each>
					</ul>
					</g:if>
				</div>
				<div id="mapBox">
					<div id="map"></div>
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
						
					//Objekte gruppieren
					 function cluster(latitude, longitude, objid, name, ort){
						poly =  L.marker([latitude, longitude]);
						link = '<a href="<g:createLink controller="index" action="popup" id="'+objid+'"/>" target="_blank">Details</a>';
						d=document.createElement('div');
						$(d).attr('id', objid);
					 	$(d).html(name + "<br/>" + ort + "<br/>" + link);
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
					 
					 function zoomToMarker(index){
						 markers.zoomToShowLayer(markerArray[index], function() {
					        markerArray[index].openPopup();
					    });
					 }
					 
				 </g:javascript>
		<r:layoutResources/>
	</body>
</html>
