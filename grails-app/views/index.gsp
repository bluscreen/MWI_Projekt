<!DOCTYPE html>
<html>
<head>


<meta name="layout" content="main" />
<title>openData</title>
<asset:stylesheet src="leaflet.css" />
<asset:stylesheet src="screen.css" />
<asset:stylesheet src="main.css" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<modalbox:modalIncludes />
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
				voluptua.
				<h2>
				[[ skrəʊl daʊn ]] </h2>
				</div>
		</div>
	</section>
	
	<section class="container">
	
		<div><g:select class="languages" name="system.language" from="${['Deutsch', 'Englisch', '...']}" value="${language}"
          noSelection="['':'Sprache']"/></div>
	
	</section>
	
	<section class="module content">
		<div class="container">
		
		
		
    <!-- Modal HTML -->

			<a href="#page-body" class="skip"><g:message
					code="default.link.skip.label" default="Skip to content&hellip;" /></a>
					
		<modalbox:createLink controller="staat" action="popup" 
				title="Ich bin das Popup!" width="600" height="300"
				linkname="Read more..." />
				
			
    
			<div id="status" role="complementary">

				<ul>
					
					<li><g:textField class="searchfields" name="staat" placeholder="Staat" /></li>
					<li><g:textField class="searchfields" name="ort" placeholder="Ort" /></li>
					<li><g:textField class="searchfields" name="bildungseinrichtung" placeholder="Bildungseinrichtung" /></li>
					<li><g:textField class="searchfields" name="person" placeholder="Person" /></li>
					<li><g:textField class="searchfields" name="beruf" placeholder="Beruf" /></li>
					<li><g:submitButton id="searchButton" name=" "/></li>

				</ul>
				
				
				<ul>
				<li>ergebnisse</li>
					<g:each var="i" in="${bildungseinrichtung}">
						<li>
							${i.name}
						</li>
					</g:each>
				</ul>

			</div>
			
			
	
			<div id="map"></div>
			
			<g:javascript>
			 	 // create a map in the "map" div, set the view to a given place and zoom
				var map = L.map('map').setView([49.0158491, 8.4095339], 13);
				 
				// add an OpenStreetMap tile layer
				L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { attribution: '&copy; <a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.openstreetmap.org/copyright">Mitwirkende</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/deed.de">CC-BY-SA</a>'
				}).addTo(map);
				 
				// add a marker in the given location, attach some popup content to it and open the popup
				L.marker([49.026461, 8.385757]).addTo(map).bindPopup('<font color=\"black\"><b>Thomas Heiles<br>Stra&szlig;e123<br>54290 Trier</b><p><img src=\ "test.jpg\" width=\ "180\" height=\"113\"></p>mehr</font>').openPopup();
			 </g:javascript>
		</div>

	</section>
</body>
</html>
