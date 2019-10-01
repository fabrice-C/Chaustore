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
        <h1>Size</h1>
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

                  $ok="Voici le détail des tailles (Size) :<BR/>";
                  echo $ok;
                  echo "<br>";

                  //affichage données réelles de la table size
                  $sql = 'select id, name from size order by id;';
                  $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                  //Résultats pour affichage des données Size
                  while ($result = mysqli_fetch_row($req)) {
                  	//var_dump($result);
                    for ($i=0; $i < count($result) ; $i++) {
                      echo ($result[$i]." ");
                    }
                    echo "<br>";
                  }

                  // on ferme la connexion à la base
                  mysqli_close($conn);

                  $ok = "<BR/>Félicitations ! <BR/>Les données 'Size' sont à jour.";
                  echo '<p>'.$ok.'</p>';
                  //header("refresh: 10;url=Form_size.php");
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
                    if (empty($_POST['SizeC'])) {
                      $error .= "la Size est obligatoire.<br/>";
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
                            //var_dump($_POST['SizeC']);

                            //ajout données réelles de la table size
                            $size=$_POST['SizeC'];
                            $ok="";
                            //test pour existence de la Size
                            $sql = 'select name from size where name="'.$size.'";';
                            //echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);
                            if (is_null($result)) {
                                $countResult=0;
                                //echo "<br>";
                                $ok="La taille (Size) doit être créée ...<BR/>";
                                echo $ok;
                                //ajout données réelles de la table client
                                $sql = "INSERT INTO `size` VALUES (null, '".$size."');";
                                //echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="<BR/>Vos informations ont été envoyées : <br/>La taille ".$size." a été créée.<BR/>";
                                }
                                else {
                                  $ok="<BR/>Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                            }
                            else {
                                $countResult=1;
                                echo "<br>";
                                $ok="La taille est déjà créée ! <BR/>Voici le détail des tailles :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table size
                            $sql = 'select id, name from size order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données Size
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "<BR/>Félicitations ! <BR/>Les données 'Size' sont à jour.";
                            //header("refresh: 40;url=Form_size.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Tailles
                      <input type="text" name="SizeC" value="<?php if (!empty($_POST['SizeC'])) { echo $_POST['SizeC']; } ?>">
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
                    if (empty($_POST['SizeM'])) {
                      $error .= "la taille à modifier est obligatoire.<br/>";
                      }
                    if (empty($_POST['SizeNew'])) {
                      $error .= "la nouvelle taille est obligatoire.<br/>";
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
                            var_dump($_POST['SizeM']);var_dump($_POST['SizeNew']);

                            //Mise à jour données réelles de la table size
                            $size=$_POST['SizeM'];
                            $sizeNew=$_POST['SizeNew'];
                            var_dump($size);echo "<br>";var_dump($sizeNew);
                            $ok="";
                            //test pour existence de la Size
                            $sql = 'select name from size where name="'.$size.'";';
                            echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);

                            if (is_null($result)) {
                                $countResult=0;
                                echo "<br>";
                                $ok="La Size à modifier ".$size." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
                                echo $ok;
                            }
                            else {
                                $countResult=1;
                                //Mise à jour données réelles de la table client
                                //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
                                $sql = "UPDATE `size` SET name= '".$sizeNew."' WHERE name='".$size."';";
                                echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="Félicitations ! vos informations ont été envoyées : <br/> La taille ".$size." a été mise à jour.";
                                }
                                else {
                                  $ok="Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                                echo "<br>";
                                $ok="Voici le détail des tailles mises à jour :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table size
                            $sql = 'select id, name from size order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données Size
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "Félicitations ! Les données 'Size' sont à jour.";
                            //header("refresh: 50;url=Form_size.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Taille à modifier
                    <input type="text" name="SizeM" placeholder="Taille à modifier (nom)" value="<?php if (!empty($_POST['SizeM'])) { echo $_POST['SizeM']; } ?>">
                  </label>
                  <label>
                    Nouvelle taille
                    <input type="text" name="SizeNew" placeholder="Nouvelle taille" value="<?php if (!empty($_POST['SizeNew'])) { echo $_POST['SizeNew']; } ?>">
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

              <h2>Aucune suppression n'est permise pour les tailles !</h2>
              <h3>Cette donnée est indispensable pour la gestion du stock !</h3>
              <h4>Vérifier si la taille n'est pas en stock avant de la supprimer.</h4>
        </div>
    </body>
</html>
