<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:setDataSource 
	driver="org.apache.derby.jdbc.ClientDriver"
	url="jdbc:derby://localhost:1527/comptoirs"
	user="app" password="app"
/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Client.css" />
        <title>Produits</title>
    </head>
    <body>
        
        <sql:setDataSource
            var="myDS"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/comptoirs"
            user="APP" password="app"
        />
     
        <sql:query var="produit"   dataSource="${myDS}">
            SELECT * FROM PRODUIT
        </sql:query>
        
        <div id="menu">
            </br><form action="<c:url value="/" />" method="POST" id="deco">
            <input type='submit' name='action' value='Deconnexion'>
            </form>  
        </div>
            <!--<label for="qnt"> Quantite :</label>
            <input name="quantite" /></br>
            <label for="fdp"> Frais de port :</label>
            <input name="fraisport" /></br>
            <label for="dateA"> Date d'achat</label>
            <input type="date" name="dateAchat" /></br>
            <label for="dateL"> Date de livraison</label>
            <input type="date" name="dateLivraison" /></br>
            
            </br><input type="submit" name="action" value="Commander"/>
            </fieldset>-->
          
                
        
                </br>
        <div align=center">
            <table border="1">
                <tr>
                    <th>Référence</th>
                    <th>Nom</th>
                    <th>Fournisseur</th>
                    <th>Categorie</th>
                    <th>Quantité par unité</th>
                    <th>Prix unitaire</th>
                    <th>Stock</th>
                    <th>Commandées</th>
                    <th>Réappro</th>
                    <th>Indisponible</th>

                    <c:forEach var="record" items="${produit.rows}">
                    <tr>
                        <td>${record.REFERENCE}</td>
                        <td>${record.NOM}</td>
                        <td>${record.FOURNISSEUR}</td>
                        <td>${record.CATEGORIE}</td>
                        <td>${record.QUANTITE_PAR_UNITE}</td>
                        <td>${record.PRIX_UNITAIRE}</td>
                        <td>${record.UNITES_EN_STOCK}</td>
                        <td>${record.UNITES_COMMANDEES}</td>
                        <td>${record.NIVEAU_DE_REAPPRO}</td>
                        <td>${record.INDISPONIBLE}</td>
                    </tr>
                    </c:forEach>
                </tr>
            </table>
        </div>
        
	</form>
    </body>