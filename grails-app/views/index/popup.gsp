
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
		          height: '375',
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
	<div id="header">alumNET</div>
	<div id="container" class="b">

		<div id="textBox" class="heading box">
			<p>Education Institute Box</p>
			<table>
				<tr>
					<td>Name:</td>
					<td>
						${educationInstitute?.name}
					</td>
				</tr>
				<tr>
					<td>Beschreibung:</td>
					<td>
						${educationInstitute?.educationInstituteDescription}
					</td>
				</tr>
				<tr>
					<td>Gründungsjahr:</td>
					<td>
						${educationInstitute?.yearOfFoundation}
					</td>
				</tr>
				<tr>
					<td>Wiki-Link:</td>
					<td><a href="${educationInstitute?.wikipediaHyperlink}"
						target="_blank">
							${educationInstitute?.wikipediaHyperlink}
					</a></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td>
						${educationInstitute?.email}
					</td>
				</tr>
				<tr>
					<td>Adresse:</td>
					<td>
						${educationInstitute?.streetAndHouseNumber}
					</td>
					<td>
						${educationInstitute?.zipCode} ${educationInstitute?.city }
					</td>
				</tr>
			</table>

			<div id="alumniBox" class="box">
				<p>Alumni Box</p>
				<b>Anzahl Absolventen</b>:
				${educationInstitute?.alumnusList?.size()}<br>
				<table>
					<tr>
						<td>Name</td>
						<td>Beruf</td>
						<td>Wiki-Link</td>
					</tr>
					<g:each var="i" in="${educationInstitute?.alumnusList}">
						<tr>
							<td>
								${i.alumniName}
							</td>
							<td>
								${i.jobTitle}
							</td>
							<td><a href="${i.wikipediaHyperlink}" target="_blank">
									${i.wikipediaHyperlink}
							</a></td>
						</tr>
					</g:each>
				</table>
			</div>

		</div>


		<div id="statisticBox" class="box">
			<p>Statistic Box</p>
			<div id="statistenBox"></div>
		</div>

	</div>
	<r:layoutResources />
	<a id="lizenzBild" href="http://www.freepik.com">Designed by Freepik</a>
</body>
</html>
