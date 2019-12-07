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
        <title>${userName}</title>
    </head>
    <body>
        
        <sql:setDataSource
            var="myDS"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/comptoirs"
            user="APP" password="app"
        />
     
        <sql:query var="commande"   dataSource="${myDS}">
            SELECT * FROM COMMANDE
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
                    <th>Numéro de Commande</th>

                    <th>Client</th>
                    <th>Date de saisie</th>
                    <th>Date d'envoi</th>
                    <th>Port</th>
                    <th>Destinataire</th>
                    <th>Adresse de livraison</th>
                    <th>Ville de livraison</th>
                    <th>Région de livraison</th>
                    <th>Code Postal</th>
                    <th>Pays</th>
                    <th>Remise</th>



                    <c:forEach var="record" items="${commande.rows}">
                    <tr>
                        <td>${record.NUMERO}</td>
                        <td>${record.CLIENT}</td>
                        <td>${record.SAISIE_LE}</td>
                        <td>${record.ENVOYEE_LE}</td>
                        <td>${record.PORT}</td>
                        <td>${record.DESTINATAIRE}</td>
                        <td>${record.ADRESSE_LIVRAISON}</td>
                        <td>${record.VILLE_LIVRAISON}</td>
                        <td>${record.REGION_LIVRAISON}</td>
                        <td>${record.CODE_POSTAL_LIVRAIS}</td>
                        <td>${record.PAYS_LIVRAISON}</td>
                         <td>${record.REMISE}</td>
                    </tr>
                    </c:forEach>
                </tr>
            </table>
        </div>
        
	</form>
    </body>