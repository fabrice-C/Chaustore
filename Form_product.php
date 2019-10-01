<!DOCTYPE html>
<html lang="fr">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <!--<meta http-equiv="refresh" content="100">  -->

      <title>Chaustore - Back-office</title>
      <link rel="stylesheet" type="text/css" href="styles2.css"/>
    </head>
    <body>
        <h1>Product</h1>
        <nav>
          <ul>
            <li><a href="#1" title="Visualisation"><i class="material-icons">tv</i> Visualisation</a></li>
            <li><a href="#2" title="Création"><i class="material-icons">add_circle_outline</i> Création</a></li>
            <li><a href="#3" title="Modification"><i class="material-icons">create</i> Modification</a></li>
            <li><a href="#4" title="Suppression"><i class="material-icons">remove_circle_outline</i> Suppression</a></li>
          </ul>
        </nav>

        <!-- Visualisation -->
        <div class="conteneur">
          <p id="1" class="resultats">Résultats Visualisation</p>
          <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a>  Visualisation données table Category <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>

              <br/><br/>

              <p>
              <?php

                  $ok = "";
                  //connexion à la base de données PHP_Form_Client
                  $conn = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore');

                  if (!$conn) {
                      die('Erreur de connexion (' . mysqli_connect_errno() . ') '
                              . mysqli_connect_error());
                  }

                  mysqli_set_charset($conn,'utf8');

                  //echo 'Succès... ' . mysqli_get_host_info($conn) . "\n";

                  $ok="Voici le détail des produits (Product) :<BR/>";
                  echo $ok;
                  echo "<br>";

                  //affichage données réelles de la table product
                  $sql = 'select id, name from product order by id;';
                  $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                  //Résultats pour affichage des données produit
                  while ($result = mysqli_fetch_row($req)) {
                  	//var_dump($result);
                    for ($i=0; $i < count($result) ; $i++) {
                      echo ($result[$i]." ");
                    }
                    echo "<br>";
                  }

                  // on ferme la connexion à la base
                  mysqli_close($conn);

                  $ok = "<BR/>Félicitations ! <BR/>Les données 'Product' sont à jour.";
                  echo '<p>'.$ok.'</p>';
                  //header("refresh: 10;url=Form_product.php");
              ?>
            </p>
        </div>

        <!-- Creation -->
        <div class="conteneur">
          <p id="2" class="resultats">Résultats Création</p>
          <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a>  Création données table Category <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>

              <br/><br/>

              <p>
              <?php
                  $error = "";
                  $ok = "";
                  if (!empty($_POST)) {
                    if (empty($_POST['ProductC'])) {
                      $error .= "le produit est obligatoire.<br/>";
                      }

                      if (empty($error)) {
                            //connexion à la base de données PHP_Form_Client
                            $conn = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore');

                            if (!$conn) {
                                die('Erreur de connexion (' . mysqli_connect_errno() . ') '
                                        . mysqli_connect_error());
                            }

                            //echo 'Succès... ' . mysqli_get_host_info($conn) . "\n";

                            //affichage des tables de la base PHP_Form_Client
                            mysqli_set_charset($conn,'utf8');

                            //récupérer les valeurs des champs du formulaire
                            //var_dump($_POST['ProductC']);

                            //ajout données réelles de la table product
                            $produit=$_POST['ProductC'];
                            $ok="";
                            //test pour existence du produit
                            $sql = 'select name from product where name="'.$produit.'";';
                            //echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);
                            if (is_null($result)) {
                                $countResult=0;
                                //echo "<br>";
                                $ok="le produit doit être créée ...<BR/>";
                                echo $ok;
                                //ajout données réelles de la table client
                                $sql = "INSERT INTO `product` VALUES (null, '".$produit."');";
                                //echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="<BR/>Vos informations ont été envoyées : <br/>le produit ".$produit." a été créée.<BR/>";
                                }
                                else {
                                  $ok="<BR/>Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                            }
                            else {
                                $countResult=1;
                                echo "<br>";
                                $ok="le produit est déjà créée ! <BR/>Voici le détail des produits :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table product
                            $sql = 'select id, name from product order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données produit
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "<BR/>Félicitations ! <BR/>Les données 'Product' sont à jour.";
                            //header("refresh: 40;url=Form_product.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Products
                      <input type="text" name="ProductC" value="<?php if (!empty($_POST['ProductC'])) { echo $_POST['ProductC']; } ?>">
                  </label>
                  <input type="submit" value="Send">
              </form>
              <?php } ?>
            </p>
        </div>


        <!-- Modification -->
        <div class="conteneur">
          <p id="3" class="resultats">Résultats Modification</p>
          <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a>  Modification données table Category <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>
              <br/><br/>

              <p>
              <?php
                  $error = "";
                  $ok = "";
                  if (!empty($_POST)) {
                    if (empty($_POST['ProductM'])) {
                      $error .= "le produit à modifier est obligatoire.<br/>";
                      }
                    if (empty($_POST['ProductNew'])) {
                      $error .= "le nouveau produit est obligatoire.<br/>";
                      }

                      if (empty($error)) {
                            //connexion à la base de données PHP_Form_Client
                            $conn = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore');

                            if (!$conn) {
                                die('Erreur de connexion (' . mysqli_connect_errno() . ') '
                                        . mysqli_connect_error());
                            }

                            echo 'Succès... ' . mysqli_get_host_info($conn) . "\n";

                            mysqli_set_charset($conn,'utf8');

                            //récupérer les valeurs des champs du formulaire
                            var_dump($_POST['ProductM']);var_dump($_POST['ProductNew']);

                            //Mise à jour données réelles de la table product
                            $produit=$_POST['ProductM'];
                            $produitNew=$_POST['ProductNew'];
                            var_dump($produit);echo "<br>";var_dump($produitNew);
                            $ok="";
                            //test pour existence du produit
                            $sql = 'select name from product where name="'.$produit.'";';
                            echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);

                            if (is_null($result)) {
                                $countResult=0;
                                echo "<br>";
                                $ok="le produit à modifier ".$produit." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
                                echo $ok;
                            }
                            else {
                                $countResult=1;
                                //Mise à jour données réelles de la table client
                                //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
                                $sql = "UPDATE `product` SET name= '".$produitNew."' WHERE name='".$produit."';";
                                echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="Félicitations ! vos informations ont été envoyées : <br/> le produit ".$produit." a été mise à jour.";
                                }
                                else {
                                  $ok="Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                                echo "<br>";
                                $ok="Voici le détail des produits mises à jour :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table product
                            $sql = 'select id, name from product order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données produit
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "Félicitations ! Les données 'Product' sont à jour.";
                            //header("refresh: 50;url=Form_product.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Produit à modifier
                    <input type="text" name="ProductM" placeholder="Produit à modifier (nom)" value="<?php if (!empty($_POST['ProductM'])) { echo $_POST['ProductM']; } ?>">
                  </label>
                  <label>
                    Nouveau produit
                    <input type="text" name="ProductNew" placeholder="Nouveau produit" value="<?php if (!empty($_POST['ProductNew'])) { echo $_POST['ProductNew']; } ?>">
                  </label>
                  <input type="submit" value="Send">
              </form>
              <?php } ?>
            </p>
        </div>


        <!-- Suppression -->
        <div class="conteneur">
          <p id="4" class="resultats">Résultats Suppression</p>

          <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a>  Suppression données table Category <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>

              <br/><br/>
              <h2>Les produits ne peuvent pas être supprimés !</h2>
              <h3>Cette table est indispensable pour la gestion des catégories, des marques, des couleurs et des stocks !</h3>
              <h4>Attention ! Certains produits et/ou tailles peuvent être en RUPTURE de stock !</h4>
              <h5>Vérifier les stocks avant de supprimer un produit.</h5>
        </div>
    </body>
</html>
