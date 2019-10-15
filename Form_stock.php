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
  <h1>Stock</h1>
  <nav>
    <ul>
      <li><a href="#1" title="Visualisation"><i class="material-icons">tv</i> Visualisation</a></li>
      <li><a href="#2" title="Création"><i class="material-icons">add_circle_outline</i> Création</a></li>
    </ul>
  </nav>

  <!-- Visualisation -->
  <div class="conteneur">
    <h2 id="1" class="resultats">Visualisation Stock</h2>
    <!-- <a href="index.php"><input type="button" value="Accueil" /></a>  -->

    <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a> Récapitulatif des stocks <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>
    <br/><input type="button" onclick='window.location.reload(false)' value="..: Réactualiser le tableau :.."/>
    <br/><br/><br/>
    <table width="76%">
      <thead>
        <tr>
          <th width="5%"># Prod</th>
          <th width="40%">Produit</th>
          <th width="5%">idTaille</th>
          <th width="15%">Taille</th>
          <th width="5%">Qté</th>
          <th width="5%">MAJ</th>
          <th width="5%">Suppr</th>
        </tr>
      </thead>
    </table>

    <div class="overflowTest">
      <table class="t01" width="80%">

      <?php

      $ok = "";
      //connexion à la base de données PHP_Form_Client
      require_once('connectFC.php');

      //$ok="Voici le détail des stocks (Stock) :<BR/>";
      //echo $ok;
      //echo "<br>";

      //affichage données réelles de la table stock
      $sql = 'select p.id as ID_Prod, p.name as Produit, si.id as idTaille, si.name as Taille, st.stock as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id order by Produit, Taille;';
      //$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

      if($result = mysqli_query($conn, $sql)){
        if(mysqli_num_rows($result) > 0){

            echo "<tbody>";
            while($row = mysqli_fetch_array($result)){
              echo "<tr>";
              echo "<td width=\"5%\">" . $row['ID_Prod'] . "</td>";
              echo "<td width=\"40%\">" . $row['Produit'] . "</td>";
              echo "<td width=\"5%\">" . $row['idTaille'] . "</td>";
              echo "<td width=\"15%\">" . $row['Taille'] . "</td>";
              echo "<td width=\"5%\">" . $row['Qt_Stock'] . "</td>";
              echo "<td width=\"5%\"><a href=\"confirm.php?ID_Prod=" . $row['ID_Prod'] . "&idTaille=" . $row['idTaille'] . "&Qt_Stock=" . $row['Qt_Stock'] . "\"><i class=\"material-icons\">create</i></a></td>";
              echo "<td width=\"5%\"><i class=\"material-icons\">delete_outline</i></td>";
              echo "</tr>";
            }
            echo "</tbody>";

          echo "</table>";
          // Free result set
          mysqli_free_result($result);
        } else{
          echo "<p class='lead'><em>No records were found.</em></p>";
        }
      } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<BR/>Félicitations ! <BR/>Les données 'Stock' sont à jour.";
      echo '<p>'.$ok.'</p>';
      //header("refresh: 10;url=Form_stock.php");
      ?>
    </div>
  </div>

<!-- Creation -->
<div class="conteneur">
  <h2 id="2" class="resultats">Création de stock produit - pointure</h2>
  <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a>  Création Stock Produit - Pointure <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>

  <br/><br/>

  <p>
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
        echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);
        $result = mysqli_fetch_row($req);
        var_dump($result);//var_dump($result);
        if (is_null($result)) {
          $countResult=0;
          //echo "<br>";
          $ok="Le stock doit être créée ...<BR/>";
          echo $ok;
          //ajout données réelles de la table client
          $sql = 'INSERT INTO `stock` VALUES ('.$ProdID.', '.$TailleID.', '.$StockQ.');';
          echo "<br>";var_dump($sql);echo "<br>";
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="<BR/>Bravo ! vos informations ont été envoyées. <br/><br/>Le stock du produit N° ".$prod_id." à modifier avec la pointure ".$taille_id." a été mise à jour. La nouvelle quantité est égale à : ".$stockNew.";<BR/>";
          }
          else {
            $ok="<BR/>Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);
        }
        else {
          $countResult=1;
          echo "<br>";
          $ok="Le stock est déjà créée ! <BR/>Voici le détail des stocks :<BR/>";
          echo $ok;

        }

        echo "<br>";

        //affichage données réelles de la table stock
        $sql = 'select product_id, size_id, stock from stock where product_id='.$ProdID.' AND size_id='.$TailleID.';';
        $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
        //Résultats pour affichage des données stock
        while ($result = mysqli_fetch_row($req)) {
          //var_dump($result);
          for ($i=0; $i < count($result) ; $i++) {
            echo ($result[$i]." ");
          }
          echo "<br>";
        }

        // on ferme la connexion à la base
        require('disconnect.php');

        $ok = "<BR/>Félicitations ! <BR/>Les données 'Stock' sont à jour.";
        //header("refresh: 40;url=Form_stock.php");
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
  </p>
