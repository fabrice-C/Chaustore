<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Brand Suppression</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <h1>Suppression Brand</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $Brand_id = $_GET["ID_Brand"];
  $BrandG = $_GET["name"];
  //affichage des informations récupérées
  echo "Marque n° " .$Brand_id;
  echo ", ";
  echo "'".$BrandG."'";
  echo "<br/><br/>";

  //traitement pour suppression de la marque
  //avec contrôle existence de la marque
  //et vérification existence stock pour cette marque

  //connexion à la base de données
  require('connectFC.php');

  $ok="";

  //test si exitence de stock pour cette marque
  $sql = 'select b.name as Marque, sum(st.stock) as Qt_Stock from product as p inner join brand as b on brand_id = b.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where b.id='.$Brand_id.' group by Marque order by Marque;';
  //echo "<br>";var_dump($sql);echo "<br>";

  if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_array($result)){
        $ok="<br/>La marque ne peut pas être supprimée : <BR/>il y a ". $row['Qt_Stock'] ." articles en stock pour cette marque !<br/><br/>Aucune suppression possible !<br/>";
      }

      echo $ok;

    // Free result set
    mysqli_free_result($result);

    }
    else{
      echo "<p><em>Pas de stock pour cette marque.</em></p>";

      //test pour existence de la marque
      $sql = 'select id, name from brand where id='.$Brand_id.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);var_dump($result);

      if (is_null($result)) {

        echo "<br/>";
        $ok="La marque à supprimer '".$BrandG."' n'existe pas ...<BR/>Veuillez vérifier les données.";
        echo $ok;
      }
      else {
          //TTT suppression de la marque
          $ok="<br/>La marque '".$BrandG."' peut être supprimée.<br/><br/>";
          echo $ok;

          //suppression données réelles de la table
          $sql = "DELETE FROM brand WHERE id=".$Brand_id.";";
          //var_dump($sql);
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="La marque '".$BrandG."' a été supprimée.<br/>";
          }
          else {
            $ok="Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);
          echo "<br/>";
          $ok = "Les données 'brand' sont à jour.";
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
  <br/><a href="Form_brand.php"><input type="button" value="...:: Récapitulatif Marque ::..." /></a><br/><br/>
</body>
</html>
