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
	
		<script src='https://api.tiles.mapbox.com/mapbox.js/v2.1.4/mapbox.js'></script>
		<link href='https://api.tiles.mapbox.com/mapbox.js/v2.1.4/mapbox.css' rel='stylesheet' />
		</head>
		<body>
		<script src='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-markercluster/v0.4.0/leaflet.markercluster.js'></script>
		<link href='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-markercluster/v0.4.0/MarkerCluster.css' rel='stylesheet' />
		<link href='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-markercluster/v0.4.0/MarkerCluster.Default.css' rel='stylesheet' />
		
		<!-- Example data. -->
		<script src="/mapbox.js/assets/data/realworld.388.js"></script>



		<script type="text/javascript">
		function calculateMiddlePoint(){
			/*var koord = new Array();
		
		
			koord[0] = new Object();
			koord[0][0] = 2.1;
			koord[0][1] = 2.1;
			//koord[0]["Wohnort"] = "Dresden";
		
			koord[1] = new Object();
			koord[1][0] = 2;
			koord[1][1] = 2;
			//koord[1]["Wohnort"] = "Berlin";
		
			koord[2] = new Object();
			koord[2][0] = 15.026461;
			koord[2][1] = 15.026461;
			//koord[1]["Wohnort"] = "Berlin";
		
			koord[3] = new Object();
			koord[3][0] = 0;
			koord[3][1] = 0;*/
			//alert("soso13");
			clearMarkers();
			//alert("soso177");
			if(koord.length != 1){
				for(var i=0; i<koord.length; i++){
					//showMarker(koord[i]["latitude"], koord[i]["longitude"]);
					//cluster(koord[i]["latitude"], koord[i]["longitude"]);
					cluster(koord[i][0], koord[i][1]);
				}
				//alert("soso14");
				fitTheBounds();
				//alert("soso15");
			}
		
			//Nur eine Position
			else{
				//alert("soso2");
				showMarker(koord[0][0], koord[0][1]);
				//alert("soso3");	
				fitTheBounds();
				//alert("soso4");
				showPopup();
			}
		
			//alert("soso5");
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
			    var markers = null;
			    var poly = null;
			 	 // create a map in the "map" div, set the view to a given place and zoom
				var map = L.map('map').setView([49.0158491, 8.4095339], 13);
				 
				// add an OpenStreetMap tile layer
				L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { attribution: '&copy; <a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.openstreetmap.org/copyright">Mitwirkende</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/deed.de">CC-BY-SA</a>'
				}).addTo(map);
				 
				 function clearMarkers(){
					markerArray = new Array();
					markers = new L.MarkerClusterGroup();			
				 }
				 
				 
				// add a marker in the given location, attach some popup content to it and open the popup
				function showMarker(latitude, longitude){
					poly =  L.marker([latitude, longitude]);
					markerArray.push(poly);
					poly.addTo(map).bindPopup('<font color=\"black\"><b>Thomas Heiles<br>Stra&szlig;e123<br>54290 Trier</b><p><img src=\ "test.jpg\" width=\ "180\" height=\"113\"></p>${modalbox.createLink(controller:"index", action:"popup", title:"Ich bin das Popup!", width:"600", height:"300", linkname:"Read more...")}</font>');
				}
				
				//Objekte gruppieren
				 function cluster(latitude, longitude){
					poly =  L.marker([latitude, longitude]);
					poly.bindPopup('<font color=\"black\"><b>Thomas Heiles<br>Stra&szlig;e123<br>54290 Trier</b><p><img src=\ "test.jpg\" width=\ "180\" height=\"113\"></p>${modalbox.createLink(controller:"index", action:"popup", title:"Ich bin das Popup!", width:"600", height:"300", linkname:"Read more...")}</font>');
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
				 

			 </g:javascript>
		</div>

		</section>
	</body>
</html>
