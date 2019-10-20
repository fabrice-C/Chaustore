<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Product Suppression</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <h1>Suppression Product</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $Product_id = $_GET["ID_Prod"];
  $ProductG = $_GET["Produit"];
  //affichage des informations récupérées
  echo "Produit n° " .$Product_id;
  echo ", ";
  echo "'".$ProductG."'";
  echo "<br/><br/>";

  //traitement pour suppression de la produit
  //avec contrôle existence de la produit
  //et vérification existence stock pour cette produit

  //connexion à la base de données
  require('connectFC.php');

  $ok="";

  //test si exitence de stock pour cette produit
  $sql = 'select p.name as Produit, sum(st.stock) as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where p.id='.$Product_id.' group by Produit order by Produit;';
  //echo "<br>";var_dump($sql);echo "<br>";

  if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_array($result)){
        $ok="<br/>Le produit ne peut pas être supprimée : <BR/>il y a ". $row['Qt_Stock'] ." articles en stock pour ce produit !<br/><br/>Aucune suppression possible !<br/>";
      }

      echo $ok;

    // Free result set
    mysqli_free_result($result);

    }
    else{
      echo "<p><em>Pas de stock pour ce produit.</em></p>";

      //test pour existence du produit
      $sql = 'select id, name from product where id='.$Product_id.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);var_dump($result);

      if (is_null($result)) {

        echo "<br/>";
        $ok="Le produit à supprimer '".$ProductG."' n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
        //TTT suppression du produit
          $ok="<br/>Le produit '".$ProductG."' peut être supprimé.<br/><br/>";
          echo $ok;

          //suppression données réelles de la table
          $sql = "DELETE FROM product WHERE id=".$Product_id.";";
          //var_dump($sql);
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="Le produit '".$ProductG."' a été supprimé.<br/>";
          }
          else {
            $ok="Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);
          echo "<br/>";
          $ok = "Les données 'product' sont à jour.";
          echo '<p>'.$ok.'</p>';
      }
    }
  } else{
    echo "<br/>ERREUR: Ne peut pas exécuter $sql. " . mysqli_error($conn);
  }

  // on ferme la connexion à la base
  require_once('disconnect.php');

  ?>
  <!-- retour à la page visualisation via le bouton 'récapitulatif stock' : "Form_stock.php") -->
  <br/><a href="Form_Product.php"><input type="button" value="...:: Récapitulatif Produit ::..." /></a><br/><br/>
</body>
</html>
