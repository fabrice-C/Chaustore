<!DOCTYPE html>
<html>
    <head>
    <title>Chaustore - Back-office</title>
        <style>
            label { display: block; }
        </style>
    </head>
    <body>
        <h1>Contact form</h1>
        <?php
            $error = "";
            $ok = "";
            if (!empty($_POST)) {
                if (empty($_POST['firstname'])) {
                    $error .= "Your firstname is required.<br/>";
                }
                if (empty($_POST['lastname'])) {
                    $error .= "Your lastname is required.<br/>";
                }
                if (empty($_POST['email'])) {
                    $error .= "Your email is required.<br/>";
                }

                if (empty($error)) {
                  //connexion à la base de données PHP_Form_Client
                      $link = mysqli_connect('127.0.0.1', 'fabrice', 'Owaye!1965', 'PHP_Form_Client');

                      if (!$link) {
                          die('Erreur de connexion (' . mysqli_connect_errno() . ') '
                                  . mysqli_connect_error());
                      }

                      echo 'Succès... ' . mysqli_get_host_info($link) . "\n";

                      mysqli_close($link);
                      //affichage des tables de la base PHP_Form_Client
                      $conn = mysqli_connect('127.0.0.1', 'fabrice', 'Owaye!1965', 'PHP_Form_Client');
                      mysqli_set_charset($conn,'utf8');

                      $sql = 'SHOW TABLES FROM PHP_Form_Client;';
                      echo "<br>";var_dump($sql);echo "<br>";
                      $req = mysqli_query($conn, $sql);

                      while ($result = mysqli_fetch_row($req)) {
                        var_dump($result);var_dump(count($result));
                        for ($i=0; $i < count($result) ; $i++) {
                          echo ($result[$i]." ");
                        }
                        echo "<br>";
                      }

                      //récupérer les valeurs des champs du formulaire 'form_php_sql.php'
                      var_dump($_POST['firstname']);var_dump($_POST['lastname']);var_dump($_POST['email']);

                      //ajout données réelles de la table client
                      //$sql = "INSERT INTO client VALUES (null, '$_POST[firstname]', '$_POST[lastname]','$_POST[email]');";
                      //echo "<br>";var_dump($sql);echo "<br>";
                      //$req = mysqli_query($conn, $sql);

                      //ou avec initialisation de variables
                      $firstname = $_POST['firstname'];
                      $lastname = $_POST['lastname'];
                      $email = $_POST['email'];
                      $ok="";
                      //ajout données réelles de la table client
                      $sql = "INSERT INTO `client` VALUES (null, '".$firstname."', '".$lastname."', '".$email."');";
                      echo "<br>";var_dump($sql);echo "<br>";
                      $req = mysqli_query($conn, $sql);

                      if ($req) {
                        $ok="Félicitations ! vos informations ont été envoyées.";
                      }
                      else {
                        $ok="Attention ! quelque chose s'est mal passé...";
                      }
                      echo ($ok);

                      //affichage données réelles de la table client
                      $sql = 'select * from client;';
                      echo "<br>";var_dump($sql);echo "<br>";
                      $req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

                      while ($result = mysqli_fetch_row($req)) {
                      	var_dump($result);
                        for ($i=0; $i < count($result) ; $i++) {
                          echo ($result[$i]." ");
                        }
                        echo "<br>";
                      }

                      // on ferme la connexion à la base
                      mysqli_close($conn);

                    $ok = "Congratulations! Your informations have been sent.";
                }
            }
            echo '<p>'.$error.$ok.'</p>';
        ?>
        <?php if (empty($_POST) || !empty($error)) { ?>
        <form method="POST">
            <label>
                Your firstname
                <input type="text" name="firstname" value="<?php if (!empty($_POST['firstname'])) { echo $_POST['firstname']; } ?>">
            </label>
            <label>
                Your lastname
                <input type="text" name="lastname" value="<?php if (!empty($_POST['lastname'])) { echo $_POST['lastname']; } ?>">
            </label>
            <label>
                Your email
                <input type="text" name="email" value="<?php if (!empty($_POST['email'])) { echo $_POST['email']; } ?>">
            </label>
            <input type="submit" value="Send">
        </form>
        <?php } ?>
    </body>
</html>
