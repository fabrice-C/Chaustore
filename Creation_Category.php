<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>Chaustore - Back-office - Category Creation</title>

  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Création Category</h1>
  <?php
  $error = "";
  $ok = "";
  if (!empty($_POST)) {

    if (empty($_POST['Categorie'])) {
      $error .= "le nom de la catégorie est obligatoire.<br/>";
    }

    if (empty($error)) {
      //connexion à la base de données
      require('connectFC.php');

      //ajout données réelles de la table Category
      $CategorieC=$_POST['Categorie'];

      $ok="";
      //test pour existence de la Category
      $sql = 'select name from category where name="'.$CategorieC.'";';
      //echo "<br>";var_dump($sql);echo "<br>";

      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);//var_dump($result);

      if (is_null($result)) {
        //echo "<br>";
        $ok="La catégorie '".$CategorieC."' peut être créée ...<BR/>";
        echo $ok;
        //ajout données réelles de la table
        $sql = 'INSERT INTO `category` set name= "'.$CategorieC.'";';
        //echo "<br>";var_dump($sql);echo "<br>";

        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="<BR/>Vos informations de création ont été envoyées : <br/><br/>La catégorie '".$CategorieC."' a été ajoutée.<BR/>";
        }
        else {
          $ok="<BR/>Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
      }
      else {

        echo "<br>";
        $ok="La catégorie '".$CategorieC."' est déjà créée ! <BR/>";
        echo $ok;

      }

      // on ferme la connexion à la base
      require('disconnect.php');

      $ok = "<BR/>Les données 'Category' sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>

    <div class="form">
      <form method="POST">
        <label>
          Nom Categorie
          <input type="text" name="Categorie" value="<?php if (!empty($_POST['Categorie'])) { echo $_POST['Categorie']; } ?>">
        </label>
        <BR/><BR/>
        <input type="submit" value=". . . : : : V a l i d e r : : : . . .">
      </form>
    </div>
  <?php } ?>
  <p><BR/><BR/><a href="Form_category.php"><input type="button" value="...:: Récapitulatif Categorie ::..." /></a></p>

</body>
</html>
