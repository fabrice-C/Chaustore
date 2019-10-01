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
        <h1>Category</h1>
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

                  $ok="Voici le détail des catégories (Category) :<BR/>";
                  echo $ok;
                  echo "<br>";

                  //affichage données réelles de la table category
                  $sql = 'select id, name from category order by id;';
                  $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                  //Résultats pour affichage des données catégorie
                  while ($result = mysqli_fetch_row($req)) {
                  	//var_dump($result);
                    for ($i=0; $i < count($result) ; $i++) {
                      echo ($result[$i]." ");
                    }
                    echo "<br>";
                  }

                  // on ferme la connexion à la base
                  mysqli_close($conn);

                  $ok = "<BR/>Félicitations ! <BR/>Les données 'Category' sont à jour.";
                  echo '<p>'.$ok.'</p>';
                  //header("refresh: 500;url=Form_category.php");
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
                    if (empty($_POST['CategoryC'])) {
                      $error .= "la catégorie est obligatoire.<br/>";
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
                            //var_dump($_POST['Category']);

                            //ajout données réelles de la table category
                            $categorie=$_POST['CategoryC'];
                            $ok="";
                            //test pour existence de la catégorie
                            $sql = 'select name from category where name="'.$categorie.'";';
                            //echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);
                            if (is_null($result)) {
                                $countResult=0;
                                //echo "<br>";
                                $ok="La catégorie doit être créée ...<BR/>";
                                echo $ok;
                                //ajout données réelles de la table client
                                $sql = "INSERT INTO `category` VALUES (null, '".$categorie."');";
                                //echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="<BR/>Vos informations ont été envoyées : <br/>La catégorie ".$categorie." a été créée.<BR/>";
                                }
                                else {
                                  $ok="<BR/>Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                            }
                            else {
                                $countResult=1;
                                echo "<br>";
                                $ok="La catégorie est déjà créée ! <BR/>Voici le détail des catégories :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table category
                            $sql = 'select id, name from category order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données catégorie
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "<BR/>Félicitations ! <BR/>Les données 'Category' sont à jour.";
                            //header("refresh: 500;url=Form_category.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Categories
                      <input type="text" name="CategoryC" value="<?php if (!empty($_POST['CategoryC'])) { echo $_POST['CategoryC']; } ?>">
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
                    if (empty($_POST['CategoryM'])) {
                      $error .= "la catégorie à modifier est obligatoire.<br/>";
                      }
                    if (empty($_POST['CategoryNew'])) {
                      $error .= "la nouvelle catégorie est obligatoire.<br/>";
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
                            var_dump($_POST['CategoryM']);var_dump($_POST['CategoryNew']);

                            //Mise à jour données réelles de la table category
                            $categorie=$_POST['CategoryM'];
                            $categorieNew=$_POST['CategoryNew'];
                            var_dump($categorie);echo "<br>";var_dump($categorieNew);
                            $ok="";
                            //test pour existence de la catégorie
                            $sql = 'select name from category where name="'.$categorie.'";';
                            echo "<br>";var_dump($sql);echo "<br>";
                            $req = mysqli_query($conn, $sql);
                            $result = mysqli_fetch_row($req);
                            //var_dump($result);//var_dump($result);

                            if (is_null($result)) {
                                $countResult=0;
                                echo "<br>";
                                $ok="La catégorie à modifier ".$categorie." n'existe pas ...<BR/>Veuillez vérifier la saisie.";
                                echo $ok;
                            }
                            else {
                                $countResult=1;
                                //Mise à jour données réelles de la table client
                                //UPDATE liste_proprietaire SET telephone="06-55-99-10-00" WHERE nom="Benoît";
                                $sql = "UPDATE `category` SET name= '".$categorieNew."' WHERE name='".$categorie."';";
                                echo "<br>";var_dump($sql);echo "<br>";
                                $req = mysqli_query($conn, $sql);

                                if ($req) {
                                  $ok="Félicitations ! vos informations ont été envoyées : <br/> La catégorie ".$categorie." a été mise à jour.";
                                }
                                else {
                                  $ok="Attention ! quelque chose s'est mal passé...";
                                }
                                echo ($ok);
                                echo "<br>";
                                $ok="Voici le détail des catégories mises à jour :<BR/>";
                                echo $ok;

                            }

                            echo "<br>";

                            //affichage données réelles de la table category
                            $sql = 'select id, name from category order by id;';
                            $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT
                            //Résultats pour affichage des données catégorie
                            while ($result = mysqli_fetch_row($req)) {
                            	//var_dump($result);
                              for ($i=0; $i < count($result) ; $i++) {
                                echo ($result[$i]." ");
                              }
                              echo "<br>";
                            }

                            // on ferme la connexion à la base
                            mysqli_close($conn);

                            $ok = "Félicitations ! Les données 'Category' sont à jour.";
                            //header("refresh: 500;url=Form_category.php");
                      }
                  }
                  echo '<p>'.$error.$ok.'</p>';
              ?>
              <?php if (empty($_POST) || !empty($error)) { ?>
              <form method="POST">
                  <label>
                    Categorie à modifier
                    <input type="text" name="CategoryM" placeholder="Catégorie à modifier (nom)" value="<?php if (!empty($_POST['CategoryM'])) { echo $_POST['CategoryM']; } ?>">
                  </label>
                  <label>
                    Nouvelle categorie
                    <input type="text" name="CategoryNew" placeholder="Nouvelle catégorie" value="<?php if (!empty($_POST['CategoryNew'])) { echo $_POST['CategoryNew']; } ?>">
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

          <h2>Aucune suppression n'est permise pour les catégories !</h2>
          <h3>Cette donnée est indispensable pour la gestion du stock et des produits !</h3>

        </div>
    </body>
</html>
