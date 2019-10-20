<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Category Suppression</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <h1>Suppression Category</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $category_id = $_GET["ID_Category"];
  $categoryG = $_GET["name"];
  //affichage des informations récupérées
  echo "Catégorie n° " .$category_id;
  echo ", ";
  echo "'".$categoryG."'";
  echo "<br/><br/>";

  //traitement pour suppression de la Categorie
  //avec contrôle existence de la Categories
  //et vérification existence stock pour cette Categorie

  //connexion à la base de données
  require('connectFC.php');

  $ok="";

  //test si exitence de stock pour cette Categorie
  $sql = 'select b.name as Categorie, sum(st.stock) as Qt_Stock from product as p inner join category as b on category_id = b.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where b.id='.$category_id.' group by Categorie order by Categorie;';
  //echo "<br>";var_dump($sql);echo "<br>";

  if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_array($result)){
        $ok="<br/>La catégorie ne peut pas être supprimée : <BR/>il y a ". $row['Qt_Stock'] ." articles en stock pour cette catégorie !<br/><br/>Aucune suppression possible !<br/>";
      }

      echo $ok;

    // Free result set
    mysqli_free_result($result);

    }
    else{
      echo "<p><em>Pas de stock pour cette catégorie.</em></p>";

      //test pour existence de la Categorie
      $sql = 'select id, name from category where id='.$category_id.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);var_dump($result);

      if (is_null($result)) {

        echo "<br/>";
        $ok="La catégorie à supprimer '".$categoryG."' n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
          //TTT suppression de la Categorie
          $ok="<br/>La catégorie '".$categoryG."' peut être supprimée.<br/><br/>";
          echo $ok;

          //suppression données réelles de la table
          $sql = "DELETE FROM category WHERE id=".$category_id.";";
          //var_dump($sql);
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="La catégorie '".$categoryG."' a été supprimée.<br/>";
          }
          else {
            $ok="Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);
          echo "<br/>";
          $ok = "Les données 'Category' sont à jour.";
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
  <br/><a href="Form_category.php"><input type="button" value="...:: Récapitulatif Category ::..." /></a><br/><br/>
</body>
</html>