</div>

<!-- Suppression -->
<div class="conteneur">
  <p id="4" class="resultats">Résultats Suppression</p>

  <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a>  Suppression données table Stock <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>

  <br/><br/>
  <h2>Les stocks ne peuvent pas être supprimés !</h2>
  <h3>Cette donnée est indispensable pour la gestion des produits et des tailles !</h3>
  <h4>Attention ! Certains produits et/ou tailles peuvent être en RUPTURE de stock !</h4>
  <h5>Vérifier les produits et les tailles avant de supprimer un stock.</h5>
  <p>
    <?php
    $error = "";
    $ok = "";
    if (!empty($_POST)) {
      if (empty($_POST['StockS'])) {
        $error .= "le stock est obligatoire.<br/>";
      }

      if (empty($error)) {
        //connexion à la base de données PHP_Form_Client
        require('connectFC.php');

        //suppression données réelles de la table stock
        $stock=$_POST['StockS'];
        var_dump($stock);
        $ok="";
        //test pour existence du stock
        $sql = 'select name from stock where name="'.$stock.'";';
        echo "<br>";var_dump($sql);echo "<br>";
        $req = mysqli_query($conn, $sql);
        $result = mysqli_fetch_row($req);
        //var_dump($result);//var_dump($result);
        if (is_null($result)) {
          $countResult=0;
          echo "<br>";
          $ok="Le stock ".$stock." n'existe pas ...<BR/>";
          echo $ok;
        }
        else {
          $countResult=1;
          echo "<br>";var_dump($stock);echo "<br>";
          $ok="Vous allez supprimer le stock '".$stock."'.<BR/>";
          echo $ok;
          //suppression données de la table client
          //DELETE FROM `utilisateur` WHERE `id` = 1

          $sql = 'DELETE FROM `stock` WHERE `name` = "'.$stock.'";';
          echo "<br>";var_dump($sql);echo "<br>";
          $req = mysqli_query($conn, $sql);

          if ($req) {
            $ok="Félicitations ! <br/> Le stock ".$stock." a été supprimée.";
          }
          else {
            $ok="Attention ! quelque chose s'est mal passé...";
          }
          echo ($ok);

          echo "<br>";
          $ok="Voici le détail des stocks mises à jour :<BR/>";
          echo $ok;

        }

        echo "<br>";

        //affichage données réelles de la table stock
        $sql = 'select id, name from stock order by id;';
        $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
        //Résultats pour affichage des données stock
        while ($result = mysqli_fetch_row($req)) {
          //var_dump($result);
          for ($i=0; $i < count($result) ; $i++) {
            echo ($result[$i]." ");
          }
          echo "<br>";
        }

        // on ferme la connexion à la base
        require('disconnect.php');

        $ok = "Félicitations ! Les données 'Stock' sont à jour.";
        //header("refresh: 50;url=Form_stock.php");
      }
    }
    echo '<p>'.$error.$ok.'</p>';
    ?>
    <?php if (empty($_POST) || !empty($error)) { ?>
      <form method="POST">
        <label>
          Stocks
          <input type="text" name="StockS" value="<?php if (!empty($_POST['StockS'])) { echo $_POST['StockS']; } ?>">
        </label>
        <input type="submit" value="Send">
      </form>
    <?php } ?>
  </p>
</div>
</body>
</html>
