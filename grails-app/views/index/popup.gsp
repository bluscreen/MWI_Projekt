<html>
<head>
<title>Informationen</title>
<asset:stylesheet src="popup.css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>


</head>

<body>

	<table style="width: 100%">
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
			<td>
				<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
			</td>
		</tr>
	</table>
</body>
</html>


