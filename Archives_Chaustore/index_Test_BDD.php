
<?php

$link = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore');

if (!$link) {
    die('Erreur de connexion (' . mysqli_connect_errno() . ') '
            . mysqli_connect_error());
}

echo 'Succès... ' . mysqli_get_host_info($link) . "\n";

mysqli_close($link);


//affichage des tables de la base simplon_chaustore
$conn = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore'); //se connecter à son compte mysql ("localhost","utilisateur_sql","mot de passe")
//mysqli_select_db($conn,'simplon_chaustore'); //selectionner une database
mysqli_set_charset($conn,'utf8');

$sql = 'SHOW TABLES FROM simplon_chaustore;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}



//affichage détails champs de la table product
$sql = 'describe product;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}


//affichage détails champs de la table brand
$sql = 'describe brand;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}



//affichage détails champs de la table category
$sql = 'describe category;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}



//affichage détails champs de la table color
$sql = 'describe color;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}



//affichage détails champs de la table size
$sql = 'describe size;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}


//affichage détails champs de la table stock
$sql = 'describe stock;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}



//affichage détails avec cle etrangere de la table product
$sql = 'show create table product;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);;var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage détails avec cle etrangere de la table brand
$sql = 'show create table brand;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);;var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage détails avec cle etrangere de la table category
$sql = 'show create table category;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);;var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage détails avec cle etrangere de la table color
$sql = 'show create table color;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);;var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage détails avec cle etrangere de la table size
$sql = 'show create table size;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);;var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage détails avec cle etrangere de la table stock
$sql = 'show create table stock;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);;var_dump(count($result));
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//:::::    :::::   ::   ::  ::   ::  :::::::  :::::::   :::::
//::  ::  ::   ::  :::  ::  :::  ::  ::       ::       ::
//::  ::  ::   ::  :::: ::  :::: ::  :::::    :::::     ::::
//::  ::  ::   ::  :: ::::  :: ::::  ::       ::            ::
//:::::    :::::   ::  :::  ::  :::  :::::::  :::::::  ::::::

//affichage données réelles de la table product
$sql = 'select * from product;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}


//affichage données réelles de la table brand
$sql = 'select * from brand;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//ajout données réelles de la table brand
$sql = 'INSERT INTO brand VALUES (null,"Napapijri",null);';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql);


//affichage données réelles de la table brand
$sql = 'select * from brand;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage données réelles de la table category
$sql = 'select name from category order by id;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql);

while ($result = mysqli_fetch_row($req)) {
	//var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage données réelles de la table color
$sql = 'select * from color;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage données réelles de la table size
$sql = 'select * from size;';
echo "<br>";var_dump($sql);echo "<br>";
$req = mysqli_query($conn, $sql); //, MYSQLI_USE_RESULT

while ($result = mysqli_fetch_row($req)) {
	var_dump($result);
  for ($i=0; $i < count($result) ; $i++) {
    echo ($result[$i]." ");
  }
  echo "<br>";
}

//affichage données réelles de la table stock
$sql = 'select * from stock;';
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
?>
