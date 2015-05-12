
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>openData</title>
		<asset:stylesheet src="popup.css" />
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 		<script type="text/javascript">
    	
		// TEST...  STH MUST BE HERE.... SOMEHOW.. IF THERE IS ANYTHING COMING FROM DB!!
		// size of jobstatisticlist: ${educationInstitute?.jobStatisticList?.size()}
		//Anzeigen des Kreisdiagramms
		    
			google.load("visualization", "1", {packages:["corechart"]});	
			google.setOnLoadCallback(drawChart);
			
			    function drawChart() {

			   	var data = google.visualization.arrayToDataTable([
		   			['Beruf', 'Anzahl Absolventen'],
		   			 ${raw(jsdString)}                  		    
		       		 ]);
	       		 
		        var options = {
		          backgroundColor: 'transparent',
		          width: '500',
		          is3D: true,
		        };
	
		        var chart = new google.visualization.PieChart(document.getElementById('statistenBox'));
		        chart.draw(data, options);
		     }
			
		//Nach laden des Fensters werden die Strings angezeigt
		
		// wird das hier noch benötigt? :
<%--		window.onload = function () {--%>
<%--			document.getElementById("anzahlStudiengaenge").innerHTML = "<b>Anzahl der Studiengänge: </b>" + berufeAbsolventen.length;--%>
<%--			document.getElementById("studiengaengeAbsolventen").innerHTML = studiengaengeAbsolventen;		     --%>
<%--		}--%>
   
 	   </script>
    </head>
    <body>

<div class="b">
	<div class="container1">
		<div id="textBox" class="box">
			<b>Name:</b> ${educationInstitute?.name}<br>
			<b>Beschreibung:</b> ${educationInstitute?.educationInstituteDescription}<br>
			<b>Gründungsjahr:</b> ${educationInstitute?.yearOfFoundation}<br>
			<b>Wiki-Link:</b> <a href="${educationInstitute?.wikipediaHyperlink}" target="_blank">${educationInstitute?.wikipediaHyperlink}</a><br>
			<b>Email:</b> ${educationInstitute?.email}<br>	
			<b>Adresse:</b><br> ${educationInstitute?.streetAndHouseNumber}<br>
			 ${educationInstitute?.zipCode} ${educationInstitute?.city }<br>
		</div>
		
		<div id="statisticBox" class="box">
			Statistic Box<br>
			<div id="statistenBox"></div>
		</div>
	</div>
	
	<div class="container2">
		<div id="alumniBox" class="box">
			Alumni Box <br>
			<b>Anzahl Absolventen</b>: ${educationInstitute?.alumnusList?.size()}<br>
			<table>
				<tr>
					<td width="25%">Name</td>
					<td width="25%">Beruf</td>
					<td>Wiki-Link</td>
				</tr>
			<g:each var="i" in="${educationInstitute?.alumnusList}">
				<tr>
					<td>${i.alumniName}</td>
					<td> ${i.jobTitle}</td>
					<td><a href="${i.wikipediaHyperlink}" target="_blank">${i.wikipediaHyperlink}</a></td>
				</tr>
			</g:each>
			</table>
		</div>
	</div>
</div>
 <r:layoutResources/>
</body>
</html>
