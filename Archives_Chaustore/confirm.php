<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Stock</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Modification Stock</h1>
  <?php
  //récupération des données transférées via la méthode GET : Id_product, idTaille et ancienne qté en stock à modifier
  $prod_id = $_GET["ID_Prod"];
  $taille_id = $_GET["idTaille"];
  $stock_q = $_GET["Qt_Stock"];
  //affichage des informations récupérées
  echo "Produit n° " .$prod_id;
  echo "<br/>";
  echo "Taille n° " .$taille_id;
  echo "<br/>";
  echo "Ancienne quantité : " .$stock_q;
  echo "<br/><br/>";

  //traitement pour modification du stock

  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (is_null($stock_q)) {
      $error .= "la quantité en stock à modifier est obligatoire.<br/>";
    }
    if (is_null($_POST['StockNew'])) {
      $error .= "la nouvelle quantité en stock est obligatoire.<br/>";
    }

    // si pas d'erreur pour les variables,
    //traitement de la mise à jour (modification) de la table
    if (empty($error)) {
      //connexion à la base de données PHP_Form_Client
      require('connectFC.php');

      //Mise à jour données réelles de la table stock
      $stock=$stock_q;
      $stockNew=$_POST['StockNew'];
      //var_dump($stock);echo "<br>";var_dump($stockNew);
      $ok="";
      //test pour existence du stock
      $sql = 'select stock from stock where product_id='.$prod_id.' AND size_id='.$taille_id.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);//var_dump($result);

      if (is_null($result)) {
        $countResult=0;
        echo "<br>";
        $ok="Le stock du produit N° ".$prod_id." à modifier avec la pointure ".$taille_id." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
        echo $ok;
      }
      else {
        $countResult=1;
        //Mise à jour données réelles de la table client
        //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
        $sql = "UPDATE `stock` SET stock= ".$stockNew." WHERE product_id=".$prod_id." AND size_id=".$taille_id.";";
        //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="Bravo ! vos informations ont été envoyées. <br/><br/>Le stock du produit N° ".$prod_id." à modifier avec la pointure ".$taille_id." a été mise à jour. La nouvelle quantité est égale à : ".$stockNew;
        }
        else {
          $ok="Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
        echo "<br/><br/>";

      }

      //affichage données réelles de la table stock
      //affichage données réelles de la table stock
      $sql = 'select p.id as ID_Prod, p.name as Produit, si.id as idTaille, si.name as Taille, st.stock as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where p.id='.$prod_id.' order by Produit, Taille;';
      //$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

      if($result = mysqli_query($conn, $sql)){
        if(mysqli_num_rows($result) > 0){
          echo "<table width=\"80%\">";
          echo "<thead>";
          echo "<tr>";
          echo "<th width=\"5%\"># Prod</th>";
          echo "<th width=\"40%\">Produit</th>";
          echo "<th width=\"5%\">idTaille</th>";
          echo "<th width=\"15%\">Taille</th>";
          echo "<th width=\"5%\">Qté</th>";
          echo "</tr>";
          echo "</thead>";
          echo "<tbody>";
          while($row = mysqli_fetch_array($result)){
            echo "<tr>";
            echo "<td width=\"5%\">" . $row['ID_Prod'] . "</td>";
            echo "<td width=\"40%\">" . $row['Produit'] . "</td>";
            echo "<td width=\"5%\">" . $row['idTaille'] . "</td>";
            echo "<td width=\"15%\">" . $row['Taille'] . "</td>";
            echo "<td width=\"5%\">" . $row['Qt_Stock'] . "</td>";
            echo "</tr>";
          }
          echo "</tbody>";

          echo "</table>";
          // Free result set
          mysqli_free_result($result);
        } else{
          echo "<p><em>Aucun enregistrement trouvé.</em></p>";
        }
      } else{
        echo "ERREUR: Ne peut pas exécuter $sql. " . mysqli_error($link);
      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<br/><br/>Félicitations ! Les données du 'Stock' pour le produit n° ".$prod_id." sont à jour.";
      //header("refresh: 50;url=Form_stock.php");
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>
    <form method="POST">
      <label>
        Nouvelle Qté stock
        <input type="number" name="StockNew" placeholder="Nouveau stock" value="<?php if (!empty($_POST['StockNew'])) { echo $_POST['StockNew']; } ?>" min="0" max="20">
      </label><input type="submit" value="...:: Valider ::...">
    </form>
  <?php } ?>
  <br/><br/><a href="Form_stock.php"><input type="button" value="...:: Récapitulatif Stock ::..." /></a>
</body>
</html>
