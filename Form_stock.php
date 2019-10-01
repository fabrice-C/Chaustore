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
        <h1>Stock</h1>
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

                  $ok="Voici le détail des stocks (Stock) :<BR/>";
                  echo $ok;
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
                  mysqli_close($conn);

                  $ok = "<BR/>Félicitations ! <BR/>Les données 'Stock' sont à jour.";
                  echo '<p>'.$ok.'</p>';
                  //header("refresh: 10;url=Form_stock.php");
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
                    if (empty($_POST['StockC'])) {
                      $error .= "le stock est obligatoire.<br/>";
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
                            //var_dump($_POST['StockC']);

                            //ajout données réelles de la table stock
                            $stock=$_POST['StockC'];
                            $ok="";
                            //test pour existence du stock
                            $sql = 'select name from stock where name="'.$stock.'";';
                            //echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);
                            if (is_null($result)) {
                                $countResult=0;
                                //echo "<br>";
                                $ok="Le stock doit être créée ...<BR/>";
                                echo $ok;
                                //ajout données réelles de la table client
                                $sql = "INSERT INTO `stock` VALUES (null, '".$stock."');";
                                //echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="<BR/>Vos informations ont été envoyées : <br/>Le stock ".$stock." a été créée.<BR/>";
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
                            mysqli_close($conn);

                            $ok = "<BR/>Félicitations ! <BR/>Les données 'Stock' sont à jour.";
                            //header("refresh: 40;url=Form_stock.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Stocks
                      <input type="text" name="StockC" value="<?php if (!empty($_POST['StockC'])) { echo $_POST['StockC']; } ?>">
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
                    if (empty($_POST['StockM'])) {
                      $error .= "le stock à modifier est obligatoire.<br/>";
                      }
                    if (empty($_POST['StockNew'])) {
                      $error .= "le nouveau stock est obligatoire.<br/>";
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
                            var_dump($_POST['StockM']);var_dump($_POST['StockNew']);

                            //Mise à jour données réelles de la table stock
                            $stock=$_POST['StockM'];
                            $stockNew=$_POST['StockNew'];
                            var_dump($stock);echo "<br>";var_dump($stockNew);
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
                                $ok="Le stock à modifier ".$stock." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
                                echo $ok;
                            }
                            else {
                                $countResult=1;
                                //Mise à jour données réelles de la table client
                                //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
                                $sql = "UPDATE `stock` SET name= '".$stockNew."' WHERE name='".$stock."';";
                                echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="Félicitations ! vos informations ont été envoyées : <br/> Le stock ".$stock." a été mise à jour.";
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
                            mysqli_close($conn);

                            $ok = "Félicitations ! Les données 'Stock' sont à jour.";
                            //header("refresh: 50;url=Form_stock.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Stock à modifier
                    <input type="text" name="StockM" placeholder="Stock à modifier (nom)" value="<?php if (!empty($_POST['StockM'])) { echo $_POST['StockM']; } ?>">
                  </label>
                  <label>
                    Nouveau stock
                    <input type="text" name="StockNew" placeholder="Nouveau stock" value="<?php if (!empty($_POST['StockNew'])) { echo $_POST['StockNew']; } ?>">
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
                            $conn = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore');

                            if (!$conn) {
                                die('Erreur de connexion (' . mysqli_connect_errno() . ') '
                                        . mysqli_connect_error());
                            }

                            echo 'Succès... ' . mysqli_get_host_info($conn) . "\n";

                            mysqli_set_charset($conn,'utf8');

                            //récupérer les valeurs des champs du formulaire
                            var_dump($_POST['StockS']);

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
                            mysqli_close($conn);

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
