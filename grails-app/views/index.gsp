<!DOCTYPE html>
<html>
	<head>


		<meta name="layout" content="main"/>
		<title>openData</title>
		<asset:stylesheet src="leaflet.css" />
		<asset:stylesheet src="screen.css" />

		
	</head>
	<body>
	<section class="module parallax parallax-1">
		  <div class="container">
		    <h1>OpenData</h1>
		  </div>
	</section>

	<section class="module content">
  		<div class="container">
		  <h2>Lorem Ipsum Dolor</h2>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
		  

		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			
		<ul>
		
	    <li><g:textField name="staat" placeholder="Staat"/></li>
	   	<li><g:textField name="ort" placeholder="Ort"/></li>
	   	<li><g:textField name="bildungseinrichtung" placeholder="Bildungseinrichtung"/></li>
	 	<li><g:textField name="person" placeholder="Person"/></li>
	    <li><g:textField name="beruf" placeholder="Beruf"/></li>
	    <li><g:submitButton name="create" value="Suche"/> </li>
	
		</ul>	
			nn
			gzugzjkkl bla bla vv
			<label style="margin-top: 3em">Suchergebnisse</label>
			  
   				<ul>
  				<g:each var="i" in="${bildungseinrichtung}">
    			<li> ${i.name}</li>
  				</g:each>
				</ul>
			
		</div>
		<div>
		
 		</div>
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
				<br/>
				Deine Suche ergab x Treffer
		
			 <div id="map"></div>
			
				  
			 <g:javascript>
			 	 // create a map in the "map" div, set the view to a given place and zoom
				var map = L.map('map').setView([49.0158491, 8.4095339], 13);
				 
				// add an OpenStreetMap tile layer
				L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
				 attribution: '&copy; <a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.openstreetmap.org/copyright">Mitwirkende</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/deed.de">CC-BY-SA</a>'
				}).addTo(map);
				 
				// add a marker in the given location, attach some popup content to it and open the popup
				L.marker([49.026461, 8.385757]).addTo(map)
				.bindPopup('<font color=\"black\"><b>Thomas Heiles<br>Stra&szlig;e 123<br>54290 Trier</b><p><img src=\"test.jpg\" width=\"180\" height=\"113\"></p>mehr</font>')
				.openPopup();
			 </g:javascript>
		</div>
		</div>
		</section>
	</body>
</html>
