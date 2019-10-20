<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Brand Modification</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Modification Brand</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $Brand_id = $_GET["ID_Brand"];
  $BrandG = $_GET["name"];
  //affichage des informations récupérées
  echo "Marque n° " .$Brand_id;
  echo ",<BR/> ";
  echo "Nom : " .$BrandG;
  echo "<br/><br/>";

  //traitement pour modification du stock

  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (empty($_POST['BrandNew'])) {
      $error .= "la nouvelle marque est obligatoire.<br/>";
      }

    if (empty($error)) {
    // si pas d'erreur pour les variables,
    //traitement de la mise à jour (modification) de la table

      //connexion à la base de données
      require('connectFC.php');

      //Mise à jour données réelles de la table stock
      $BrandNew=$_POST['BrandNew'];
    //echo "<br>";var_dump($BrandNew);
      $ok="";
      //test pour existence du stock
      $sql = 'select name from brand where name="'.$BrandG.'";';
    //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
    //var_dump($result);

      if (is_null($result)) {
        echo "<br>";
        $ok="La marque à modifier ".$BrandG." n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
        //Mise à jour données réelles de la table
        $sql = "UPDATE `brand` SET name= '".$BrandNew."' WHERE id=".$Brand_id.";";
      //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="Vos modifications ont été envoyées :<BR/>La marque n° ".$Brand_id." à modifier a été mise à jour. Le nouveau nom est : ".$BrandNew;
        }
        else {
          $ok="Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
        echo "<br/>";

      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<br/>Les données de 'Brand' pour la marque n° ".$Brand_id." sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>
    <form method="POST">
      <label>
        Nouvelle marque
        <input type="text" name="BrandNew" placeholder="Nouvelle marque " value="<?php if (!empty($_POST['BrandNew'])) { echo $_POST['BrandNew']; } ?>">
      </label><input type="submit" value="...:: Valider ::...">
    </form>
  <?php } ?>
  <br/><a href="Form_brand.php"><input type="button" value="...:: Récapitulatif Marque ::..." /></a><br/><br/>
</body>
</html>
