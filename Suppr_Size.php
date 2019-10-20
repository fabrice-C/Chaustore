<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Size Suppression</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
  <h1>Suppression Pointure</h1>
  <?php
  //récupération des données transférées via la méthode GET
  $Size_id = $_GET["ID_Size"];
  $SizeG = $_GET["name"];
  //affichage des informations récupérées
  echo "Pointure n° " .$Size_id;
  echo ",<BR/> ";
  echo "Taille : " .$SizeG;
  echo "<br/><br/>";

  //traitement pour suppression de la Size
  //avec contrôle existence de la Size
  //et vérification existence stock pour cette Size

  //connexion à la base de données
  require('connectFC.php');

  $ok="";

  //test si exitence de stock pour cette pointure
  $sql = 'select si.name as Taille, sum(st.stock) as Qt_Stock from stock as st inner join size as si on st.size_id = si.id where si.id='.$Size_id.' group by Taille order by Taille;';
  //echo "<br>";var_dump($sql);echo "<br>";

  if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_array($result)){
        $ok="<br/>La pointure ne peut pas être supprimée : <BR/>il y a ". $row['Qt_Stock'] ." articles en stock dans cette taille !<br/><br/>Aucune suppression possible !<br/>";
      }

      echo $ok;

    // Free result set
    mysqli_free_result($result);

    }
    else{
      echo "<p><em>Pas de stock pour cette taille.</em></p>";

      //test pour existence de la pointure
      $sql = 'select id, name from size where id='.$Size_id.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);var_dump($result);

      if (is_null($result)) {

        echo "<br/>";
        $ok="La pointure à supprimer '".$SizeG."' n'existe pas ...<BR/>Veuillez vérifier les données.<BR/><BR/>";
        echo $ok;
      }
      else {
        //TTT suppression de la pointure
          $ok="<br/>La pointure '".$SizeG."' peut être supprimée.<br/><br/>";
          echo $ok;

          //suppression données réelles de la table
          $sql = "DELETE FROM size WHERE id=".$Size_id.";";
          //var_dump($sql);
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="La pointure '".$SizeG."' a été supprimée.<br/>";
          }
          else {
            $ok="Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);
          echo "<br/>";
          $ok = "Les données 'Size' sont à jour.";
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
  <br/><a href="Form_size.php"><input type="button" value="...:: Récapitulatif Pointure ::..." /></a><br/><br/>
</body>
</html>
