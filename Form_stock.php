<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Stock</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Stock</h1>
  <nav>
    <ul>
      <li><a href="#1" title="Visualisation_Stock"><i class="material-icons">tv</i> Visualisation</a></li>
      <li><a href="Creation_Stock.php" title="Creation_Stock"><i class="material-icons">add_circle_outline</i> Création</a></li>
    </ul>
  </nav>

  <!-- Visualisation -->
  <div class="conteneur">
    <h2 id="1" class="resultats">Visualisation Stock</h2>

    <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a> Récapitulatif des stocks <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>
    <br/><input type="button" onclick='window.location.reload(false)' value="..: Réactualiser le tableau :.."/>
    <br/><br/><br/>
    <table width="76%">
      <thead>
        <tr>
          <th width="5%"># Prod</th>
          <th width="40%">Produit</th>
          <th width="5%">idTaille</th>
          <th width="15%">Taille</th>
          <th width="5%">Qté</th>
          <th width="5%">MAJ</th>
          <th width="5%">Suppr</th>
        </tr>
      </thead>
    </table>

    <div class="overflowTest">
      <table class="t01" width="80%">

      <?php

      $ok = "";
      //connexion à la base de données PHP_Form_Client
      require_once('connectFC.php');

      //$ok="Voici le détail des stocks (Stock) :<BR/>";
      //echo $ok;
      //echo "<br>";

      //affichage données réelles de la table stock
      $sql = 'select p.id as ID_Prod, p.name as Produit, si.id as idTaille, si.name as Taille, st.stock as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id order by Produit, Taille;';
      //$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

      if($result = mysqli_query($conn, $sql)){
        if(mysqli_num_rows($result) > 0){

            echo "<tbody>";
            while($row = mysqli_fetch_array($result)){
              echo "<tr>";
              echo "<td width=\"5%\">" . $row['ID_Prod'] . "</td>";
              echo "<td width=\"40%\">" . $row['Produit'] . "</td>";
              echo "<td width=\"5%\">" . $row['idTaille'] . "</td>";
              echo "<td width=\"15%\">" . $row['Taille'] . "</td>";
              echo "<td width=\"5%\">" . $row['Qt_Stock'] . "</td>";
              echo "<td width=\"5%\"><a href=\"Modification_Stock.php?ID_Prod=" . $row['ID_Prod'] . "&idTaille=" . $row['idTaille'] . "&Qt_Stock=" . $row['Qt_Stock'] . "\"><i class=\"material-icons\">create</i></a></td>";
              echo "<td width=\"5%\"><a href=\"Suppr_Stock.php?ID_Prod=" . $row['ID_Prod'] . "&idTaille=" . $row['idTaille'] . "\"><i class=\"material-icons\">delete_outline</i></a></td>";
              echo "</tr>";
            }
            echo "</tbody>";

          echo "</table>";
          // Free result set
          mysqli_free_result($result);
        } else{
          echo "<p class='lead'><em>No records were found.</em></p>";
        }
      } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<BR/>Félicitations ! <BR/>Les données 'Stock' sont à jour.";
      echo '<p>'.$ok.'</p>';
      //header("refresh: 10;url=Form_stock.php");
      ?>
    </div>
  </div>

</body>
</html>
