<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>openData</title>
		<g:javascript library="application"/>
  		<g:javascript library="jquery"/>
 		<g:javascript library="jquery-ui"/>
		<asset:stylesheet src="leaflet.css" />
		<asset:stylesheet src="screen.css" />
		<asset:stylesheet src="main.css" />
		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<modalbox:modalIncludes />
		<script type="text/javascript">
function calculateMiddlePoint(){
	var koord = new Array();

	koord[0] = new Object();
	koord[0]["latitude"] = 50;
	koord[0]["longitude"] = 20;

	clearMarkerArray();
	
	if(koord.length != 1){
		for(var i=0; i<koord.length; i++){
			showMarker(koord[i]["latitude"], koord[i]["longitude"]);
		}
		
		fitTheBounds();
	}

	//Nur eine Position
	else{
		showMarker(koord[0]["latitude"], koord[0]["longitude"]);	
		fitTheBounds();
		showPopup();
	}
}
		</script>
	</head>
	
	<body>
		<section class="module parallax parallax-1 test">
		<div class="stripe">
			<div class="left">OpenData</div>
			<div class="right">Lorem ipsum dolor sit amet, consetetur
				sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
				et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
				accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
				no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum
				dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
				tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
				voluptua.<br/>
				<h2>[[ skrəʊl daʊn ]] </h2>
				</div>
		</div>
		</section>
	
		<section class="container">
	
		<div><g:select class="languages" name="system.language" from="${['Deutsch', 'Englisch', '...']}" value="${language}"
          noSelection="['':'Sprache']"/></div>
	
		</section>
	
		<section class="module content">
		<div class="container">
		
			<a href="#page-body" class="skip"><g:message
					code="default.link.skip.label" default="Skip to content&hellip;" /></a>
					
			<div id="status" role="complementary">
				<ul>
					<li><g:textField class="searchfields" name="staat" placeholder="Staat" /></li>
					<li><g:textField class="searchfields" name="ort" placeholder="Ort" /></li>
					<li><g:textField class="searchfields" name="bildungseinrichtung" placeholder="Bildungseinrichtung" /></li>
					<li><g:textField class="searchfields" name="person" placeholder="Person" /></li>
					<li><g:textField class="searchfields" name="beruf" placeholder="Beruf" /></li>
					<li><g:submitButton id="searchButton" name="search"/></li>
					<input type="button" value="hehe" onclick="calculateMiddlePoint();"/>
				</ul>
				
				<ul>
				<li>ergebnisse</li>
					<g:each var="i" in="${doener}">
						<li>
							${i}
						</li>
					</g:each>
				</ul>

			</div>
			
			
	
			<div id="map"></div>
			
			<g:javascript>
			    var markerArray = null;
			    var poly = null;
			 	 // create a map in the "map" div, set the view to a given place and zoom
				var map = L.map('map').setView([49.0158491, 8.4095339], 13);
				 
				// add an OpenStreetMap tile layer
				L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { attribution: '&copy; <a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.openstreetmap.org/copyright">Mitwirkende</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/deed.de">CC-BY-SA</a>'
				}).addTo(map);
				 
				 function clearMarkerArray(){
					markerArray = new Array();
				 }
				 
				 
				// add a marker in the given location, attach some popup content to it and open the popup
				function showMarker(latitude, longitude){
					poly =  L.marker([latitude, longitude]);
					markerArray.push(poly);
					poly.addTo(map).bindPopup('<font color=\"black\"><b>Thomas Heiles<br>Stra&szlig;e123<br>54290 Trier</b><br/> ${modalbox.createLink(controller:"index", action:"popup", title:"Ich bin das Popup!", width:"600", height:"300", linkname:"Read more...")}</font>');
				}
				
				//zoom and center
				 function fitTheBounds(){
				 	var group = new L.featureGroup(markerArray);
					map.fitBounds(group.getBounds());
				 }
				 
				 function showPopup(){
				 	poly.openPopup();
				 }
			 </g:javascript>
		</div>

		</section>
	</body>
</html>
