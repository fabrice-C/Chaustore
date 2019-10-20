<?php
//connexion à la base de données
require('connectFC.php');

// Requête SQL pour marque
$sql = 'SELECT id as ID_Brand, name as Marque FROM brand ORDER BY ID_Brand ASC;';

if($result = mysqli_query($conn, $sql)){

  if(mysqli_num_rows($result) > 0){

      while($row = mysqli_fetch_array($result)){
        // Construction de la chaîne de caractères qui fait la // liste

        $ld = "<SELECT NAME='lstMarque' id='Marques'>";
        $ld .= "<OPTION VALUE=0>Choisissez</OPTION>";
        //boucle sur la table
        while ( $row = mysqli_fetch_array($result)) {

            $Brand_ID = $row["ID_Brand"];
            $Brand = $row["Marque"];
            $ld .= "<OPTION VALUE='$Brand_ID'>$Brand</OPTION>";
        }
        $ld .= "</SELECT>";
      }
  }
}

// on ferme la connexion à la base
require_once('disconnect.php');
?>
<form method="post" action="traitement.php">

   <fieldset>
     <legend>Liste Marques</legend> <!-- Titre du fieldset -->


     <label for="Marques">Quelle marque pour ce produit ?</label><br />
     <?php echo "$ld"; ?>

       <label for="nom">Quel est votre nom ?</label>
       <input type="text" name="nom" id="nom" />

       <label for="prenom">Quel est votre prénom ?</label>
       <input type="text" name="prenom" id="prenom" />
 
       <label for="email">Quel est votre e-mail ?</label>
       <input type="email" name="email" id="email" />

   </fieldset>

   <fieldset>
       <legend>Votre souhait</legend> <!-- Titre du fieldset -->

       <p>
           Faites un souhait que vous voudriez voir exaucé :

           <input type="radio" name="souhait" value="riche" id="riche" /> <label for="riche">Etre riche</label>
           <input type="radio" name="souhait" value="celebre" id="celebre" /> <label for="celebre">Etre célèbre</label>
           <input type="radio" name="souhait" value="intelligent" id="intelligent" /> <label for="intelligent">Etre <strong>encore</strong> plus intelligent</label>
           <input type="radio" name="souhait" value="autre" id="autre" /> <label for="autre">Autre...</label>
       </p>

       <p>
           <label for="precisions">Si "Autre", veuillez préciser :</label>
           <textarea name="precisions" id="precisions" cols="40" rows="4"></textarea>
       </p>
   </fieldset>
</form>
