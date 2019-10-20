<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Size Modification</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Modification Size</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $Size_id = $_GET["ID_Size"];
  $SizeG = $_GET["name"];
  //affichage des informations récupérées
  echo "Pointure n° " .$Size_id;
  echo ",<BR/> ";
  echo "Taille : " .$SizeG;
  echo "<br/><br/>";

  //traitement pour modification du stock

  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (empty($_POST['SizeNew'])) {
      $error .= "la nouvelle pointure est obligatoire.<br/>";
      }

    if (empty($error)) {
    // si pas d'erreur pour les variables,
    //traitement de la mise à jour (modification) de la table

      //connexion à la base de données
      require('connectFC.php');

      //Mise à jour données réelles de la table stock
      $SizeNew=$_POST['SizeNew'];
    //echo "<br>";var_dump($SizeNew);
      $ok="";
      //test pour existence du stock
      $sql = 'select name from size where name="'.$SizeG.'";';
    //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
    //var_dump($result);

      if (is_null($result)) {
        echo "<br>";
        $ok="La pointure à modifier ".$SizeG." n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
        //Mise à jour données réelles de la table
        $sql = "UPDATE `size` SET name= '".$SizeNew."' WHERE id=".$Size_id.";";
      //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="Vos modifications ont été envoyées :<BR/>La pointure n° ".$Size_id." à modifier a été mise à jour. Le nouveau nom est : ".$SizeNew;
        }
        else {
          $ok="Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
        echo "<br/>";

      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<br/>Les données de 'Size' pour la pointure n° ".$Size_id." sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>
    <form method="POST">
      <label>
        Nouveau taille (pointure)
        <input type="text" name="SizeNew" placeholder="Nouvelle taille de pointure " value="<?php if (!empty($_POST['SizeNew'])) { echo $_POST['SizeNew']; } ?>">
      </label><input type="submit" value="...:: Valider ::...">
    </form>
  <?php } ?>
  <br/><a href="Form_size.php"><input type="button" value="...:: Récapitulatif Pointure ::..." /></a><br/><br/>
</body>
</html>
