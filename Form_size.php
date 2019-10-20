<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!--<meta http-equiv="refresh" content="100">  -->

  <title>Chaustore - Back-office - Size</title>
  <link rel="stylesheet" type="text/css" href="styles2.css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
  <h1>Size</h1>
  <nav>
    <ul>
      <li><a href="#1" title="Visualisation_Size"><i class="material-icons">tv</i> Visualisation</a></li>
      <li><a href="Creation_Size.php" title="Creation_Size"><i class="material-icons">add_circle_outline</i> Création</a></li>
    </ul>
  </nav>

  <!-- Visualisation -->
  <div class="conteneur">
    <h2 id="1" class="resultats">Visualisation Size</h2>

    <p><a href="index.php" target="_self" title="Accueil"><i class="material-icons">home</i></a> Récapitulatif des pointures <a href="#top" title="Haut de la page"><img src="images/chevron-up-box-outline24.png" alt="Haut de la page"/></a></p>
    <br/><input type="button" onclick='window.location.reload(false)' value="..: Réactualiser le tableau :.."/>
    <br/><br/><br/>
    <table width="76%">
      <thead>
        <tr>
          <th width="5%"># taille</th>
          <th width="35%">Pointure</th>
          <th width="5%">MAJ</th>
          <th width="5%">Suppr</th>
        </tr>
      </thead>
    </table>

    <div class="overflowTest">
      <table class="t01" width="50%">

      <?php

      $ok = "";
      //connexion à la base de données PHP_Form_Client
      require_once('connectFC.php');

      //affichage données réelles de la table stock
      $sql = 'select id as ID_Size, name as Taille from size order by ID_Size;';

      if($result = mysqli_query($conn, $sql)){
        if(mysqli_num_rows($result) > 0){

            echo "<tbody>";
            while($row = mysqli_fetch_array($result)){
              echo "<tr>";
              echo "<td width=\"5%\">" . $row['ID_Size'] . "</td>";
              echo "<td width=\"35%\">" . $row['Taille'] . "</td>";
              echo "<td width=\"5%\"><a href=\"Modification_Size.php?ID_Size=" . $row['ID_Size']. "&name=" . $row['Taille'] . "\"><i class=\"material-icons\">create</i></a></td>";
              echo "<td width=\"5%\"><a href=\"Suppr_Size.php?ID_Size=" . $row['ID_Size']. "&name=" . $row['Taille'] . "\"><i class=\"material-icons\">delete_outline</i></a></td>";
              echo "</tr>";
            }
            echo "</tbody>";

          echo "</table>";
          // Free result set
          mysqli_free_result($result);
        } else{
          echo "<p class='lead'><em>Aucun enregistrement trouvé.</em></p>";
        }
      } else{
        echo "ERREUR: Ne peut pas exécuter $sql. " . mysqli_error($conn);
      }

      // on ferme la connexion à la base
      require_once('disconnect.php');

      $ok = "<BR/>Les données 'Size' sont à jour.";
      echo '<p>'.$ok.'</p>';

      ?>
    </div>
  </div>

</body>
</html>
