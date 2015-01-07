<html>
<head>
<title>Informationen</title>
<asset:stylesheet src="popup.css" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 
    <script type="text/javascript">
    window.onload = function () {
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
		    forData[0] = new Object();
			forData[0][0] = "Berufe";
			forData[0][1] = "Absolventen";

			var anzahlAbsolventen = 0;
			var studiengaengeAbsolventen = "<ul>";

		    for(var i=1; i<berufeAbsolventen.length; i++){
			    forData[i] = new Array();
				forData[i][0] = berufeAbsolventen[i][0];
				forData[i][1] = berufeAbsolventen[i].length-1;
				anzahlAbsolventen = anzahlAbsolventen + berufeAbsolventen[i].length-1;

				studiengaengeAbsolventen = studiengaengeAbsolventen + "<li>" + berufeAbsolventen[i][0] + "</li><ul>";

				for(var x = 1; x<berufeAbsolventen[i].length; x++){
					studiengaengeAbsolventen = studiengaengeAbsolventen + "<li>" + berufeAbsolventen[i][x] + "</li>";
				}

				studiengaengeAbsolventen = studiengaengeAbsolventen + "</ul><br>";
		    }

		    studiengaengeAbsolventen = studiengaengeAbsolventen + "</ul>";

		    document.getElementById("anzahlAbsolventen").innerHTML = "<b>Anzahl der Absolventen: </b>" + anzahlAbsolventen;
			document.getElementById("anzahlStudiengaenge").innerHTML = "<b>Anzahl der Studiengänge: </b>" + berufeAbsolventen.length;
			document.getElementById("studiengaengeAbsolventen").innerHTML = studiengaengeAbsolventen;
		    
		    google.load("visualization", "1", {packages:["corechart"]});
			google.setOnLoadCallback(drawChart);
	
	
		     /* function drawChart() {
		        //var data = google.visualization.arrayToDataTable([
		        var data = google.visualization.arrayToDataTable(forData);
		         // ['Berufe', 'Absolventen'],
		         // ['BWL',     3],
		          ///['Informatik',      2],
		          //['Maschinenbau',  1],
		        //]);
	
		        var options = {
		          title: 'Statistik der Berufe:',
		          is3D: true,
		        };
	
		        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		        chart.draw(data, options);
		     }*/

		//document.getElementById("anzahlAbsolventen").innerHTML = "<b>Anzahl der Absolventen: </b>" + anzahlAbsolventen;
		//document.getElementById("anzahlStudiengaenge").innerHTML = "<b>Anzahl der Studiengänge: </b>" + berufeAbsolventen.length;
	}
   
    </script>
    
</head>

<body>

<table style="width:100%">
  <tr>
    <td>
	    <b>Name der Bildungseinrichtung:</b> XYZ<br><br>
		<b>Typ der Bildungseinrichtung:</b> XYz<br><br>
		<b>Adresse:</b><br>
		Goethe-Uni<br>
		1234 Karlruhe<br>
		Carlsonstrasse 12<br><br>
		
		<div id="anzahlAbsolventen"></div><br>
		<div id="anzahlStudiengaenge"></div><br>
	
		<b>Studiengänge mit Absolventen:</b>
		<div id="studiengaengeAbsolventen"></div>

    </td>
    <td>
		<div id="piechart_3d" style="width: 900px; height: 500px;"></div>	
	</td> 
  </tr>
</table>
</body>
</html>


