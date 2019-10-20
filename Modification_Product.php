<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Product Modification</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Modification Product</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $Product_id = $_GET["ID_Prod"];
  $ProductG = $_GET["Produit"];
  //affichage des informations récupérées
  echo "Produit n° " .$Product_id;
  echo ",<BR/> ";
  echo "Nom du produit : " .$ProductG;
  echo "<br/><br/>";

  //traitement pour modification du stock

  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (empty($_POST['ProductNew'])) {
      $error .= "le nouveau produit est obligatoire.<br/>";
      }

    if (empty($error)) {
    // si pas d'erreur pour les variables,
    //traitement de la mise à jour (modification) de la table

      //connexion à la base de données
      require('connectFC.php');

      //Mise à jour données réelles de la table 
      $ProductNew=$_POST['ProductNew'];
    //echo "<br>";var_dump($ProductNew);
      $ok="";
      //test pour existence
      $sql = 'select name from product where name="'.$ProductG.'";';
    //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
    //var_dump($result);

      if (is_null($result)) {
        echo "<br>";
        $ok="le produit à modifier ".$ProductG." n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
        //Mise à jour données réelles de la table
        $sql = "UPDATE `product` SET name= '".$ProductNew."' WHERE id=".$Product_id.";";
      //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="Vos modifications ont été envoyées :<BR/>le produit n° ".$Product_id." à modifier a été mise à jour. Le nouveau nom est : ".$ProductNew;
        }
        else {
          $ok="Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
        echo "<br/>";

      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<br/>Les données de 'Product' pour le produit n° ".$Product_id." sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>
    <form method="POST">
      <label>
        Nouveau produit
        <input type="text" name="ProductNew" placeholder="Nouveau produit " value="<?php if (!empty($_POST['ProductNew'])) { echo $_POST['ProductNew']; } ?>">
      </label><input type="submit" value="...:: Valider ::...">
    </form>
  <?php } ?>
  <br/><a href="Form_Product.php"><input type="button" value="...:: Récapitulatif Produit ::..." /></a><br/><br/>
</body>
</html>
