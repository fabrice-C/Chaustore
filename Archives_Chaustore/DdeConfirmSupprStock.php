<?php
    echo"<p>La ligne de stock va être supprimée définitivement et ne pourra pas être restaurée. Confirmez-vous la suppression ?</p>";
    echo"<a href=\"ConfirmSupprStock.php?ID_Prod=" . $row['ID_Prod'] . "&idTaille=" . $row['idTaille'] . "\"><input type=\"button\" value=\"...:: Suppression ligne de stock confirmée ::...\" /></a>";
    echo "<br/><br/><a href=\"Form_stock.php\"><input type=\"button\" value=\"...:: Récapitulatif Stock ::...\" /></a>";
    header("Location: Form_stock.php");
?>
