
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
		 ${educationInstitute?.jobStatisticList.eachWithIndex{ num, idx ->  println "$idx: $num" }}


		//Beispieldaten
		 var berufeAbsolventen = new Array();
		 
			berufeAbsolventen[0] = new Array();
		    berufeAbsolventen[0][0] = "BWL";
		    berufeAbsolventen[0][1] = "Stefan Raab";
		    berufeAbsolventen[0][2] = "Thomas Gotschalk";
		    berufeAbsolventen[0][3] = "Günther Jauch";

		    berufeAbsolventen[1] = new Array();
		    berufeAbsolventen[1][0] = "Informatik";
		    berufeAbsolventen[1][1] = "Markus Lanz";
		    berufeAbsolventen[1][2] = "Dieter Bohlen";

		    berufeAbsolventen[2] = new Array();
		    berufeAbsolventen[2][0] = "Maschinenbau";
		    berufeAbsolventen[2][1] = "Bühlent Ceylan";

		    var forData = new Array();
		    forData[0] = new Array();
			forData[0][0] = "Berufe";
			forData[0][1] = "Absolventen";

			var anzahlAbsolventen = 0;
			var studiengaengeAbsolventen = "<ul>";

			//String erstellen, fuer die Anzeige der Berufsanzahl, der Absolventenanzahl und es werden die Absolventen den Berufen zugeordnet
		    for(var i=0; i<berufeAbsolventen.length; i++){
			    forData[i+1] = new Array();
				forData[i+1][0] = berufeAbsolventen[i][0];
				forData[i+1][1] = berufeAbsolventen[i].length-1;
				anzahlAbsolventen = anzahlAbsolventen + berufeAbsolventen[i].length-1;

				studiengaengeAbsolventen = studiengaengeAbsolventen + "<li>" + berufeAbsolventen[i][0] + "</li><ul>";

				for(var x = 1; x<berufeAbsolventen[i].length; x++){
					studiengaengeAbsolventen = studiengaengeAbsolventen + "<li>" + berufeAbsolventen[i][x] + "</li>";
				}

				studiengaengeAbsolventen = studiengaengeAbsolventen + "</ul><br>";
		    }

		    studiengaengeAbsolventen = studiengaengeAbsolventen + "</ul>";

		    //Anzeigen des Kreisdiagramms

			google.load("visualization", "1", {packages:["corechart"]});	
			google.setOnLoadCallback(drawChart);
			
			    function drawChart() {
		    	 var data = google.visualization.arrayToDataTable(forData);
	
		        var options = {
		          title: 'Statistik der Berufe:',
		          is3D: true,
		        };
	
		        var chart = new google.visualization.PieChart(document.getElementById('statisticBox'));
		        chart.draw(data, options);
		     }
			
		//Nach laden des Fensters werden die Strings angezeigt
		window.onload = function () {
			document.getElementById("anzahlStudiengaenge").innerHTML = "<b>Anzahl der Studiengänge: </b>" + berufeAbsolventen.length;
			document.getElementById("studiengaengeAbsolventen").innerHTML = studiengaengeAbsolventen;		     
		}
   
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
			Statistic Box
		</div>
	</div>
	
	<div class="container2">
		<div id="alumniBox" class="box">
			Alumni Box <br>
			<b>Anzahl Absolventen</b>: ${educationInstitute?.alumnusList?.size()}<br>
			<g:each var="i" in="${educationInstitute?.alumnusList}">
				${i.name} ${i.jobTitle} ${i.wikipediaHyperlink} 
			</g:each>
		</div>
	</div>
</div>
 <r:layoutResources/>
</body>
</html>
