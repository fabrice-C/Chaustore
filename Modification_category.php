<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Category Modification</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Modification Category</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $category_id = $_GET["ID_Category"];
  $categoryG = $_GET["name"];
  //affichage des informations récupérées
  echo "Catégorie n° " .$category_id;
  echo ",<BR/> ";
  echo "Nom de la catégorie : " .$categoryG;
  echo "<br/><br/>";

  //traitement pour modification du stock

  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (empty($_POST['CategoryNew'])) {
      $error .= "la nouvelle catégorie est obligatoire.<br/>";
      }

    if (empty($error)) {
    // si pas d'erreur pour les variables,
    //traitement de la mise à jour (modification) de la table

      //connexion à la base de données
      require('connectFC.php');

      //Mise à jour données réelles de la table stock
      $CategoryNew=$_POST['CategoryNew'];
      //echo "<br>";var_dump($CategoryNew);
      $ok="";
      //test pour existence du stock
      $sql = 'select name from category where name="'.$categoryG.'";';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);

      if (is_null($result)) {
        echo "<br>";
        $ok="La catégorie à modifier ".$categoryG." n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
        //Mise à jour données réelles de la table
        $sql = "UPDATE `category` SET name= '".$CategoryNew."' WHERE id=".$category_id.";";
        //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="Vos modifications ont été envoyées :<BR/>La catégorie n° ".$category_id." à modifier a été mise à jour. Le nouveau nom est : ".$CategoryNew;
        }
        else {
          $ok="Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
        echo "<br/>";

      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<br/>Les données de 'Category' pour la catégorie n° ".$category_id." sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>
    <form method="POST">
      <label>
        Nouveau nom de catégorie
        <input type="text" name="CategoryNew" placeholder="Nouveau nom de la catégorie " value="<?php if (!empty($_POST['CategoryNew'])) { echo $_POST['CategoryNew']; } ?>">
      </label><input type="submit" value="...:: Valider ::...">
    </form>
  <?php } ?>
  <br/><a href="Form_category.php"><input type="button" value="...:: Récapitulatif catégorie ::..." /></a><br/><br/>
</body>
</html>
