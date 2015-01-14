<html>
<head>
<title>Informationen</title>
<asset:stylesheet src="popup.css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>

<body>
	
	<div class="container1">
		<div id="textBox" class="box" ><b>Text Box</b> ${educationInstitute?.educationInstituteDescription}</div>
		<div id="statisticBox" class="box">Statistic Box</div>
		
	</div>
	
	<div class="container2">
	<table id="infoBox" class="box">
		<tr>
			<td><b>Name der Bildungseinrichtung:</b> ${educationInstitute?.name}<br>
			<br> <b>Typ der Bildungseinrichtung:</b> unklar<br>
			<br> <b>Adresse:</b><br> ${educationInstitute?.streetAndHouseNumber}<br>
				${educationInstitute?.zipCode} ${educationInstitute?.city }<br>
			<br>

				<div id="anzahlAbsolventen"></div>
				<br>
				<div id="anzahlStudiengaenge"></div>
				<br> <b>Studiengänge mit Absolventen:</b>
				<div id="studiengaengeAbsolventen"></div></td>
		</tr>
		</table>
		
		<div id="alumniBox" class="box">Alumni Box </div>
		
				
			
		</div>
	
</body>
</html>


