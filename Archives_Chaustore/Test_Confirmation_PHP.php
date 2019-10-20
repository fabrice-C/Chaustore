<?php
if(isset($_POST['id'])) echo $_POST['id'];
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name=viewport content="width=device-width, initial-scale=1">
<title></title>
<meta name="Description" content = "">
</head>
<body>
<form action="#" method="post" onsubmit="if(confirm('Demande de confirmation pour la suppression de l\'item n°4')){return true;}else{return false;}">
<input type="hidden" name="id" value="4">
Item 4 <input type="submit" value="supprimer">
</form>
</body>
</html>
