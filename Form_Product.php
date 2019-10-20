<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Product</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Product</h1>
  <nav>
    <ul>
      <li><a href="#1" title="Visualisation_Product"><i class="material-icons">tv</i> Visualisation</a></li>
      <li><a href="Creation_Product.php" title="Creation_Product"><i class="material-icons">add_circle_outline</i> Création</a></li>
    </ul>
  </nav>

  <!-- Visualisation -->
  <div class="conteneur">
    <h2 id="1" class="resultats">Visualisation Product</h2>

    <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a> Récapitulatif des produits <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>
    <br/><input type="button" onclick='window.location.reload(false)' value="..: Réactualiser le tableau :.."/>
    <br/><br/><br/>
    <table width="76%">
      <thead>
        <tr>
          <th width="5%"># Produit</th>
          <th width="25%">Nom Produit</th>
          <th width="20%">Marque</th>
          <th width="20%">Catégorie</th>
          <th width="10%">Couleur</th>
          <th width="5%">Prix</th>
          <th width="5%">H / F</th>
          <th width="5%">MAJ</th>
          <th width="5%">Suppr</th>
        </tr>
      </thead>
    </table>

    <div class="overflowTest">
      <table class="t01" width="50%">

      <?php

      $ok = "";
      //connexion à la base de données
      require_once('connectFC.php');

      //affichage données réelles de la table
      $sql = 'select p.id as ID_Prod, p.name as Produit, b.name as Marque, ca.name as Categorie, co.name as Couleur, p.price as Prix, p.gender as Genre from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id order by Produit;';

      if($result = mysqli_query($conn, $sql)){
        if(mysqli_num_rows($result) > 0){

            echo "<tbody>";
            while($row = mysqli_fetch_array($result)){
              echo "<tr>";
              echo "<td width=\"5%\">" . $row['ID_Prod'] . "</td>";
              echo "<td width=\"25%\">" . $row['Produit'] . "</td>";
              echo "<td width=\"20%\">" . $row['Marque'] . "</td>";
              echo "<td width=\"20%\">" . $row['Categorie'] . "</td>";
              echo "<td width=\"10%\">" . $row['Couleur'] . "</td>";
              echo "<td width=\"5%\">" . $row['Prix'] . "</td>";
              echo "<td width=\"5%\">" . $row['Genre'] . "</td>";
              echo "<td width=\"5%\"><a href=\"Modification_Product.php?ID_Prod=" . $row['ID_Prod']. "&Produit=" . $row['Produit'] . "\"><i class=\"material-icons\">create</i></a></td>";
              echo "<td width=\"5%\"><a href=\"Suppr_Product.php?ID_Prod=" . $row['ID_Prod']. "&Produit=" . $row['Produit'] . "\"><i class=\"material-icons\">delete_outline</i></a></td>";
              echo "</tr>";
            }
            echo "</tbody>";

          echo "</table>";
          // Free result set
          mysqli_free_result($result);
        } else{
          echo "<p class='lead'><em>Aucun enregistrement trouvé.</em></p>";
        }
      } else{
        echo "ERREUR: Ne peut pas exécuter $sql. " . mysqli_error($conn);
      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<BR/>Les données 'Product' sont à jour.";
      echo '<p>'.$ok.'</p>';

      ?>
    </div>
  </div>

</body>
</html>
