<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Color Modification</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Modification Color</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $color_id = $_GET["ID_Color"];
  $colorG = $_GET["name"];
  //affichage des informations récupérées
  echo "Couleur n° " .$color_id;
  echo ",<BR/> ";
  echo "Nom de la couleur : " .$colorG;
  echo "<br/><br/>";

  //traitement pour modification du stock

  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (empty($_POST['ColorNew'])) {
      $error .= "la nouvelle couleur est obligatoire.<br/>";
      }

    if (empty($error)) {
    // si pas d'erreur pour les variables,
    //traitement de la mise à jour (modification) de la table

      //connexion à la base de données
      require('connectFC.php');

      //Mise à jour données réelles de la table
      $couleurNew=$_POST['ColorNew'];
      //echo "<br>";var_dump($couleurNew);
      $ok="";
      //test pour existence du stock
      $sql = 'select name from color where name="'.$colorG.'";';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);

      if (is_null($result)) {
        echo "<br>";
        $ok="La couleur à modifier ".$colorG." n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
        //Mise à jour données réelles de la table
        $sql = "UPDATE `color` SET name= '".$couleurNew."' WHERE id=".$color_id.";";
        //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="Vos modifications ont été envoyées :<BR/>La couleur n° ".$color_id." à modifier a été mise à jour. Le nouveau nom est : ".$couleurNew;
        }
        else {
          $ok="Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
        echo "<br/>";

      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<br/>Les données de 'Color' pour la couleur n° ".$color_id." sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>
    <form method="POST">
      <label>
        Nouveau nom de couleur
        <input type="text" name="ColorNew" placeholder="Nouveau nom de la couleur " value="<?php if (!empty($_POST['ColorNew'])) { echo $_POST['ColorNew']; } ?>">
      </label><input type="submit" value="...:: Valider ::...">
    </form>
  <?php } ?>
  <br/><a href="Form_color.php"><input type="button" value="...:: Récapitulatif Couleur ::..." /></a><br/><br/>
</body>
</html>
