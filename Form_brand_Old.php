<!DOCTYPE html>
<html lang="fr">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <!--<meta http-equiv="refresh" content="100">  -->

      <title>Chaustore - Back-office - Marques</title>
      <link rel="stylesheet" type="text/css" href="styles2.css"/>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <h1>Brand</h1>
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
                  require_once('connectFC.php');

                  $ok="Voici le détail des marques (Brand) :<BR/>";
                  echo $ok;
                  echo "<br>";

                  //affichage données réelles de la table brand
                  $sql = 'select id, name from brand order by id;';
                  $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                  //Résultats pour affichage des données marque
                  while ($result = mysqli_fetch_row($req)) {
                  	//var_dump($result);
                    for ($i=0; $i < count($result) ; $i++) {
                      echo ($result[$i]." ");
                    }
                    echo "<br>";
                  }

                  // on ferme la connexion à la base
                  require_once('disconnect.php');

                  $ok = "<BR/>Félicitations ! <BR/>Les données 'Brand' sont à jour.";
                  echo '<p>'.$ok.'</p>';
                  header("refresh: 10;url=Form_brand.php");
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
                    if (empty($_POST['BrandC'])) {
                      $error .= "la marque est obligatoire.<br/>";
                      }

                      if (empty($error)) {
                        //connexion à la base de données PHP_Form_Client
                        require('connectFC.php');

                            //ajout données réelles de la table brand
                            $marque=$_POST['BrandC'];
                            $ok="";
                            //test pour existence de la marque
                            $sql = 'select name from brand where name="'.$marque.'";';
                            //echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);
                            if (is_null($result)) {
                                $countResult=0;
                                //echo "<br>";
                                $ok="La marque doit être créée ...<BR/>";
                                echo $ok;
                                //ajout données réelles de la table client
                                $sql = "INSERT INTO `brand` VALUES (null, '".$marque."');";
                                //echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="<BR/>Vos informations ont été envoyées : <br/>La marque ".$marque." a été créée.<BR/>";
                                }
                                else {
                                  $ok="<BR/>Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                            }
                            else {
                                $countResult=1;
                                echo "<br>";
                                $ok="La marque est déjà créée ! <BR/>Voici le détail des marques :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table brand
                            $sql = 'select id, name from brand order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données marque
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            require('disconnect.php');

                            $ok = "<BR/>Félicitations ! <BR/>Les données 'Brand' sont à jour.";
                            header("refresh: 40;url=Form_brand.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Brands
                      <input type="text" name="BrandC" value="<?php if (!empty($_POST['BrandC'])) { echo $_POST['BrandC']; } ?>">
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
                    if (empty($_POST['BrandM'])) {
                      $error .= "la marque à modifier est obligatoire.<br/>";
                      }
                    if (empty($_POST['BrandNew'])) {
                      $error .= "la nouvelle marque est obligatoire.<br/>";
                      }

                      if (empty($error)) {
                        //connexion à la base de données PHP_Form_Client
                        require('connectFC.php');

                            //Mise à jour données réelles de la table brand
                            $marque=$_POST['BrandM'];
                            $marqueNew=$_POST['BrandNew'];
                            var_dump($marque);echo "<br>";var_dump($marqueNew);
                            $ok="";
                            //test pour existence de la marque
                            $sql = 'select name from brand where name="'.$marque.'";';
                            echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);

                            if (is_null($result)) {
                                $countResult=0;
                                echo "<br>";
                                $ok="La marque à modifier ".$marque." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
                                echo $ok;
                            }
                            else {
                                $countResult=1;
                                //Mise à jour données réelles de la table client
                                //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
                                $sql = "UPDATE `brand` SET name= '".$marqueNew."' WHERE name='".$marque."';";
                                echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="Félicitations ! vos informations ont été envoyées : <br/> La marque ".$marque." a été mise à jour.";
                                }
                                else {
                                  $ok="Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                                echo "<br>";
                                $ok="Voici le détail des marques mises à jour :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table brand
                            $sql = 'select id, name from brand order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données marque
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            require('disconnect.php');

                            $ok = "Félicitations ! Les données 'Brand' sont à jour.";
                            header("refresh: 50;url=Form_brand.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Marque à modifier
                    <input type="text" name="BrandM" placeholder="Marque à modifier (nom)" value="<?php if (!empty($_POST['BrandM'])) { echo $_POST['BrandM']; } ?>">
                  </label>
                  <label>
                    Nouvelle marque
                    <input type="text" name="BrandNew" placeholder="Nouvelle marque" value="<?php if (!empty($_POST['BrandNew'])) { echo $_POST['BrandNew']; } ?>">
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
              <h2>Aucune suppression n'est permise pour les marques !</h2>
              <h3>Cette donnée est indispensable pour la gestion des produits !</h3>
              <h4>Vérifier les produits en stock existants de cette marque avant de la supprimer.<h4>

        </div>
    </body>
</html>
