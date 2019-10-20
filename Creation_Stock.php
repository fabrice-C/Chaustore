<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>Chaustore - Back-office - Stock Creation</title>

  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Création Ligne de Stock</h1>
  <?php
  $error = "";
  $ok = "";
  if (!empty($_POST)) {
    if (empty($_POST['ID_Produit'])) {
      $error .= "le numéro du produit est obligatoire.<br/>";
    }
    if (empty($_POST['ID_Taille'])) {
      $error .= "le numéro de la pointure est obligatoire.<br/>";
    }
    if (is_null($_POST['Qt_Stock'])) {
      $error .= "la quantité en stock doit être indiquée, même si elle est égale à zéro '0'.<br/>";
    }


    if (empty($error)) {
      //connexion à la base de données PHP_Form_Client
      require('connectFC.php');

      //ajout données réelles de la table stock
      $ProdID=$_POST['ID_Produit'];
      $TailleID=$_POST['ID_Taille'];
      $StockQ=$_POST['Qt_Stock'];
      $ok="";
      //test pour existence du stock
      $sql = 'select product_id, size_id, stock from stock where product_id='.$ProdID.' AND size_id='.$TailleID.';';
      //echo "<br>";var_dump($sql);echo "<br>";
      $req = mysqli_query($conn, $sql);
      $result = mysqli_fetch_row($req);
      //var_dump($result);//var_dump($result);
      if (is_null($result)) {
        //echo "<br>";
        $ok="Le stock pour le produit n° ".$ProdID." avec la pointure n°".$TailleID." peut être créée ...<BR/>";
        echo $ok;
        //ajout données réelles de la table client
        $sql = 'INSERT INTO `stock` VALUES ('.$ProdID.', '.$TailleID.', '.$StockQ.');';
        //echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);

        if ($req) {
          $ok="<BR/>Vos informations de création ont été envoyées : <br/><br/>Le stock du produit N° ".$ProdID." avec la pointure ".$TailleID." a été ajouté. <BR/>La quantité en stock pour ce produit et cette taille est égale à ".$StockQ.".<BR/>";
        }
        else {
          $ok="<BR/>Attention ! quelque chose s'est mal passé...";
        }
        echo ($ok);
      }
      else {

        echo "<br>";
        $ok="Le stock pour ce produit N° ".$ProdID." et cette taille ".$TailleID." est déjà créé ! <BR/>";
        echo $ok;

      }

      // on ferme la connexion à la base
      require('disconnect.php');

      $ok = "<BR/>Les données 'Stock' sont à jour.";
    }
  }
  echo '<p>'.$error.$ok.'</p>';
  ?>
  <?php if (empty($_POST) || !empty($error)) { ?>

    <div class="form">
      <form method="POST">
        <label>
          ID_Produit
          <input type="text" name="ID_Produit" value="<?php if (!empty($_POST['ID_Produit'])) { echo $_POST['ID_Produit']; } ?>">
        </label>
        <BR/><BR/>
        <label>
          ID_Taille
          <input type="text" name="ID_Taille" value="<?php if (!empty($_POST['ID_Taille'])) { echo $_POST['ID_Taille']; } ?>">
        </label>
        <BR/><BR/>
        <label>
          Qt_Stock
          <input type="text" name="Qt_Stock" Default=1 value="<?php if (!empty($_POST['Qt_Stock'])) { echo $_POST['Qt_Stock']; } ?>">
        </label>
        <BR/><BR/>
        <input type="submit" value=". . . : : : V a l i d e r : : : . . .">
      </form>
    </div>
  <?php } ?>
  <p><BR/><BR/><a href="Form_stock.php"><input type="button" value="...:: Récapitulatif Stock ::..." /></a></p>

</body>
</html>
