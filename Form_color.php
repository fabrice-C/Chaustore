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
        <h1>Color</h1>
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

                  $ok="Voici le détail des couleurs (Color) :<BR/>";
                  echo $ok;
                  echo "<br>";

                  //affichage données réelles de la table color
                  $sql = 'select id, name from color order by id;';
                  $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                  //Résultats pour affichage des données couleur
                  while ($result = mysqli_fetch_row($req)) {
                  	//var_dump($result);
                    for ($i=0; $i < count($result) ; $i++) {
                      echo ($result[$i]." ");
                    }
                    echo "<br>";
                  }

                  // on ferme la connexion à la base
                  mysqli_close($conn);

                  $ok = "<BR/>Félicitations ! <BR/>Les données 'Color' sont à jour.";
                  echo '<p>'.$ok.'</p>';
                  //header("refresh: 10;url=Form_color.php");
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
                    if (empty($_POST['ColorC'])) {
                      $error .= "la couleur est obligatoire.<br/>";
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
                            //var_dump($_POST['ColorC']);

                            //ajout données réelles de la table color
                            $couleur=$_POST['ColorC'];
                            $ok="";
                            //test pour existence de la couleur
                            $sql = 'select name from color where name="'.$couleur.'";';
                            //echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);
                            if (is_null($result)) {
                                $countResult=0;
                                //echo "<br>";
                                $ok="La couleur doit être créée ...<BR/>";
                                echo $ok;
                                //ajout données réelles de la table client
                                $sql = "INSERT INTO `color` VALUES (null, '".$couleur."');";
                                //echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="<BR/>Vos informations ont été envoyées : <br/>La couleur ".$couleur." a été créée.<BR/>";
                                }
                                else {
                                  $ok="<BR/>Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                            }
                            else {
                                $countResult=1;
                                echo "<br>";
                                $ok="La couleur est déjà créée ! <BR/>Voici le détail des couleurs :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table color
                            $sql = 'select id, name from color order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données couleur
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "<BR/>Félicitations ! <BR/>Les données 'Color' sont à jour.";
                            //header("refresh: 40;url=Form_color.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Couleurs
                      <input type="text" name="ColorC" value="<?php if (!empty($_POST['ColorC'])) { echo $_POST['ColorC']; } ?>">
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
                    if (empty($_POST['ColorM'])) {
                      $error .= "la couleur à modifier est obligatoire.<br/>";
                      }
                    if (empty($_POST['ColorNew'])) {
                      $error .= "la nouvelle couleur est obligatoire.<br/>";
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
                            var_dump($_POST['ColorM']);var_dump($_POST['ColorNew']);

                            //Mise à jour données réelles de la table color
                            $couleur=$_POST['ColorM'];
                            $couleurNew=$_POST['ColorNew'];
                            var_dump($couleur);echo "<br>";var_dump($couleurNew);
                            $ok="";
                            //test pour existence de la couleur
                            $sql = 'select name from color where name="'.$couleur.'";';
                            echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);

                            if (is_null($result)) {
                                $countResult=0;
                                echo "<br>";
                                $ok="La couleur à modifier ".$couleur." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
                                echo $ok;
                            }
                            else {
                                $countResult=1;
                                //Mise à jour données réelles de la table client
                                //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
                                $sql = "UPDATE `color` SET name= '".$couleurNew."' WHERE name='".$couleur."';";
                                echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="Félicitations ! vos informations ont été envoyées : <br/> La couleur ".$couleur." a été mise à jour.";
                                }
                                else {
                                  $ok="Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                                echo "<br>";
                                $ok="Voici le détail des couleurs mises à jour :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table color
                            $sql = 'select id, name from color order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données couleur
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "Félicitations ! Les données 'Color' sont à jour.";
                            //header("refresh: 50;url=Form_color.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Couleur à modifier
                    <input type="text" name="ColorM" placeholder="Couleur à modifier (nom)" value="<?php if (!empty($_POST['ColorM'])) { echo $_POST['ColorM']; } ?>">
                  </label>
                  <label>
                    Nouvelle couleur
                    <input type="text" name="ColorNew" placeholder="Nouvelle couleur" value="<?php if (!empty($_POST['ColorNew'])) { echo $_POST['ColorNew']; } ?>">
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
              <h2>Aucune suppression n'est permise pour les couleurs !</h2>
              <h3>Cette donnée est indispensable pour la gestion des produits !</h3>
              <h4>Vérifier les produits en stock existants de cette couleur avant de la supprimer.<h4>
        </div>
    </body>
</html>
