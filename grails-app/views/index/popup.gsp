<html>
<head>
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    try{
    	google.load("visualization", "1", {packages:["corechart"]});
      }
    catch(err){
        alert(err.message);
        }
      
      try{
    	  google.setOnLoadCallback(drawChart);
        }
      catch(Exception){
          }

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['BWL',     3],
          ['Informatik',      2],
          ['Maschinenbau',  1],
        ]);

        var options = {
          title: 'Berufe',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
     }
    </script>
    
</head>

<body>

<b>Name der Bildungseinrichtung:</b> XYZ<br><br>
<b>Typ der Bildungseinrichtung:</b> XYz<br><br>
<b>Adresse:</b><br>
Goethe-Uni<br>
1234 Karlruhe<br>
Carlsonstrasse 12<br><br>
<b>Anzahl der Absolventen:</b> 34<br><br>
<b>Studiengänge</b>
<ul>
  <li>BWL</li>
  <li>Informatik</li>
  <li>Maschinenbau</li>
</ul><br>
<b>Absolventen</b>
<ul>
  <li>Stefan Raab</li>
  <li>Thomas Gotschalk</li>
  <li>Günther Jauch</li>
  <li>Markus Lanz</li>
  <li>Dieter Bohlen</li>
  <li>Bühlent Ceylan</li>
</ul>
<br>
 <div id="piechart_3d" style="width: 900px; height: 500px;"></div>

</body>
</html>


