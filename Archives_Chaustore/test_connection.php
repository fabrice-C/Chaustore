
<?php
$link = mysqli_connect('164.132.110.233', 'simplon', 'xCIwyTKo3)?(31;*', 'simplon_chaustore');

if (!$link) {
    die('Erreur de connexion (' . mysqli_connect_errno() . ') '
            . mysqli_connect_error());
}

echo 'Succès... ' . mysqli_get_host_info($link) . "\n";



mysqli_close($link);
?>
