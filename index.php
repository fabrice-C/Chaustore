<!DOCTYPE html>
<html lang="fr">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">

      <title>Chaustore - Back-office</title>
      <link rel="stylesheet" type="text/css" href="stylesBO.css"/>
    </head>
    <body>
      <h1>Back-office CHAUSTORE</h1>
      <ul id="nav" class="drop">
        <li><a href="#">Accueil</a></li>

        <li><a href="#">Mises à jour Tables</a>
          <ul>
            <li><a href="Form_stock.php" title="Stock">Stock</a></li>

            <li class="dir"><a href="Form_Product.php" title="Produits">Produits</a>
              <ul>
                <li><a href="Form_brand.php" title="Marque">Brand</a></li>
                <li><a href="Form_category.php" title="Catégorie">Category</a></li>
                <li><a href="Form_color.php" title="Couleur">Color</a></li>
                <li><a href="Form_size.php" title="Pointure">Size</a></li>
              </ul>
            </li>

          </ul>
        </li>

        <li>Statistiques
          <ul>
            <li class="dir"><a href="#">Produits</a>
              <ul>
                <li><a href="#">par marque et produits</a></li>
                <li><a href="#">par categorie et produits</a></li>
                <li><a href="#">par couleur et produits</a></li>
              </ul>
            </li>
            <li class="dir"><a href="#">Marques</a>
              <ul>
                <li><a href="#">Disponible</a></li>
                <li><a href="#">En RUPTURE</a></li>
                <li><a href="#">Inventaire</a></li>
                <li><a href="#">Estimation</a></li>
              </ul>
            </li>
            <li class="dir"><a href="#">Catégories</a>
              <ul>
                <li><a href="#">Disponible</a></li>
                <li><a href="#">En RUPTURE</a></li>
                <li><a href="#">Inventaire</a></li>
                <li><a href="#">Estimation</a></li>
              </ul>
            </li>
            <li class="dir"><a href="#">Stock</a>
              <ul>
                <li><a href="#">Disponible</a></li>
                <li><a href="#">En RUPTURE</a></li>
                <li><a href="#">Inventaire</a></li>
                <li><a href="#">Estimation</a></li>
              </ul>
            </li>
          </ul>
        </li>

      </ul>

    </body>
</html>
