

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Graphiques des ventes</title>
        <link rel="stylesheet" href="Client.css" />
        <link rel="icon" type="image/png" href="Pictures/favicon_admin.ico" />
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/dd6a857052.js" crossorigin="anonymous"></script>
        <script>
            $( document ).ready(function() {
                console.log( "ready!" );
                $("#ddmenu").load("Menu.html");
            });
        </script>
	<script type="text/javascript">
		google.load("visualization", "1", {packages: ["corechart"]});

		// Après le chargement de la page, on fait l'appel AJAX
		google.setOnLoadCallback(doAjax);
		google.setOnLoadCallback(doAjax2);
                google.setOnLoadCallback(doAjax3);
                
		function drawChart(dataArray) {
			var data = google.visualization.arrayToDataTable(dataArray);
			var options = {
				title: 'Ventes par catégorie',
				is3D: true,
                                width:400,
                                height:400
			};
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(data, options);
		}

		// Afficher les ventes par client
		function doAjax() {
			$.ajax({
				url: "ServletGraphiques",
				dataType: "json",
				success: // La fonction qui traite les résultats
					function (result) {
						// On reformate le résultat comme un tableau
						var chartData = [];
						// On met le descriptif des données
						chartData.push(["Catégories", "Ventes"]);
						for(var client in result.records) {
							chartData.push([client, result.records[client]]);
						}
						// On dessine le graphique
						drawChart(chartData);
					},
				error: showError
			});
		}
                //SECOND GRAPHE
                function drawChart2(dataArray) {
			var data = google.visualization.arrayToDataTable(dataArray);
			var options = {
				title: 'Ventes par localisation',
				is3D: true,
                                width:400,
                                height:400
			};
			var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
			chart2.draw(data, options);
		}

		// Afficher les ventes par client
		function doAjax2() {
			$.ajax({
				url: "ServletGraphiqueLocalisation",
				dataType: "json",
				success: // La fonction qui traite les résultats
					function (result) {
						// On reformate le résultat comme un tableau
						var chartData2 = [];
						// On met le descriptif des données
						chartData2.push(["Localisation", "Ventes"]);
						for(var client in result.records) {
							chartData2.push([client,result.records[client]]);
						}
						// On dessine le graphique
						drawChart2(chartData2);
					},
				error: showError
			});
		}
                
                //TROISIEME GRAPHE
                function drawChart3(dataArray) {
			var data = google.visualization.arrayToDataTable(dataArray);
			var options = {
				title: 'Ventes par nom',
				is3D: true,
                                width:400,
                                height:400
			};
                        var chart3 = new google.visualization.PieChart(document.getElementById('piechart3'));
                        chart3.draw(data, options);
		}

		// Afficher les ventes par client
		function doAjax3() {
			$.ajax({
				url: "ServletGraphiqueNom",
				dataType: "json",
				success: // La fonction qui traite les résultats
					function (result) {
						// On reformate le résultat comme un tableau
						var chartData = [];
						// On met le descriptif des données
						chartData.push(["Nom", "Ventes"]);
						for(var client in result.records) {
							chartData.push([client,result.records[client]]);
						}
						// On dessine le graphique
						drawChart3(chartData);
					},
				error: showError
			});
		}
		
		// Fonction qui traite les erreurs de la requête
		function showError(xhr, status, message) {
			alert("Erreur: " + status + " : " + message);
		}
		    
	</script>
    </head>
    <body>
        <div class="topnav" id="ddmenu">
        </div> 
        <h1> Bienvenue ${userAdmin} </h1>
        <form action="ServletGraphiques" method="POST">   
        Date Début : <input type="date" name="dateDebut"></br>
        Date fin : <input type="date" name="datefin"></br>
        </form>
	<!-- Le graphique apparaît ici -->
	<div id="piechart" style="width: 400px; height: 400px; display: inline-block;"></div>
        <div id="piechart2" style="width: 400px; height: 400px; display: inline-block;"></div>
        <div id="piechart3" style="width: 400px; height: 400px; display: inline-block;"></div>
        
        </br><form action="<c:url value="/" />" methode="POST" id="deco">
            <input type='submit' name='action' value='deconnexion'>
	</form>
    </body>
</html>
