<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Color Suppression</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <h1>Suppression Color</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $color_id = $_GET["ID_Color"];
  $colorG = $_GET["name"];
  //affichage des informations récupérées
  echo "Couleur n° " .$color_id;
  echo ", ";
  echo "'".$colorG."'";
  echo "<br/><br/>";

  //traitement pour suppression de la couleur
  //avec contrôle existence de la couleur
  //et vérification existence stock pour cette couleur

  //connexion à la base de données
  require('connectFC.php');

  $ok="";

  //test si exitence de stock pour cette couleur
  $sql = 'select b.name as Couleur, sum(st.stock) as Qt_Stock from product as p inner join color as b on color_id = b.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where b.id='.$color_id.' group by Couleur order by Couleur;';
  //echo "<br>";var_dump($sql);echo "<br>";

  if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_array($result)){
        $ok="<br/>La couleur ne peut pas être supprimée : <BR/>il y a ". $row['Qt_Stock'] ." articles en stock pour cette couleur !<br/><br/>Aucune suppression possible !<br/>";
      }

      echo $ok;

    // Free result set
    mysqli_free_result($result);

    }
    else{
      echo "<p><em>Pas de stock pour cette couleur.</em></p>";

      //test pour existence de la couleur
      $sql = 'select id, name from color where id='.$color_id.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);var_dump($result);

      if (is_null($result)) {

        echo "<br/>";
        $ok="La couleur à supprimer '".$colorG."' n'existe pas ...<BR/>Veuillez vérifier les données.<BR/>";
        echo $ok;
      }
      else {
          //TTT suppression de la couleur
          $ok="<br/>La couleur '".$colorG."' peut être supprimée.<br/><br/>";
          echo $ok;

          //suppression données réelles de la table
          $sql = "DELETE FROM color WHERE id=".$color_id.";";
          //var_dump($sql);
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="La couleur '".$colorG."' a été supprimée.<br/>";
          }
          else {
            $ok="Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);
          echo "<br/>";
          $ok = "Les données 'color' sont à jour.";
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
  <br/><a href="Form_color.php"><input type="button" value="...:: Récapitulatif couleur ::..." /></a><br/><br/>
</body>
</html>
