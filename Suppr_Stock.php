<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Stock Suppression</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <h1>Suppression Stock</h1>
  <?php
  //récupération des données transférées via la méthode GET : Id_product, idTaille (clés primaires)
  $prod_id = $_GET["ID_Prod"];
  $taille_id = $_GET["idTaille"];
  //affichage des informations récupérées
  echo "Produit n° " .$prod_id;
  echo ", ";
  echo "Taille n° " .$taille_id;
  echo "<br/><br/>";

  //traitement pour suppression du stock, ligne complète : id_produit, id_taille et qté en stock

  //connexion à la base de données PHP_Form_Client
  require('connectFC.php');

  $ok="";
  //test pour existence du stock
  $sql = 'select product_id, size_id, stock from stock where product_id='.$prod_id.' AND size_id='.$taille_id.';';
  //echo "<br>";var_dump($sql);echo "<br>";
  $req = mysqli_query($conn, $sql);
  $result = mysqli_fetch_row($req);
  //var_dump($result);var_dump($result);

  if (is_null($result)) {

    echo "<br>";
    $ok="Le stock du produit N° ".$prod_id." avec la pointure ".$taille_id." n'existe pas ...<BR/>Veuillez vérifier les données.";
    echo $ok;
  }
  else {

    $ok="Le stock du produit N° ".$prod_id." avec la pointure ".$taille_id." peut être supprimé.";
    echo $ok;

    //suppression données réelles de la table stocks
    $sql = "DELETE FROM stock WHERE product_id=".$prod_id." AND size_id=".$taille_id.";";


    $req = mysqli_query($conn, $sql);

    if ($req) {
      $ok="<br/>Bravo ! Le stock du produit N° ".$prod_id." avec la pointure ".$taille_id." a été supprimé";
    }
    else {
      $ok="Attention ! quelque chose s'est mal passé...";
    }
    echo ($ok);
    echo "<br/><br/>";

  }

  //affichage données réelles de la table stock
  $sql = 'select p.id as ID_Prod, p.name as Produit, si.id as idTaille, si.name as Taille, st.stock as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where p.id='.$prod_id.' order by Produit, Taille;';
  $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

  if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
      echo "<table width=\"80%\">";
      echo "<thead>";
      echo "<tr>";
      echo "<th width=\"5%\"># Prod</th>";
      echo "<th width=\"40%\">Produit</th>";
      echo "<th width=\"5%\">idTaille</th>";
      echo "<th width=\"15%\">Taille</th>";
      echo "<th width=\"5%\">Qté</th>";
      echo "</tr>";
      echo "</thead>";
      echo "<tbody>";
      while($row = mysqli_fetch_array($result)){
        echo "<tr>";
        echo "<td width=\"5%\">" . $row['ID_Prod'] . "</td>";
        echo "<td width=\"40%\">" . $row['Produit'] . "</td>";
        echo "<td width=\"5%\">" . $row['idTaille'] . "</td>";
        echo "<td width=\"15%\">" . $row['Taille'] . "</td>";
        echo "<td width=\"5%\">" . $row['Qt_Stock'] . "</td>";
        echo "</tr>";
      }
      echo "</tbody>";

      echo "</table>";
      // Free result set
      mysqli_free_result($result);
    } else{
      echo "<p><em>Aucun enregistrement trouvé.</em></p>";
    }
  } else{
    echo "ERREUR: Ne peut pas exécuter $sql. " . mysqli_error($link);
  }

  // on ferme la connexion à la base
  require_once('disconnect.php');

  $ok = "<br/><br/>Les données du 'Stock' pour le produit n° ".$prod_id." sont à jour.";
  echo '<p>'.$ok.'</p>';
  ?>
  <!-- retour à la page visualisation via le bouton 'récapitulatif stock' : "Form_stock.php") -->
  <br/><a href="Form_stock.php"><input type="button" value="...:: Récapitulatif Stock ::..." /></a><br/><br/>
</body>
</html>
