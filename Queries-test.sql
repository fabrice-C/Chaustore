/* Selection de toutes les couleurs avec ou sans produits (name) avec affichage de la couleur, du nom de produit si existe sinon null,
table principale Product et liées Color, right join
classée par couleur et produit */

select co.name as Couleur, p.name as Produit from product as p right join color as co on color_id=co.id order by Couleur, Produit;

/*
+------------+----------------------------------------------+
| Couleur    | Produit                                      |
+------------+----------------------------------------------+
| Beige      | Suttino Beige                                |
| Blanc      | All Star Dainty Canvas Ox W Blanc Optical    |
| Blanc      | Chuck Taylor All Star Hi M Blanc Optical     |
| Blanc      | Stan Smith Blanc Vert                        |
| Blanc      | Superstar Blanc Noir                         |
| Blanc      | Superstar W Blanc Noir                       |
| Blanc      | Wmns Air Huarache Run White White            |
| Blanc      | Wmns Classic Cortez Leather Blanc Rouge Bleu |
| Bleu       | Classic Cortez Nylon Obsidian White          |
| Bleu       | Southampton Bleu                             |
| Bleu       | Star Player Ev Canvas Ox M Marine Blanc      |
| Bleu       | Suede Classic+ Peacoat White                 |
| Bleu clair | NULL                                         |
| Gris       | Gazelle W Gris Blanc                         |
| Jaune      | NULL                                         |
| Marron     | Benino Gold                                  |
| Marron     | Nastie Bruciato                              |
| Marron     | Rilmot                                       |
| Marron     | Satingh Brown                                |
| Marron     | Stall Brown                                  |
| Noir       | Benino Black                                 |
| Noir       | Calla Rose Black                             |
| Noir       | Inof Vaqueta Noir                            |
| Noir       | Ipona Noir                                   |
| Noir       | Petunia Noir                                 |
| Noir       | Stan Smith Noir                              |
| Noir       | Suede Hyper Embelished Wn's Black White      |
| Noir       | Un Reisel Mara Black Leather                 |
| Orange     | NULL                                         |
| Rose       | Gazelle W Rose Blanc                         |
| Rose       | W996 Light Cashmere                          |
| Rouge      | Kaylin Alba Burgundy                         |
| Vert       | NULL                                         |
| Violet     | NULL                                         |
+------------+----------------------------------------------+
*/


/* Selection de tous les produits (name) avec ou sans couleurs (name) avec affichage du nom de produit et de la couleur, si existe sinon null,
table principale Product et liées Color, left join
classée par produit et couleur */

select p.name as Produit, co.name as Couleur from product as p left join color as co on color_id=co.id order by Produit, Couleur;

/*
+----------------------------------------------+---------+
| Produit                                      | Couleur |
+----------------------------------------------+---------+
| All Star Dainty Canvas Ox W Blanc Optical    | Blanc   |
| Benino Black                                 | Noir    |
| Benino Gold                                  | Marron  |
| Calla Rose Black                             | Noir    |
| Chuck Taylor All Star Hi M Blanc Optical     | Blanc   |
| Classic Cortez Nylon Obsidian White          | Bleu    |
| Gazelle W Gris Blanc                         | Gris    |
| Gazelle W Rose Blanc                         | Rose    |
| Inof Vaqueta Noir                            | Noir    |
| Ipona Noir                                   | Noir    |
| Kaylin Alba Burgundy                         | Rouge   |
| Nastie Bruciato                              | Marron  |
| Petunia Noir                                 | Noir    |
| Rilmot                                       | Marron  |
| Satingh Brown                                | Marron  |
| Southampton Bleu                             | Bleu    |
| Stall Brown                                  | Marron  |
| Stan Smith Blanc Vert                        | Blanc   |
| Stan Smith Noir                              | Noir    |
| Star Player Ev Canvas Ox M Marine Blanc      | Bleu    |
| Suede Classic+ Peacoat White                 | Bleu    |
| Suede Hyper Embelished Wn's Black White      | Noir    |
| Superstar Blanc Noir                         | Blanc   |
| Superstar W Blanc Noir                       | Blanc   |
| Suttino Beige                                | Beige   |
| Un Reisel Mara Black Leather                 | Noir    |
| W996 Light Cashmere                          | Rose    |
| Wmns Air Huarache Run White White            | Blanc   |
| Wmns Classic Cortez Leather Blanc Rouge Bleu | Blanc   |
+----------------------------------------------+---------+
*/



/* Selection des produits avec affichage des marques, catégories, couleurs, prix et genre
table principale Product et liées Marque, Category et Color
classée par Marque, Categorie, couleur et produit */

select p.id as ID_Prod, b.name as Marque, ca.name as Categorie, p.name as Produit, co.name as Couleur, p.price as Prix, p.gender as Genre from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id order by Marque, Categorie, Produit;

/*
+---------+---------------------+----------------------+----------------------------------------------+---------+--------+-------+
| ID_Prod | Marque              | Categorie            | Produit                                      | Couleur | Prix   | Genre |
+---------+---------------------+----------------------+----------------------------------------------+---------+--------+-------+
|      11 | Adidas              | Baskets              | Gazelle W Gris Blanc                         | Gris    |  94.99 | F     |
|       4 | Adidas              | Baskets              | Gazelle W Rose Blanc                         | Rose    |  99.99 | F     |
|      18 | Adidas              | Baskets              | Stan Smith Blanc Vert                        | Blanc   |  81.00 | H     |
|      17 | Adidas              | Baskets              | Stan Smith Noir                              | Noir    |  94.99 | H     |
|      19 | Adidas              | Baskets              | Superstar Blanc Noir                         | Blanc   |  99.99 | H     |
|       2 | Adidas              | Baskets              | Superstar W Blanc Noir                       | Blanc   |  99.99 | F     |
|       7 | Clarks              | Escarpins            | Calla Rose Black                             | Noir    |  99.95 | F     |
|       6 | Clarks              | Escarpins            | Kaylin Alba Burgundy                         | Rouge   |  99.95 | F     |
|      14 | Clarks Unstructured | Sandales et nu-pieds | Un Reisel Mara Black Leather                 | Noir    |  89.99 | F     |
|       1 | Converse            | Baskets              | All Star Dainty Canvas Ox W Blanc Optical    | Blanc   |  52.00 | F     |
|      21 | Converse            | Baskets              | Chuck Taylor All Star Hi M Blanc Optical     | Blanc   |  69.99 | M     |
|      22 | Converse            | Baskets              | Star Player Ev Canvas Ox M Marine Blanc      | Bleu    |  58.50 | H     |
|      12 | Georgia Rose        | Sandales et nu-pieds | Inof Vaqueta Noir                            | Noir    |  89.00 | F     |
|      13 | Georgia Rose        | Sandales et nu-pieds | Ipona Noir                                   | Noir    |  59.00 | F     |
|      16 | I Love Shoes        | Sandales et nu-pieds | Benino Black                                 | Noir    |  39.00 | F     |
|       9 | I Love Shoes        | Sandales et nu-pieds | Benino Gold                                  | Marron  |  39.00 | F     |
|       8 | Les P'tites Bombes  | Sandales et nu-pieds | Petunia Noir                                 | Noir    |  29.90 | F     |
|      24 | Marvin&Co           | Chaussures à lacets  | Satingh Brown                                | Marron  |  79.00 | H     |
|      26 | Marvin&Co           | Chaussures à lacets  | Suttino Beige                                | Beige   |  79.00 | H     |
|      27 | Mr SARENZA          | Chaussures à lacets  | Nastie Bruciato                              | Marron  | 149.00 | H     |
|      29 | Mr SARENZA          | Chaussures à lacets  | Rilmot                                       | Marron  |  99.00 | H     |
|      25 | Mr SARENZA          | Chaussures à lacets  | Southampton Bleu                             | Bleu    | 109.00 | H     |
|      28 | Mr SARENZA          | Chaussures à lacets  | Stall Brown                                  | Marron  | 119.00 | H     |
|      10 | New Balance         | Baskets              | W996 Light Cashmere                          | Rose    |  70.00 | F     |
|      23 | Nike                | Baskets              | Classic Cortez Nylon Obsidian White          | Bleu    |  80.00 | H     |
|       3 | Nike                | Baskets              | Wmns Air Huarache Run White White            | Blanc   | 119.99 | F     |
|       5 | Nike                | Baskets              | Wmns Classic Cortez Leather Blanc Rouge Bleu | Blanc   |  85.00 | F     |
|      20 | Puma                | Baskets              | Suede Classic+ Peacoat White                 | Bleu    |  80.00 | H     |
|      15 | Puma                | Baskets              | Suede Hyper Embelished Wn's Black White      | Noir    |  90.00 | F     |
+---------+---------------------+----------------------+----------------------------------------------+---------+--------+-------+
*/


/* Selection des produits par genre (F ou H), marques, prix et genre
table principale Product et liées Marque
classée par Genre, Marque, catégorie et produit */

select p.gender as Genre, p.id as ID_Prod, b.name as Marque, ca.name as Categorie, p.name as Produit, co.name as Couleur, p.price as Prix from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id order by Genre, Marque, Categorie, Produit;

/*
+-------+---------+---------------------+----------------------+----------------------------------------------+---------+--------+
| Genre | ID_Prod | Marque              | Categorie            | Produit                                      | Couleur | Prix   |
+-------+---------+---------------------+----------------------+----------------------------------------------+---------+--------+
| F     |      11 | Adidas              | Baskets              | Gazelle W Gris Blanc                         | Gris    |  94.99 |
| F     |       4 | Adidas              | Baskets              | Gazelle W Rose Blanc                         | Rose    |  99.99 |
| F     |       2 | Adidas              | Baskets              | Superstar W Blanc Noir                       | Blanc   |  99.99 |
| F     |       7 | Clarks              | Escarpins            | Calla Rose Black                             | Noir    |  99.95 |
| F     |       6 | Clarks              | Escarpins            | Kaylin Alba Burgundy                         | Rouge   |  99.95 |
| F     |      14 | Clarks Unstructured | Sandales et nu-pieds | Un Reisel Mara Black Leather                 | Noir    |  89.99 |
| F     |       1 | Converse            | Baskets              | All Star Dainty Canvas Ox W Blanc Optical    | Blanc   |  52.00 |
| F     |      12 | Georgia Rose        | Sandales et nu-pieds | Inof Vaqueta Noir                            | Noir    |  89.00 |
| F     |      13 | Georgia Rose        | Sandales et nu-pieds | Ipona Noir                                   | Noir    |  59.00 |
| F     |      16 | I Love Shoes        | Sandales et nu-pieds | Benino Black                                 | Noir    |  39.00 |
| F     |       9 | I Love Shoes        | Sandales et nu-pieds | Benino Gold                                  | Marron  |  39.00 |
| F     |       8 | Les P'tites Bombes  | Sandales et nu-pieds | Petunia Noir                                 | Noir    |  29.90 |
| F     |      10 | New Balance         | Baskets              | W996 Light Cashmere                          | Rose    |  70.00 |
| F     |       3 | Nike                | Baskets              | Wmns Air Huarache Run White White            | Blanc   | 119.99 |
| F     |       5 | Nike                | Baskets              | Wmns Classic Cortez Leather Blanc Rouge Bleu | Blanc   |  85.00 |
| F     |      15 | Puma                | Baskets              | Suede Hyper Embelished Wn's Black White      | Noir    |  90.00 |
| H     |      18 | Adidas              | Baskets              | Stan Smith Blanc Vert                        | Blanc   |  81.00 |
| H     |      17 | Adidas              | Baskets              | Stan Smith Noir                              | Noir    |  94.99 |
| H     |      19 | Adidas              | Baskets              | Superstar Blanc Noir                         | Blanc   |  99.99 |
| H     |      22 | Converse            | Baskets              | Star Player Ev Canvas Ox M Marine Blanc      | Bleu    |  58.50 |
| H     |      24 | Marvin&Co           | Chaussures à lacets  | Satingh Brown                                | Marron  |  79.00 |
| H     |      26 | Marvin&Co           | Chaussures à lacets  | Suttino Beige                                | Beige   |  79.00 |
| H     |      27 | Mr SARENZA          | Chaussures à lacets  | Nastie Bruciato                              | Marron  | 149.00 |
| H     |      29 | Mr SARENZA          | Chaussures à lacets  | Rilmot                                       | Marron  |  99.00 |
| H     |      25 | Mr SARENZA          | Chaussures à lacets  | Southampton Bleu                             | Bleu    | 109.00 |
| H     |      28 | Mr SARENZA          | Chaussures à lacets  | Stall Brown                                  | Marron  | 119.00 |
| H     |      23 | Nike                | Baskets              | Classic Cortez Nylon Obsidian White          | Bleu    |  80.00 |
| H     |      20 | Puma                | Baskets              | Suede Classic+ Peacoat White                 | Bleu    |  80.00 |
| M     |      21 | Converse            | Baskets              | Chuck Taylor All Star Hi M Blanc Optical     | Blanc   |  69.99 |
+-------+---------+---------------------+----------------------+----------------------------------------------+---------+--------+
*/


/* Selection des produits par genre (F ou H), marques, prix et genre
table principale Product et liées Marque
classée par Genre, Marque, catégorie et produit */

select case p.gender
when "F" then "Femme"
else "Homme"
end as Genre, p.id as ID_Prod, b.name as Marque, ca.name as Categorie, p.name as Produit, co.name as Couleur, p.price as Prix from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id order by Genre, Marque, Categorie, Produit;


/*
+-------+---------+---------------------+----------------------+----------------------------------------------+---------+--------+
| Genre | ID_Prod | Marque              | Categorie            | Produit                                      | Couleur | Prix   |
+-------+---------+---------------------+----------------------+----------------------------------------------+---------+--------+
| Femme |      11 | Adidas              | Baskets              | Gazelle W Gris Blanc                         | Gris    |  94.99 |
| Femme |       4 | Adidas              | Baskets              | Gazelle W Rose Blanc                         | Rose    |  99.99 |
| Femme |       2 | Adidas              | Baskets              | Superstar W Blanc Noir                       | Blanc   |  99.99 |
| Femme |       7 | Clarks              | Escarpins            | Calla Rose Black                             | Noir    |  99.95 |
| Femme |       6 | Clarks              | Escarpins            | Kaylin Alba Burgundy                         | Rouge   |  99.95 |
| Femme |      14 | Clarks Unstructured | Sandales et nu-pieds | Un Reisel Mara Black Leather                 | Noir    |  89.99 |
| Femme |       1 | Converse            | Baskets              | All Star Dainty Canvas Ox W Blanc Optical    | Blanc   |  52.00 |
| Femme |      12 | Georgia Rose        | Sandales et nu-pieds | Inof Vaqueta Noir                            | Noir    |  89.00 |
| Femme |      13 | Georgia Rose        | Sandales et nu-pieds | Ipona Noir                                   | Noir    |  59.00 |
| Femme |      16 | I Love Shoes        | Sandales et nu-pieds | Benino Black                                 | Noir    |  39.00 |
| Femme |       9 | I Love Shoes        | Sandales et nu-pieds | Benino Gold                                  | Marron  |  39.00 |
| Femme |       8 | Les P'tites Bombes  | Sandales et nu-pieds | Petunia Noir                                 | Noir    |  29.90 |
| Femme |      10 | New Balance         | Baskets              | W996 Light Cashmere                          | Rose    |  70.00 |
| Femme |       3 | Nike                | Baskets              | Wmns Air Huarache Run White White            | Blanc   | 119.99 |
| Femme |       5 | Nike                | Baskets              | Wmns Classic Cortez Leather Blanc Rouge Bleu | Blanc   |  85.00 |
| Femme |      15 | Puma                | Baskets              | Suede Hyper Embelished Wn's Black White      | Noir    |  90.00 |
| Homme |      18 | Adidas              | Baskets              | Stan Smith Blanc Vert                        | Blanc   |  81.00 |
| Homme |      17 | Adidas              | Baskets              | Stan Smith Noir                              | Noir    |  94.99 |
| Homme |      19 | Adidas              | Baskets              | Superstar Blanc Noir                         | Blanc   |  99.99 |
| Homme |      21 | Converse            | Baskets              | Chuck Taylor All Star Hi M Blanc Optical     | Blanc   |  69.99 |
| Homme |      22 | Converse            | Baskets              | Star Player Ev Canvas Ox M Marine Blanc      | Bleu    |  58.50 |
| Homme |      24 | Marvin&Co           | Chaussures à lacets  | Satingh Brown                                | Marron  |  79.00 |
| Homme |      26 | Marvin&Co           | Chaussures à lacets  | Suttino Beige                                | Beige   |  79.00 |
| Homme |      27 | Mr SARENZA          | Chaussures à lacets  | Nastie Bruciato                              | Marron  | 149.00 |
| Homme |      29 | Mr SARENZA          | Chaussures à lacets  | Rilmot                                       | Marron  |  99.00 |
| Homme |      25 | Mr SARENZA          | Chaussures à lacets  | Southampton Bleu                             | Bleu    | 109.00 |
| Homme |      28 | Mr SARENZA          | Chaussures à lacets  | Stall Brown                                  | Marron  | 119.00 |
| Homme |      23 | Nike                | Baskets              | Classic Cortez Nylon Obsidian White          | Bleu    |  80.00 |
| Homme |      20 | Puma                | Baskets              | Suede Classic+ Peacoat White                 | Bleu    |  80.00 |
+-------+---------+---------------------+----------------------+----------------------------------------------+---------+--------+
*/


/* Selection des produits par marques, prix et genre
table principale Product et liées Marque
classée par Marque et produit */

select p.id as ID_Prod, b.name as Marque, p.name as Produit, p.price as Prix, p.gender as Genre from product as p inner join brand as b on brand_id = b.id order by Marque, Produit;

/*
+---------+---------------------+----------------------------------------------+--------+-------+
| ID_Prod | Marque              | Produit                                      | Prix   | Genre |
+---------+---------------------+----------------------------------------------+--------+-------+
|      11 | Adidas              | Gazelle W Gris Blanc                         |  94.99 | F     |
|       4 | Adidas              | Gazelle W Rose Blanc                         |  99.99 | F     |
|      18 | Adidas              | Stan Smith Blanc Vert                        |  81.00 | H     |
|      17 | Adidas              | Stan Smith Noir                              |  94.99 | H     |
|      19 | Adidas              | Superstar Blanc Noir                         |  99.99 | H     |
|       2 | Adidas              | Superstar W Blanc Noir                       |  99.99 | F     |
|       7 | Clarks              | Calla Rose Black                             |  99.95 | F     |
|       6 | Clarks              | Kaylin Alba Burgundy                         |  99.95 | F     |
|      14 | Clarks Unstructured | Un Reisel Mara Black Leather                 |  89.99 | F     |
|       1 | Converse            | All Star Dainty Canvas Ox W Blanc Optical    |  52.00 | F     |
|      21 | Converse            | Chuck Taylor All Star Hi M Blanc Optical     |  69.99 | M     |
|      22 | Converse            | Star Player Ev Canvas Ox M Marine Blanc      |  58.50 | H     |
|      12 | Georgia Rose        | Inof Vaqueta Noir                            |  89.00 | F     |
|      13 | Georgia Rose        | Ipona Noir                                   |  59.00 | F     |
|      16 | I Love Shoes        | Benino Black                                 |  39.00 | F     |
|       9 | I Love Shoes        | Benino Gold                                  |  39.00 | F     |
|       8 | Les P'tites Bombes  | Petunia Noir                                 |  29.90 | F     |
|      24 | Marvin&Co           | Satingh Brown                                |  79.00 | H     |
|      26 | Marvin&Co           | Suttino Beige                                |  79.00 | H     |
|      27 | Mr SARENZA          | Nastie Bruciato                              | 149.00 | H     |
|      29 | Mr SARENZA          | Rilmot                                       |  99.00 | H     |
|      25 | Mr SARENZA          | Southampton Bleu                             | 109.00 | H     |
|      28 | Mr SARENZA          | Stall Brown                                  | 119.00 | H     |
|      10 | New Balance         | W996 Light Cashmere                          |  70.00 | F     |
|      23 | Nike                | Classic Cortez Nylon Obsidian White          |  80.00 | H     |
|       3 | Nike                | Wmns Air Huarache Run White White            | 119.99 | F     |
|       5 | Nike                | Wmns Classic Cortez Leather Blanc Rouge Bleu |  85.00 | F     |
|      20 | Puma                | Suede Classic+ Peacoat White                 |  80.00 | H     |
|      15 | Puma                | Suede Hyper Embelished Wn's Black White      |  90.00 | F     |
+---------+---------------------+----------------------------------------------+--------+-------+
29 rows in set (0.00 sec)
*/


/* Selection des produits par marques, catégories, prix et genre
table principale Product et liées Marque, category
classée par Marque, categorie et produit */

select p.id as ID_Prod, b.name as Marque, ca.name as Categorie, p.name as Produit, p.price as Prix, p.gender as Genre from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id order by Marque, Categorie, Produit;

/*
+---------+---------------------+----------------------+----------------------------------------------+--------+-------+
| ID_Prod | Marque              | Categorie            | Produit                                      | Prix   | Genre |
+---------+---------------------+----------------------+----------------------------------------------+--------+-------+
|      11 | Adidas              | Baskets              | Gazelle W Gris Blanc                         |  94.99 | F     |
|       4 | Adidas              | Baskets              | Gazelle W Rose Blanc                         |  99.99 | F     |
|      18 | Adidas              | Baskets              | Stan Smith Blanc Vert                        |  81.00 | H     |
|      17 | Adidas              | Baskets              | Stan Smith Noir                              |  94.99 | H     |
|      19 | Adidas              | Baskets              | Superstar Blanc Noir                         |  99.99 | H     |
|       2 | Adidas              | Baskets              | Superstar W Blanc Noir                       |  99.99 | F     |
|       7 | Clarks              | Escarpins            | Calla Rose Black                             |  99.95 | F     |
|       6 | Clarks              | Escarpins            | Kaylin Alba Burgundy                         |  99.95 | F     |
|      14 | Clarks Unstructured | Sandales et nu-pieds | Un Reisel Mara Black Leather                 |  89.99 | F     |
|       1 | Converse            | Baskets              | All Star Dainty Canvas Ox W Blanc Optical    |  52.00 | F     |
|      21 | Converse            | Baskets              | Chuck Taylor All Star Hi M Blanc Optical     |  69.99 | M     |
|      22 | Converse            | Baskets              | Star Player Ev Canvas Ox M Marine Blanc      |  58.50 | H     |
|      12 | Georgia Rose        | Sandales et nu-pieds | Inof Vaqueta Noir                            |  89.00 | F     |
|      13 | Georgia Rose        | Sandales et nu-pieds | Ipona Noir                                   |  59.00 | F     |
|      16 | I Love Shoes        | Sandales et nu-pieds | Benino Black                                 |  39.00 | F     |
|       9 | I Love Shoes        | Sandales et nu-pieds | Benino Gold                                  |  39.00 | F     |
|       8 | Les P'tites Bombes  | Sandales et nu-pieds | Petunia Noir                                 |  29.90 | F     |
|      24 | Marvin&Co           | Chaussures à lacets  | Satingh Brown                                |  79.00 | H     |
|      26 | Marvin&Co           | Chaussures à lacets  | Suttino Beige                                |  79.00 | H     |
|      27 | Mr SARENZA          | Chaussures à lacets  | Nastie Bruciato                              | 149.00 | H     |
|      29 | Mr SARENZA          | Chaussures à lacets  | Rilmot                                       |  99.00 | H     |
|      25 | Mr SARENZA          | Chaussures à lacets  | Southampton Bleu                             | 109.00 | H     |
|      28 | Mr SARENZA          | Chaussures à lacets  | Stall Brown                                  | 119.00 | H     |
|      10 | New Balance         | Baskets              | W996 Light Cashmere                          |  70.00 | F     |
|      23 | Nike                | Baskets              | Classic Cortez Nylon Obsidian White          |  80.00 | H     |
|       3 | Nike                | Baskets              | Wmns Air Huarache Run White White            | 119.99 | F     |
|       5 | Nike                | Baskets              | Wmns Classic Cortez Leather Blanc Rouge Bleu |  85.00 | F     |
|      20 | Puma                | Baskets              | Suede Classic+ Peacoat White                 |  80.00 | H     |
|      15 | Puma                | Baskets              | Suede Hyper Embelished Wn's Black White      |  90.00 | F     |
+---------+---------------------+----------------------+----------------------------------------------+--------+-------+
29 rows in set (0.02 sec)
*/


/* Selection des produits par category, prix et genre
table principale Product et liées Category
classée par category et produit */

select p.id as ID_Prod, ca.name as Categorie, p.name as Produit, p.price as Prix, p.gender as Genre from product as p inner join category as ca on category_id=ca.id order by Categorie, Produit;

/*
+---------+----------------------+----------------------------------------------+--------+-------+
| ID_Prod | Categorie            | Produit                                      | Prix   | Genre |
+---------+----------------------+----------------------------------------------+--------+-------+
|       1 | Baskets              | All Star Dainty Canvas Ox W Blanc Optical    |  52.00 | F     |
|      21 | Baskets              | Chuck Taylor All Star Hi M Blanc Optical     |  69.99 | M     |
|      23 | Baskets              | Classic Cortez Nylon Obsidian White          |  80.00 | H     |
|      11 | Baskets              | Gazelle W Gris Blanc                         |  94.99 | F     |
|       4 | Baskets              | Gazelle W Rose Blanc                         |  99.99 | F     |
|      18 | Baskets              | Stan Smith Blanc Vert                        |  81.00 | H     |
|      17 | Baskets              | Stan Smith Noir                              |  94.99 | H     |
|      22 | Baskets              | Star Player Ev Canvas Ox M Marine Blanc      |  58.50 | H     |
|      20 | Baskets              | Suede Classic+ Peacoat White                 |  80.00 | H     |
|      15 | Baskets              | Suede Hyper Embelished Wn's Black White      |  90.00 | F     |
|      19 | Baskets              | Superstar Blanc Noir                         |  99.99 | H     |
|       2 | Baskets              | Superstar W Blanc Noir                       |  99.99 | F     |
|      10 | Baskets              | W996 Light Cashmere                          |  70.00 | F     |
|       3 | Baskets              | Wmns Air Huarache Run White White            | 119.99 | F     |
|       5 | Baskets              | Wmns Classic Cortez Leather Blanc Rouge Bleu |  85.00 | F     |
|      27 | Chaussures à lacets  | Nastie Bruciato                              | 149.00 | H     |
|      29 | Chaussures à lacets  | Rilmot                                       |  99.00 | H     |
|      24 | Chaussures à lacets  | Satingh Brown                                |  79.00 | H     |
|      25 | Chaussures à lacets  | Southampton Bleu                             | 109.00 | H     |
|      28 | Chaussures à lacets  | Stall Brown                                  | 119.00 | H     |
|      26 | Chaussures à lacets  | Suttino Beige                                |  79.00 | H     |
|       7 | Escarpins            | Calla Rose Black                             |  99.95 | F     |
|       6 | Escarpins            | Kaylin Alba Burgundy                         |  99.95 | F     |
|      16 | Sandales et nu-pieds | Benino Black                                 |  39.00 | F     |
|       9 | Sandales et nu-pieds | Benino Gold                                  |  39.00 | F     |
|      12 | Sandales et nu-pieds | Inof Vaqueta Noir                            |  89.00 | F     |
|      13 | Sandales et nu-pieds | Ipona Noir                                   |  59.00 | F     |
|       8 | Sandales et nu-pieds | Petunia Noir                                 |  29.90 | F     |
|      14 | Sandales et nu-pieds | Un Reisel Mara Black Leather                 |  89.99 | F     |
+---------+----------------------+----------------------------------------------+--------+-------+
29 rows in set (0.00 sec)
*/


/* Selection des produits par couleur, prix et genre
table principale Product et liées Color
classée par couleur et produit */

select p.id as ID_Prod, co.name as Couleur, p.name as Produit, p.price as Prix, p.gender as Genre from product as p inner join color as co on color_id=co.id order by Couleur, Produit;

/*
+---------+---------+----------------------------------------------+--------+-------+
| ID_Prod | Couleur | Produit                                      | Prix   | Genre |
+---------+---------+----------------------------------------------+--------+-------+
|      26 | Beige   | Suttino Beige                                |  79.00 | H     |
|       1 | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |  52.00 | F     |
|      21 | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |  69.99 | M     |
|      18 | Blanc   | Stan Smith Blanc Vert                        |  81.00 | H     |
|      19 | Blanc   | Superstar Blanc Noir                         |  99.99 | H     |
|       2 | Blanc   | Superstar W Blanc Noir                       |  99.99 | F     |
|       3 | Blanc   | Wmns Air Huarache Run White White            | 119.99 | F     |
|       5 | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |  85.00 | F     |
|      23 | Bleu    | Classic Cortez Nylon Obsidian White          |  80.00 | H     |
|      25 | Bleu    | Southampton Bleu                             | 109.00 | H     |
|      22 | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |  58.50 | H     |
|      20 | Bleu    | Suede Classic+ Peacoat White                 |  80.00 | H     |
|      11 | Gris    | Gazelle W Gris Blanc                         |  94.99 | F     |
|       9 | Marron  | Benino Gold                                  |  39.00 | F     |
|      27 | Marron  | Nastie Bruciato                              | 149.00 | H     |
|      29 | Marron  | Rilmot                                       |  99.00 | H     |
|      24 | Marron  | Satingh Brown                                |  79.00 | H     |
|      28 | Marron  | Stall Brown                                  | 119.00 | H     |
|      16 | Noir    | Benino Black                                 |  39.00 | F     |
|       7 | Noir    | Calla Rose Black                             |  99.95 | F     |
|      12 | Noir    | Inof Vaqueta Noir                            |  89.00 | F     |
|      13 | Noir    | Ipona Noir                                   |  59.00 | F     |
|       8 | Noir    | Petunia Noir                                 |  29.90 | F     |
|      17 | Noir    | Stan Smith Noir                              |  94.99 | H     |
|      15 | Noir    | Suede Hyper Embelished Wn's Black White      |  90.00 | F     |
|      14 | Noir    | Un Reisel Mara Black Leather                 |  89.99 | F     |
|       4 | Rose    | Gazelle W Rose Blanc                         |  99.99 | F     |
|      10 | Rose    | W996 Light Cashmere                          |  70.00 | F     |
|       6 | Rouge   | Kaylin Alba Burgundy                         |  99.95 | F     |
+---------+---------+----------------------------------------------+--------+-------+
29 rows in set (0.00 sec)
*/



/* Selection des articles en stock avec pointure
Tables Product, Pointure et Stock
Classé par Produit */

/*
mysql> describe product;
+-------------+-----------------------+------+-----+---------+----------------+
| Field       | Type                  | Null | Key | Default | Extra          |
+-------------+-----------------------+------+-----+---------+----------------+
| id          | int(11) unsigned      | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255)          | NO   | MUL |         |                |
| category_id | int(11) unsigned      | NO   | MUL | NULL    |                |
| brand_id    | int(11) unsigned      | NO   | MUL | NULL    |                |
| color_id    | int(11) unsigned      | NO   | MUL | NULL    |                |
| image       | varchar(255)          | YES  |     |         |                |
| price       | decimal(5,2) unsigned | NO   |     | 0.00    |                |
| gender      | char(1)               | NO   |     | M       |                |
+-------------+-----------------------+------+-----+---------+----------------+

mysql> describe stock;
+------------+------------------+------+-----+---------+-------+
| Field      | Type             | Null | Key | Default | Extra |
+------------+------------------+------+-----+---------+-------+
| product_id | int(11) unsigned | NO   | PRI | NULL    |       |
| size_id    | int(11) unsigned | NO   | PRI | NULL    |       |
| stock      | int(10) unsigned | NO   |     | 0       |       |
+------------+------------------+------+-----+---------+-------+

mysql> describe size;
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(15)      | NO   | UNI |         |                |
+-------+------------------+------+-----+---------+----------------+


Affichage des quantités en stock par produit et par taille*/
select p.id as ID_Prod, p.name as Produit, si.name as Taille, st.stock as Qt_Stock, p.price as Prix from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id order by Produit, Taille;

/* 392 lignes produits
+---------+----------------------------------------------+--------+----------+--------+
| ID_Prod | Produit                                      | Taille | Qt_Stock | Prix   |
+---------+----------------------------------------------+--------+----------+--------+
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 35 1/2 |        2 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 36     |        8 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 36 1/2 |        0 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 37     |        9 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 38     |        4 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 38 1/2 |        8 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 39 1/2 |        3 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 40     |       10 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 40 1/2 |        8 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 41     |        0 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 41 1/2 |        5 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 42     |        5 |  52.00 |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 42 1/2 |        3 |  52.00 |
|      16 | Benino Black                                 | 36     |        8 |  39.00 |
|      16 | Benino Black                                 | 37 1/2 |        7 |  39.00 |
|      16 | Benino Black                                 | 38     |        3 |  39.00 |
|      16 | Benino Black                                 | 39     |        6 |  39.00 |
|      16 | Benino Black                                 | 39 1/2 |        4 |  39.00 |
|      16 | Benino Black                                 | 40     |        5 |  39.00 |
|      16 | Benino Black                                 | 40 1/2 |        5 |  39.00 |
|      16 | Benino Black                                 | 41     |        9 |  39.00 |
|      16 | Benino Black                                 | 42     |        8 |  39.00 |
|       9 | Benino Gold                                  | 35 1/2 |        0 |  39.00 |
|       9 | Benino Gold                                  | 36     |        2 |  39.00 |
|       9 | Benino Gold                                  | 36 1/2 |        8 |  39.00 |
|       9 | Benino Gold                                  | 37 1/2 |        3 |  39.00 |
|       9 | Benino Gold                                  | 38 1/2 |        9 |  39.00 |
|       9 | Benino Gold                                  | 39     |        9 |  39.00 |
|       9 | Benino Gold                                  | 39 1/2 |        9 |  39.00 |
|       9 | Benino Gold                                  | 40     |        2 |  39.00 |
|       9 | Benino Gold                                  | 40 1/2 |        1 |  39.00 |
|       9 | Benino Gold                                  | 41 1/2 |        1 |  39.00 |
|       9 | Benino Gold                                  | 42     |        0 |  39.00 |
|       9 | Benino Gold                                  | 42 1/2 |        8 |  39.00 |
|       7 | Calla Rose Black                             | 35 1/2 |        3 |  99.95 |
|       7 | Calla Rose Black                             | 36     |        2 |  99.95 |
|       7 | Calla Rose Black                             | 36 1/2 |        5 |  99.95 |
|       7 | Calla Rose Black                             | 37     |        5 |  99.95 |
|       7 | Calla Rose Black                             | 37 1/2 |        6 |  99.95 |
|       7 | Calla Rose Black                             | 38     |        0 |  99.95 |
|       7 | Calla Rose Black                             | 38 1/2 |        6 |  99.95 |
|       7 | Calla Rose Black                             | 39     |        2 |  99.95 |
|       7 | Calla Rose Black                             | 41     |        8 |  99.95 |
|       7 | Calla Rose Black                             | 42 1/2 |        1 |  99.95 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 39     |        1 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 40     |       10 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 40 1/2 |        4 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 41     |        2 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 41 1/2 |        7 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 42 1/2 |        4 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 43     |        9 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 43 1/2 |        4 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 44     |        1 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 44 1/2 |        1 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 45     |        7 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 45 1/2 |        9 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 46 1/2 |        2 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 47 1/2 |        8 |  69.99 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 48     |       10 |  69.99 |
|      23 | Classic Cortez Nylon Obsidian White          | 38     |        3 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 38 1/2 |        8 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 39     |        3 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 40 1/2 |        7 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 41     |        1 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 41 1/2 |        8 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 42 1/2 |        7 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 43     |        5 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 43 1/2 |        2 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 45     |        7 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 45 1/2 |        0 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 46     |        3 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 46 1/2 |        6 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 47     |        9 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 47 1/2 |        0 |  80.00 |
|      23 | Classic Cortez Nylon Obsidian White          | 48     |        7 |  80.00 |
|      11 | Gazelle W Gris Blanc                         | 35 1/2 |        8 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 36     |        5 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 36 1/2 |        4 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 38 1/2 |        3 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 39 1/2 |       10 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 40     |        2 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 40 1/2 |        6 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 41 1/2 |        7 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 42     |       10 |  94.99 |
|      11 | Gazelle W Gris Blanc                         | 42 1/2 |        0 |  94.99 |
|       4 | Gazelle W Rose Blanc                         | 35     |        6 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 35 1/2 |        7 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 36 1/2 |        8 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 37 1/2 |       10 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 38 1/2 |        5 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 39     |        5 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 39 1/2 |        3 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 40     |        2 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 40 1/2 |        9 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 42     |        6 |  99.99 |
|       4 | Gazelle W Rose Blanc                         | 42 1/2 |        8 |  99.99 |
|      12 | Inof Vaqueta Noir                            | 35     |        6 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 35 1/2 |        7 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 36     |        8 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 37     |        4 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 38     |        9 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 38 1/2 |        2 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 39     |        9 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 39 1/2 |        2 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 40     |        4 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 40 1/2 |        3 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 41     |        5 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 41 1/2 |        4 |  89.00 |
|      12 | Inof Vaqueta Noir                            | 42     |        9 |  89.00 |
|      13 | Ipona Noir                                   | 35 1/2 |        6 |  59.00 |
|      13 | Ipona Noir                                   | 36     |        9 |  59.00 |
|      13 | Ipona Noir                                   | 36 1/2 |        8 |  59.00 |
|      13 | Ipona Noir                                   | 38     |        2 |  59.00 |
|      13 | Ipona Noir                                   | 38 1/2 |        4 |  59.00 |
|      13 | Ipona Noir                                   | 39     |        3 |  59.00 |
|      13 | Ipona Noir                                   | 39 1/2 |       10 |  59.00 |
|      13 | Ipona Noir                                   | 40     |        0 |  59.00 |
|      13 | Ipona Noir                                   | 40 1/2 |        4 |  59.00 |
|      13 | Ipona Noir                                   | 41     |        8 |  59.00 |
|      13 | Ipona Noir                                   | 41 1/2 |        4 |  59.00 |
|      13 | Ipona Noir                                   | 42     |        9 |  59.00 |
|       6 | Kaylin Alba Burgundy                         | 35     |       10 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 35 1/2 |        2 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 36     |        5 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 36 1/2 |        2 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 37     |        3 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 37 1/2 |        7 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 38     |        9 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 38 1/2 |       10 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 39     |        5 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 39 1/2 |       10 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 40     |        7 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 41     |        1 |  99.95 |
|       6 | Kaylin Alba Burgundy                         | 42     |        6 |  99.95 |
|      27 | Nastie Bruciato                              | 38     |        9 | 149.00 |
|      27 | Nastie Bruciato                              | 38 1/2 |        0 | 149.00 |
|      27 | Nastie Bruciato                              | 39     |        5 | 149.00 |
|      27 | Nastie Bruciato                              | 39 1/2 |        9 | 149.00 |
|      27 | Nastie Bruciato                              | 41     |       10 | 149.00 |
|      27 | Nastie Bruciato                              | 42     |        4 | 149.00 |
|      27 | Nastie Bruciato                              | 43     |        8 | 149.00 |
|      27 | Nastie Bruciato                              | 44     |        4 | 149.00 |
|      27 | Nastie Bruciato                              | 45     |       10 | 149.00 |
|      27 | Nastie Bruciato                              | 45 1/2 |        2 | 149.00 |
|      27 | Nastie Bruciato                              | 46     |        9 | 149.00 |
|      27 | Nastie Bruciato                              | 46 1/2 |        0 | 149.00 |
|      27 | Nastie Bruciato                              | 47     |        2 | 149.00 |
|      27 | Nastie Bruciato                              | 47 1/2 |        6 | 149.00 |
|      27 | Nastie Bruciato                              | 48     |        1 | 149.00 |
|       8 | Petunia Noir                                 | 35     |        3 |  29.90 |
|       8 | Petunia Noir                                 | 35 1/2 |        0 |  29.90 |
|       8 | Petunia Noir                                 | 36     |        9 |  29.90 |
|       8 | Petunia Noir                                 | 36 1/2 |        7 |  29.90 |
|       8 | Petunia Noir                                 | 37     |        3 |  29.90 |
|       8 | Petunia Noir                                 | 39     |        2 |  29.90 |
|       8 | Petunia Noir                                 | 39 1/2 |        0 |  29.90 |
|       8 | Petunia Noir                                 | 40     |        2 |  29.90 |
|       8 | Petunia Noir                                 | 40 1/2 |        0 |  29.90 |
|       8 | Petunia Noir                                 | 41     |        8 |  29.90 |
|       8 | Petunia Noir                                 | 42     |        8 |  29.90 |
|       8 | Petunia Noir                                 | 42 1/2 |        4 |  29.90 |
|      29 | Rilmot                                       | 38     |        3 |  99.00 |
|      29 | Rilmot                                       | 38 1/2 |        1 |  99.00 |
|      29 | Rilmot                                       | 39 1/2 |       10 |  99.00 |
|      29 | Rilmot                                       | 40     |        9 |  99.00 |
|      29 | Rilmot                                       | 40 1/2 |        8 |  99.00 |
|      29 | Rilmot                                       | 41     |        8 |  99.00 |
|      29 | Rilmot                                       | 41 1/2 |        0 |  99.00 |
|      29 | Rilmot                                       | 42     |        7 |  99.00 |
|      29 | Rilmot                                       | 42 1/2 |        6 |  99.00 |
|      29 | Rilmot                                       | 43     |        2 |  99.00 |
|      29 | Rilmot                                       | 43 1/2 |        9 |  99.00 |
|      29 | Rilmot                                       | 44     |        0 |  99.00 |
|      29 | Rilmot                                       | 45     |        7 |  99.00 |
|      29 | Rilmot                                       | 45 1/2 |        9 |  99.00 |
|      29 | Rilmot                                       | 46     |        4 |  99.00 |
|      29 | Rilmot                                       | 46 1/2 |        4 |  99.00 |
|      29 | Rilmot                                       | 47     |        2 |  99.00 |
|      29 | Rilmot                                       | 47 1/2 |        1 |  99.00 |
|      24 | Satingh Brown                                | 38     |       10 |  79.00 |
|      24 | Satingh Brown                                | 38 1/2 |        5 |  79.00 |
|      24 | Satingh Brown                                | 39 1/2 |        2 |  79.00 |
|      24 | Satingh Brown                                | 40     |        0 |  79.00 |
|      24 | Satingh Brown                                | 40 1/2 |        0 |  79.00 |
|      24 | Satingh Brown                                | 41     |        6 |  79.00 |
|      24 | Satingh Brown                                | 41 1/2 |        1 |  79.00 |
|      24 | Satingh Brown                                | 42     |        7 |  79.00 |
|      24 | Satingh Brown                                | 42 1/2 |        4 |  79.00 |
|      24 | Satingh Brown                                | 43     |        8 |  79.00 |
|      24 | Satingh Brown                                | 43 1/2 |        3 |  79.00 |
|      24 | Satingh Brown                                | 44     |        3 |  79.00 |
|      24 | Satingh Brown                                | 44 1/2 |        2 |  79.00 |
|      24 | Satingh Brown                                | 45 1/2 |        4 |  79.00 |
|      24 | Satingh Brown                                | 46     |        1 |  79.00 |
|      24 | Satingh Brown                                | 46 1/2 |        1 |  79.00 |
|      24 | Satingh Brown                                | 47     |        9 |  79.00 |
|      24 | Satingh Brown                                | 47 1/2 |        5 |  79.00 |
|      24 | Satingh Brown                                | 48     |        2 |  79.00 |
|      25 | Southampton Bleu                             | 38     |        6 | 109.00 |
|      25 | Southampton Bleu                             | 40 1/2 |        6 | 109.00 |
|      25 | Southampton Bleu                             | 41     |        3 | 109.00 |
|      25 | Southampton Bleu                             | 41 1/2 |        8 | 109.00 |
|      25 | Southampton Bleu                             | 42     |        0 | 109.00 |
|      25 | Southampton Bleu                             | 42 1/2 |        8 | 109.00 |
|      25 | Southampton Bleu                             | 43     |        6 | 109.00 |
|      25 | Southampton Bleu                             | 43 1/2 |        4 | 109.00 |
|      25 | Southampton Bleu                             | 44 1/2 |        1 | 109.00 |
|      25 | Southampton Bleu                             | 45     |        4 | 109.00 |
|      25 | Southampton Bleu                             | 45 1/2 |        1 | 109.00 |
|      25 | Southampton Bleu                             | 46 1/2 |        6 | 109.00 |
|      25 | Southampton Bleu                             | 47     |        3 | 109.00 |
|      25 | Southampton Bleu                             | 47 1/2 |        8 | 109.00 |
|      28 | Stall Brown                                  | 38 1/2 |        8 | 119.00 |
|      28 | Stall Brown                                  | 39     |        0 | 119.00 |
|      28 | Stall Brown                                  | 39 1/2 |        6 | 119.00 |
|      28 | Stall Brown                                  | 40     |        5 | 119.00 |
|      28 | Stall Brown                                  | 40 1/2 |        7 | 119.00 |
|      28 | Stall Brown                                  | 41 1/2 |        1 | 119.00 |
|      28 | Stall Brown                                  | 42     |        0 | 119.00 |
|      28 | Stall Brown                                  | 42 1/2 |        1 | 119.00 |
|      28 | Stall Brown                                  | 43     |        0 | 119.00 |
|      28 | Stall Brown                                  | 43 1/2 |        0 | 119.00 |
|      28 | Stall Brown                                  | 44     |        2 | 119.00 |
|      28 | Stall Brown                                  | 44 1/2 |        3 | 119.00 |
|      28 | Stall Brown                                  | 45 1/2 |        5 | 119.00 |
|      28 | Stall Brown                                  | 46     |        1 | 119.00 |
|      28 | Stall Brown                                  | 46 1/2 |        0 | 119.00 |
|      28 | Stall Brown                                  | 47     |        3 | 119.00 |
|      28 | Stall Brown                                  | 47 1/2 |        7 | 119.00 |
|      18 | Stan Smith Blanc Vert                        | 38 1/2 |       10 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 39     |        5 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 39 1/2 |        1 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 40     |        6 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 40 1/2 |        3 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 41 1/2 |        5 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 42     |        1 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 43 1/2 |        5 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 44     |        0 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 44 1/2 |        7 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 46     |        8 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 47     |        4 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 47 1/2 |        0 |  81.00 |
|      18 | Stan Smith Blanc Vert                        | 48     |        7 |  81.00 |
|      17 | Stan Smith Noir                              | 38     |        9 |  94.99 |
|      17 | Stan Smith Noir                              | 38 1/2 |       10 |  94.99 |
|      17 | Stan Smith Noir                              | 39     |        7 |  94.99 |
|      17 | Stan Smith Noir                              | 39 1/2 |        3 |  94.99 |
|      17 | Stan Smith Noir                              | 40     |        5 |  94.99 |
|      17 | Stan Smith Noir                              | 40 1/2 |       10 |  94.99 |
|      17 | Stan Smith Noir                              | 41     |       10 |  94.99 |
|      17 | Stan Smith Noir                              | 41 1/2 |        6 |  94.99 |
|      17 | Stan Smith Noir                              | 42     |       10 |  94.99 |
|      17 | Stan Smith Noir                              | 42 1/2 |        8 |  94.99 |
|      17 | Stan Smith Noir                              | 43     |        7 |  94.99 |
|      17 | Stan Smith Noir                              | 43 1/2 |       10 |  94.99 |
|      17 | Stan Smith Noir                              | 44     |        6 |  94.99 |
|      17 | Stan Smith Noir                              | 44 1/2 |        9 |  94.99 |
|      17 | Stan Smith Noir                              | 46     |        3 |  94.99 |
|      17 | Stan Smith Noir                              | 47     |        7 |  94.99 |
|      17 | Stan Smith Noir                              | 47 1/2 |       10 |  94.99 |
|      17 | Stan Smith Noir                              | 48     |        3 |  94.99 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 39     |        1 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 39 1/2 |        8 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 41     |        1 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 41 1/2 |        5 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 43     |        9 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 43 1/2 |        7 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 44     |        4 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 44 1/2 |        5 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 45     |        7 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 46     |        2 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 47     |        2 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 47 1/2 |        4 |  58.50 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 48     |       10 |  58.50 |
|      20 | Suede Classic+ Peacoat White                 | 38     |        4 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 38 1/2 |        5 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 39     |        9 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 39 1/2 |        3 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 40     |        4 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 41     |        1 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 41 1/2 |        3 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 42     |       10 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 42 1/2 |        3 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 43     |        6 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 43 1/2 |        8 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 45     |        2 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 45 1/2 |       10 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 46     |        0 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 47 1/2 |        3 |  80.00 |
|      20 | Suede Classic+ Peacoat White                 | 48     |        2 |  80.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 35     |        5 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 35 1/2 |        0 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 36 1/2 |        2 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 37     |        2 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 37 1/2 |        0 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 38     |        3 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 38 1/2 |        5 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 39     |        2 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 39 1/2 |       10 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 40     |        6 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 40 1/2 |        3 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 41     |        1 |  90.00 |
|      15 | Suede Hyper Embelished Wn's Black White      | 42 1/2 |        0 |  90.00 |
|      19 | Superstar Blanc Noir                         | 39     |        4 |  99.99 |
|      19 | Superstar Blanc Noir                         | 39 1/2 |        2 |  99.99 |
|      19 | Superstar Blanc Noir                         | 40 1/2 |        2 |  99.99 |
|      19 | Superstar Blanc Noir                         | 41 1/2 |        5 |  99.99 |
|      19 | Superstar Blanc Noir                         | 43     |        4 |  99.99 |
|      19 | Superstar Blanc Noir                         | 43 1/2 |        9 |  99.99 |
|      19 | Superstar Blanc Noir                         | 44     |        5 |  99.99 |
|      19 | Superstar Blanc Noir                         | 44 1/2 |        5 |  99.99 |
|      19 | Superstar Blanc Noir                         | 45     |        9 |  99.99 |
|      19 | Superstar Blanc Noir                         | 45 1/2 |        9 |  99.99 |
|      19 | Superstar Blanc Noir                         | 46 1/2 |        2 |  99.99 |
|      19 | Superstar Blanc Noir                         | 47 1/2 |        7 |  99.99 |
|      19 | Superstar Blanc Noir                         | 48     |        6 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 35     |        5 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 37     |        7 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 37 1/2 |        4 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 38     |        0 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 38 1/2 |        3 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 39     |        9 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 39 1/2 |        8 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 40     |        3 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 40 1/2 |        8 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 41     |       10 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 41 1/2 |       10 |  99.99 |
|       2 | Superstar W Blanc Noir                       | 42     |        8 |  99.99 |
|      26 | Suttino Beige                                | 38     |        3 |  79.00 |
|      26 | Suttino Beige                                | 38 1/2 |        8 |  79.00 |
|      26 | Suttino Beige                                | 39 1/2 |       10 |  79.00 |
|      26 | Suttino Beige                                | 40     |        9 |  79.00 |
|      26 | Suttino Beige                                | 40 1/2 |        6 |  79.00 |
|      26 | Suttino Beige                                | 41     |        8 |  79.00 |
|      26 | Suttino Beige                                | 41 1/2 |        2 |  79.00 |
|      26 | Suttino Beige                                | 42 1/2 |       10 |  79.00 |
|      26 | Suttino Beige                                | 43     |        0 |  79.00 |
|      26 | Suttino Beige                                | 43 1/2 |        6 |  79.00 |
|      26 | Suttino Beige                                | 44     |        2 |  79.00 |
|      26 | Suttino Beige                                | 44 1/2 |        8 |  79.00 |
|      26 | Suttino Beige                                | 45     |        4 |  79.00 |
|      26 | Suttino Beige                                | 45 1/2 |        3 |  79.00 |
|      26 | Suttino Beige                                | 46     |        4 |  79.00 |
|      26 | Suttino Beige                                | 46 1/2 |        5 |  79.00 |
|      26 | Suttino Beige                                | 47     |        6 |  79.00 |
|      26 | Suttino Beige                                | 47 1/2 |        0 |  79.00 |
|      26 | Suttino Beige                                | 48     |        5 |  79.00 |
|      14 | Un Reisel Mara Black Leather                 | 35     |        2 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 35 1/2 |        3 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 36 1/2 |        9 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 37     |        5 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 37 1/2 |        9 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 38     |        8 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 39     |        3 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 39 1/2 |        3 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 40     |        8 |  89.99 |
|      14 | Un Reisel Mara Black Leather                 | 40 1/2 |        4 |  89.99 |
|      10 | W996 Light Cashmere                          | 35     |       10 |  70.00 |
|      10 | W996 Light Cashmere                          | 36 1/2 |        8 |  70.00 |
|      10 | W996 Light Cashmere                          | 37     |        8 |  70.00 |
|      10 | W996 Light Cashmere                          | 37 1/2 |        0 |  70.00 |
|      10 | W996 Light Cashmere                          | 38     |        3 |  70.00 |
|      10 | W996 Light Cashmere                          | 38 1/2 |        0 |  70.00 |
|      10 | W996 Light Cashmere                          | 39     |       10 |  70.00 |
|      10 | W996 Light Cashmere                          | 39 1/2 |        7 |  70.00 |
|      10 | W996 Light Cashmere                          | 41     |        1 |  70.00 |
|      10 | W996 Light Cashmere                          | 42 1/2 |        9 |  70.00 |
|       3 | Wmns Air Huarache Run White White            | 35     |        0 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 36 1/2 |        1 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 37     |        9 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 37 1/2 |        7 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 38     |        1 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 38 1/2 |        7 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 39     |        9 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 39 1/2 |       10 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 40 1/2 |        7 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 41 1/2 |        2 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 42     |        4 | 119.99 |
|       3 | Wmns Air Huarache Run White White            | 42 1/2 |        7 | 119.99 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 35     |        7 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 35 1/2 |        7 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 36     |        5 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 36 1/2 |        5 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 37     |        3 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 37 1/2 |        5 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 38     |        6 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 38 1/2 |        9 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 39     |        8 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 40 1/2 |        1 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 41 1/2 |        6 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 42     |        3 |  85.00 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 42 1/2 |        3 |  85.00 |
+---------+----------------------------------------------+--------+----------+--------+
*/

/*Affichage des quantités en stock par produit et pour toutes les tailles (même si certains produits n'existent pas pour certaines tailles (right))*/

select si.name as Taille, p.name as Produit, sum(st.stock) as Qt_Stock from product as p left join stock as st on p.id= st.product_id left join size as si on st.size_id = si.id group by Taille, Produit order by Taille, Produit;

/*
+--------+----------------------------------------------+----------+
| Taille | Produit                                      | Qt_Stock |
+--------+----------------------------------------------+----------+
| 35     | Gazelle W Rose Blanc                         |        6 |
| 35     | Inof Vaqueta Noir                            |        6 |
| 35     | Kaylin Alba Burgundy                         |       10 |
| 35     | Petunia Noir                                 |        3 |
| 35     | Suede Hyper Embelished Wn's Black White      |        5 |
| 35     | Superstar W Blanc Noir                       |        5 |
| 35     | Un Reisel Mara Black Leather                 |        2 |
| 35     | W996 Light Cashmere                          |       10 |
| 35     | Wmns Air Huarache Run White White            |        0 |
| 35     | Wmns Classic Cortez Leather Blanc Rouge Bleu |        7 |
| 35 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        2 |
| 35 1/2 | Benino Gold                                  |        0 |
| 35 1/2 | Calla Rose Black                             |        3 |
| 35 1/2 | Gazelle W Gris Blanc                         |        8 |
| 35 1/2 | Gazelle W Rose Blanc                         |        7 |
| 35 1/2 | Inof Vaqueta Noir                            |        7 |
| 35 1/2 | Ipona Noir                                   |        6 |
| 35 1/2 | Kaylin Alba Burgundy                         |        2 |
| 35 1/2 | Petunia Noir                                 |        0 |
| 35 1/2 | Suede Hyper Embelished Wn's Black White      |        0 |
| 35 1/2 | Un Reisel Mara Black Leather                 |        3 |
| 35 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        7 |
| 36     | All Star Dainty Canvas Ox W Blanc Optical    |        8 |
| 36     | Benino Black                                 |        8 |
| 36     | Benino Gold                                  |        2 |
| 36     | Calla Rose Black                             |        2 |
| 36     | Gazelle W Gris Blanc                         |        5 |
| 36     | Inof Vaqueta Noir                            |        8 |
| 36     | Ipona Noir                                   |        9 |
| 36     | Kaylin Alba Burgundy                         |        5 |
| 36     | Petunia Noir                                 |        9 |
| 36     | Wmns Classic Cortez Leather Blanc Rouge Bleu |        5 |
| 36 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        0 |
| 36 1/2 | Benino Gold                                  |        8 |
| 36 1/2 | Calla Rose Black                             |        5 |
| 36 1/2 | Gazelle W Gris Blanc                         |        4 |
| 36 1/2 | Gazelle W Rose Blanc                         |        8 |
| 36 1/2 | Ipona Noir                                   |        8 |
| 36 1/2 | Kaylin Alba Burgundy                         |        2 |
| 36 1/2 | Petunia Noir                                 |        7 |
| 36 1/2 | Suede Hyper Embelished Wn's Black White      |        2 |
| 36 1/2 | Un Reisel Mara Black Leather                 |        9 |
| 36 1/2 | W996 Light Cashmere                          |        8 |
| 36 1/2 | Wmns Air Huarache Run White White            |        1 |
| 36 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        5 |
| 37     | All Star Dainty Canvas Ox W Blanc Optical    |        9 |
| 37     | Calla Rose Black                             |        5 |
| 37     | Inof Vaqueta Noir                            |        4 |
| 37     | Kaylin Alba Burgundy                         |        3 |
| 37     | Petunia Noir                                 |        3 |
| 37     | Suede Hyper Embelished Wn's Black White      |        2 |
| 37     | Superstar W Blanc Noir                       |        7 |
| 37     | Un Reisel Mara Black Leather                 |        5 |
| 37     | W996 Light Cashmere                          |        8 |
| 37     | Wmns Air Huarache Run White White            |        9 |
| 37     | Wmns Classic Cortez Leather Blanc Rouge Bleu |        3 |
| 37 1/2 | Benino Black                                 |        7 |
| 37 1/2 | Benino Gold                                  |        3 |
| 37 1/2 | Calla Rose Black                             |        6 |
| 37 1/2 | Gazelle W Rose Blanc                         |       10 |
| 37 1/2 | Kaylin Alba Burgundy                         |        7 |
| 37 1/2 | Suede Hyper Embelished Wn's Black White      |        0 |
| 37 1/2 | Superstar W Blanc Noir                       |        4 |
| 37 1/2 | Un Reisel Mara Black Leather                 |        9 |
| 37 1/2 | W996 Light Cashmere                          |        0 |
| 37 1/2 | Wmns Air Huarache Run White White            |        7 |
| 37 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        5 |
| 38     | All Star Dainty Canvas Ox W Blanc Optical    |        4 |
| 38     | Benino Black                                 |        3 |
| 38     | Calla Rose Black                             |        0 |
| 38     | Classic Cortez Nylon Obsidian White          |        3 |
| 38     | Inof Vaqueta Noir                            |        9 |
| 38     | Ipona Noir                                   |        2 |
| 38     | Kaylin Alba Burgundy                         |        9 |
| 38     | Nastie Bruciato                              |        9 |
| 38     | Rilmot                                       |        3 |
| 38     | Satingh Brown                                |       10 |
| 38     | Southampton Bleu                             |        6 |
| 38     | Stan Smith Noir                              |        9 |
| 38     | Suede Classic+ Peacoat White                 |        4 |
| 38     | Suede Hyper Embelished Wn's Black White      |        3 |
| 38     | Superstar W Blanc Noir                       |        0 |
| 38     | Suttino Beige                                |        3 |
| 38     | Un Reisel Mara Black Leather                 |        8 |
| 38     | W996 Light Cashmere                          |        3 |
| 38     | Wmns Air Huarache Run White White            |        1 |
| 38     | Wmns Classic Cortez Leather Blanc Rouge Bleu |        6 |
| 38 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        8 |
| 38 1/2 | Benino Gold                                  |        9 |
| 38 1/2 | Calla Rose Black                             |        6 |
| 38 1/2 | Classic Cortez Nylon Obsidian White          |        8 |
| 38 1/2 | Gazelle W Gris Blanc                         |        3 |
| 38 1/2 | Gazelle W Rose Blanc                         |        5 |
| 38 1/2 | Inof Vaqueta Noir                            |        2 |
| 38 1/2 | Ipona Noir                                   |        4 |
| 38 1/2 | Kaylin Alba Burgundy                         |       10 |
| 38 1/2 | Nastie Bruciato                              |        0 |
| 38 1/2 | Rilmot                                       |        1 |
| 38 1/2 | Satingh Brown                                |        5 |
| 38 1/2 | Stall Brown                                  |        8 |
| 38 1/2 | Stan Smith Blanc Vert                        |       10 |
| 38 1/2 | Stan Smith Noir                              |       10 |
| 38 1/2 | Suede Classic+ Peacoat White                 |        5 |
| 38 1/2 | Suede Hyper Embelished Wn's Black White      |        5 |
| 38 1/2 | Superstar W Blanc Noir                       |        3 |
| 38 1/2 | Suttino Beige                                |        8 |
| 38 1/2 | W996 Light Cashmere                          |        0 |
| 38 1/2 | Wmns Air Huarache Run White White            |        7 |
| 38 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        9 |
| 39     | Benino Black                                 |        6 |
| 39     | Benino Gold                                  |        9 |
| 39     | Calla Rose Black                             |        2 |
| 39     | Chuck Taylor All Star Hi M Blanc Optical     |        1 |
| 39     | Classic Cortez Nylon Obsidian White          |        3 |
| 39     | Gazelle W Rose Blanc                         |        5 |
| 39     | Inof Vaqueta Noir                            |        9 |
| 39     | Ipona Noir                                   |        3 |
| 39     | Kaylin Alba Burgundy                         |        5 |
| 39     | Nastie Bruciato                              |        5 |
| 39     | Petunia Noir                                 |        2 |
| 39     | Stall Brown                                  |        0 |
| 39     | Stan Smith Blanc Vert                        |        5 |
| 39     | Stan Smith Noir                              |        7 |
| 39     | Star Player Ev Canvas Ox M Marine Blanc      |        1 |
| 39     | Suede Classic+ Peacoat White                 |        9 |
| 39     | Suede Hyper Embelished Wn's Black White      |        2 |
| 39     | Superstar Blanc Noir                         |        4 |
| 39     | Superstar W Blanc Noir                       |        9 |
| 39     | Un Reisel Mara Black Leather                 |        3 |
| 39     | W996 Light Cashmere                          |       10 |
| 39     | Wmns Air Huarache Run White White            |        9 |
| 39     | Wmns Classic Cortez Leather Blanc Rouge Bleu |        8 |
| 39 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 39 1/2 | Benino Black                                 |        4 |
| 39 1/2 | Benino Gold                                  |        9 |
| 39 1/2 | Gazelle W Gris Blanc                         |       10 |
| 39 1/2 | Gazelle W Rose Blanc                         |        3 |
| 39 1/2 | Inof Vaqueta Noir                            |        2 |
| 39 1/2 | Ipona Noir                                   |       10 |
| 39 1/2 | Kaylin Alba Burgundy                         |       10 |
| 39 1/2 | Nastie Bruciato                              |        9 |
| 39 1/2 | Petunia Noir                                 |        0 |
| 39 1/2 | Rilmot                                       |       10 |
| 39 1/2 | Satingh Brown                                |        2 |
| 39 1/2 | Stall Brown                                  |        6 |
| 39 1/2 | Stan Smith Blanc Vert                        |        1 |
| 39 1/2 | Stan Smith Noir                              |        3 |
| 39 1/2 | Star Player Ev Canvas Ox M Marine Blanc      |        8 |
| 39 1/2 | Suede Classic+ Peacoat White                 |        3 |
| 39 1/2 | Suede Hyper Embelished Wn's Black White      |       10 |
| 39 1/2 | Superstar Blanc Noir                         |        2 |
| 39 1/2 | Superstar W Blanc Noir                       |        8 |
| 39 1/2 | Suttino Beige                                |       10 |
| 39 1/2 | Un Reisel Mara Black Leather                 |        3 |
| 39 1/2 | W996 Light Cashmere                          |        7 |
| 39 1/2 | Wmns Air Huarache Run White White            |       10 |
| 40     | All Star Dainty Canvas Ox W Blanc Optical    |       10 |
| 40     | Benino Black                                 |        5 |
| 40     | Benino Gold                                  |        2 |
| 40     | Chuck Taylor All Star Hi M Blanc Optical     |       10 |
| 40     | Gazelle W Gris Blanc                         |        2 |
| 40     | Gazelle W Rose Blanc                         |        2 |
| 40     | Inof Vaqueta Noir                            |        4 |
| 40     | Ipona Noir                                   |        0 |
| 40     | Kaylin Alba Burgundy                         |        7 |
| 40     | Petunia Noir                                 |        2 |
| 40     | Rilmot                                       |        9 |
| 40     | Satingh Brown                                |        0 |
| 40     | Stall Brown                                  |        5 |
| 40     | Stan Smith Blanc Vert                        |        6 |
| 40     | Stan Smith Noir                              |        5 |
| 40     | Suede Classic+ Peacoat White                 |        4 |
| 40     | Suede Hyper Embelished Wn's Black White      |        6 |
| 40     | Superstar W Blanc Noir                       |        3 |
| 40     | Suttino Beige                                |        9 |
| 40     | Un Reisel Mara Black Leather                 |        8 |
| 40 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        8 |
| 40 1/2 | Benino Black                                 |        5 |
| 40 1/2 | Benino Gold                                  |        1 |
| 40 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        4 |
| 40 1/2 | Classic Cortez Nylon Obsidian White          |        7 |
| 40 1/2 | Gazelle W Gris Blanc                         |        6 |
| 40 1/2 | Gazelle W Rose Blanc                         |        9 |
| 40 1/2 | Inof Vaqueta Noir                            |        3 |
| 40 1/2 | Ipona Noir                                   |        4 |
| 40 1/2 | Petunia Noir                                 |        0 |
| 40 1/2 | Rilmot                                       |        8 |
| 40 1/2 | Satingh Brown                                |        0 |
| 40 1/2 | Southampton Bleu                             |        6 |
| 40 1/2 | Stall Brown                                  |        7 |
| 40 1/2 | Stan Smith Blanc Vert                        |        3 |
| 40 1/2 | Stan Smith Noir                              |       10 |
| 40 1/2 | Suede Hyper Embelished Wn's Black White      |        3 |
| 40 1/2 | Superstar Blanc Noir                         |        2 |
| 40 1/2 | Superstar W Blanc Noir                       |        8 |
| 40 1/2 | Suttino Beige                                |        6 |
| 40 1/2 | Un Reisel Mara Black Leather                 |        4 |
| 40 1/2 | Wmns Air Huarache Run White White            |        7 |
| 40 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        1 |
| 41     | All Star Dainty Canvas Ox W Blanc Optical    |        0 |
| 41     | Benino Black                                 |        9 |
| 41     | Calla Rose Black                             |        8 |
| 41     | Chuck Taylor All Star Hi M Blanc Optical     |        2 |
| 41     | Classic Cortez Nylon Obsidian White          |        1 |
| 41     | Inof Vaqueta Noir                            |        5 |
| 41     | Ipona Noir                                   |        8 |
| 41     | Kaylin Alba Burgundy                         |        1 |
| 41     | Nastie Bruciato                              |       10 |
| 41     | Petunia Noir                                 |        8 |
| 41     | Rilmot                                       |        8 |
| 41     | Satingh Brown                                |        6 |
| 41     | Southampton Bleu                             |        3 |
| 41     | Stan Smith Noir                              |       10 |
| 41     | Star Player Ev Canvas Ox M Marine Blanc      |        1 |
| 41     | Suede Classic+ Peacoat White                 |        1 |
| 41     | Suede Hyper Embelished Wn's Black White      |        1 |
| 41     | Superstar W Blanc Noir                       |       10 |
| 41     | Suttino Beige                                |        8 |
| 41     | W996 Light Cashmere                          |        1 |
| 41 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 41 1/2 | Benino Gold                                  |        1 |
| 41 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        7 |
| 41 1/2 | Classic Cortez Nylon Obsidian White          |        8 |
| 41 1/2 | Gazelle W Gris Blanc                         |        7 |
| 41 1/2 | Inof Vaqueta Noir                            |        4 |
| 41 1/2 | Ipona Noir                                   |        4 |
| 41 1/2 | Rilmot                                       |        0 |
| 41 1/2 | Satingh Brown                                |        1 |
| 41 1/2 | Southampton Bleu                             |        8 |
| 41 1/2 | Stall Brown                                  |        1 |
| 41 1/2 | Stan Smith Blanc Vert                        |        5 |
| 41 1/2 | Stan Smith Noir                              |        6 |
| 41 1/2 | Star Player Ev Canvas Ox M Marine Blanc      |        5 |
| 41 1/2 | Suede Classic+ Peacoat White                 |        3 |
| 41 1/2 | Superstar Blanc Noir                         |        5 |
| 41 1/2 | Superstar W Blanc Noir                       |       10 |
| 41 1/2 | Suttino Beige                                |        2 |
| 41 1/2 | Wmns Air Huarache Run White White            |        2 |
| 41 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        6 |
| 42     | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 42     | Benino Black                                 |        8 |
| 42     | Benino Gold                                  |        0 |
| 42     | Gazelle W Gris Blanc                         |       10 |
| 42     | Gazelle W Rose Blanc                         |        6 |
| 42     | Inof Vaqueta Noir                            |        9 |
| 42     | Ipona Noir                                   |        9 |
| 42     | Kaylin Alba Burgundy                         |        6 |
| 42     | Nastie Bruciato                              |        4 |
| 42     | Petunia Noir                                 |        8 |
| 42     | Rilmot                                       |        7 |
| 42     | Satingh Brown                                |        7 |
| 42     | Southampton Bleu                             |        0 |
| 42     | Stall Brown                                  |        0 |
| 42     | Stan Smith Blanc Vert                        |        1 |
| 42     | Stan Smith Noir                              |       10 |
| 42     | Suede Classic+ Peacoat White                 |       10 |
| 42     | Superstar W Blanc Noir                       |        8 |
| 42     | Wmns Air Huarache Run White White            |        4 |
| 42     | Wmns Classic Cortez Leather Blanc Rouge Bleu |        3 |
| 42 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        3 |
| 42 1/2 | Benino Gold                                  |        8 |
| 42 1/2 | Calla Rose Black                             |        1 |
| 42 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        4 |
| 42 1/2 | Classic Cortez Nylon Obsidian White          |        7 |
| 42 1/2 | Gazelle W Gris Blanc                         |        0 |
| 42 1/2 | Gazelle W Rose Blanc                         |        8 |
| 42 1/2 | Petunia Noir                                 |        4 |
| 42 1/2 | Rilmot                                       |        6 |
| 42 1/2 | Satingh Brown                                |        4 |
| 42 1/2 | Southampton Bleu                             |        8 |
| 42 1/2 | Stall Brown                                  |        1 |
| 42 1/2 | Stan Smith Noir                              |        8 |
| 42 1/2 | Suede Classic+ Peacoat White                 |        3 |
| 42 1/2 | Suede Hyper Embelished Wn's Black White      |        0 |
| 42 1/2 | Suttino Beige                                |       10 |
| 42 1/2 | W996 Light Cashmere                          |        9 |
| 42 1/2 | Wmns Air Huarache Run White White            |        7 |
| 42 1/2 | Wmns Classic Cortez Leather Blanc Rouge Bleu |        3 |
| 43     | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 43     | Chuck Taylor All Star Hi M Blanc Optical     |        9 |
| 43     | Classic Cortez Nylon Obsidian White          |        5 |
| 43     | Nastie Bruciato                              |        8 |
| 43     | Rilmot                                       |        2 |
| 43     | Satingh Brown                                |        8 |
| 43     | Southampton Bleu                             |        6 |
| 43     | Stall Brown                                  |        0 |
| 43     | Stan Smith Noir                              |        7 |
| 43     | Star Player Ev Canvas Ox M Marine Blanc      |        9 |
| 43     | Suede Classic+ Peacoat White                 |        6 |
| 43     | Superstar Blanc Noir                         |        4 |
| 43     | Suttino Beige                                |        0 |
| 43 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 43 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        4 |
| 43 1/2 | Classic Cortez Nylon Obsidian White          |        2 |
| 43 1/2 | Rilmot                                       |        9 |
| 43 1/2 | Satingh Brown                                |        3 |
| 43 1/2 | Southampton Bleu                             |        4 |
| 43 1/2 | Stall Brown                                  |        0 |
| 43 1/2 | Stan Smith Blanc Vert                        |        5 |
| 43 1/2 | Stan Smith Noir                              |       10 |
| 43 1/2 | Star Player Ev Canvas Ox M Marine Blanc      |        7 |
| 43 1/2 | Suede Classic+ Peacoat White                 |        8 |
| 43 1/2 | Superstar Blanc Noir                         |        9 |
| 43 1/2 | Suttino Beige                                |        6 |
| 44     | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 44     | Chuck Taylor All Star Hi M Blanc Optical     |        1 |
| 44     | Nastie Bruciato                              |        4 |
| 44     | Rilmot                                       |        0 |
| 44     | Satingh Brown                                |        3 |
| 44     | Stall Brown                                  |        2 |
| 44     | Stan Smith Blanc Vert                        |        0 |
| 44     | Stan Smith Noir                              |        6 |
| 44     | Star Player Ev Canvas Ox M Marine Blanc      |        4 |
| 44     | Superstar Blanc Noir                         |        5 |
| 44     | Suttino Beige                                |        2 |
| 44 1/2 | All Star Dainty Canvas Ox W Blanc Optical    |        5 |
| 44 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        1 |
| 44 1/2 | Satingh Brown                                |        2 |
| 44 1/2 | Southampton Bleu                             |        1 |
| 44 1/2 | Stall Brown                                  |        3 |
| 44 1/2 | Stan Smith Blanc Vert                        |        7 |
| 44 1/2 | Stan Smith Noir                              |        9 |
| 44 1/2 | Star Player Ev Canvas Ox M Marine Blanc      |        5 |
| 44 1/2 | Superstar Blanc Noir                         |        5 |
| 44 1/2 | Suttino Beige                                |        8 |
| 45     | All Star Dainty Canvas Ox W Blanc Optical    |        7 |
| 45     | Chuck Taylor All Star Hi M Blanc Optical     |        7 |
| 45     | Classic Cortez Nylon Obsidian White          |        7 |
| 45     | Nastie Bruciato                              |       10 |
| 45     | Rilmot                                       |        7 |
| 45     | Southampton Bleu                             |        4 |
| 45     | Star Player Ev Canvas Ox M Marine Blanc      |        7 |
| 45     | Suede Classic+ Peacoat White                 |        2 |
| 45     | Superstar Blanc Noir                         |        9 |
| 45     | Suttino Beige                                |        4 |
| 45 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        9 |
| 45 1/2 | Classic Cortez Nylon Obsidian White          |        0 |
| 45 1/2 | Nastie Bruciato                              |        2 |
| 45 1/2 | Rilmot                                       |        9 |
| 45 1/2 | Satingh Brown                                |        4 |
| 45 1/2 | Southampton Bleu                             |        1 |
| 45 1/2 | Stall Brown                                  |        5 |
| 45 1/2 | Suede Classic+ Peacoat White                 |       10 |
| 45 1/2 | Superstar Blanc Noir                         |        9 |
| 45 1/2 | Suttino Beige                                |        3 |
| 46     | Classic Cortez Nylon Obsidian White          |        3 |
| 46     | Nastie Bruciato                              |        9 |
| 46     | Rilmot                                       |        4 |
| 46     | Satingh Brown                                |        1 |
| 46     | Stall Brown                                  |        1 |
| 46     | Stan Smith Blanc Vert                        |        8 |
| 46     | Stan Smith Noir                              |        3 |
| 46     | Star Player Ev Canvas Ox M Marine Blanc      |        2 |
| 46     | Suede Classic+ Peacoat White                 |        0 |
| 46     | Suttino Beige                                |        4 |
| 46 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        2 |
| 46 1/2 | Classic Cortez Nylon Obsidian White          |        6 |
| 46 1/2 | Nastie Bruciato                              |        0 |
| 46 1/2 | Rilmot                                       |        4 |
| 46 1/2 | Satingh Brown                                |        1 |
| 46 1/2 | Southampton Bleu                             |        6 |
| 46 1/2 | Stall Brown                                  |        0 |
| 46 1/2 | Superstar Blanc Noir                         |        2 |
| 46 1/2 | Suttino Beige                                |        5 |
| 47     | Classic Cortez Nylon Obsidian White          |        9 |
| 47     | Nastie Bruciato                              |        2 |
| 47     | Rilmot                                       |        2 |
| 47     | Satingh Brown                                |        9 |
| 47     | Southampton Bleu                             |        3 |
| 47     | Stall Brown                                  |        3 |
| 47     | Stan Smith Blanc Vert                        |        4 |
| 47     | Stan Smith Noir                              |        7 |
| 47     | Star Player Ev Canvas Ox M Marine Blanc      |        2 |
| 47     | Suttino Beige                                |        6 |
| 47 1/2 | Chuck Taylor All Star Hi M Blanc Optical     |        8 |
| 47 1/2 | Classic Cortez Nylon Obsidian White          |        0 |
| 47 1/2 | Nastie Bruciato                              |        6 |
| 47 1/2 | Rilmot                                       |        1 |
| 47 1/2 | Satingh Brown                                |        5 |
| 47 1/2 | Southampton Bleu                             |        8 |
| 47 1/2 | Stall Brown                                  |        7 |
| 47 1/2 | Stan Smith Blanc Vert                        |        0 |
| 47 1/2 | Stan Smith Noir                              |       10 |
| 47 1/2 | Star Player Ev Canvas Ox M Marine Blanc      |        4 |
| 47 1/2 | Suede Classic+ Peacoat White                 |        3 |
| 47 1/2 | Superstar Blanc Noir                         |        7 |
| 47 1/2 | Suttino Beige                                |        0 |
| 48     | Chuck Taylor All Star Hi M Blanc Optical     |       10 |
| 48     | Classic Cortez Nylon Obsidian White          |        7 |
| 48     | Nastie Bruciato                              |        1 |
| 48     | Satingh Brown                                |        2 |
| 48     | Stan Smith Blanc Vert                        |        7 |
| 48     | Stan Smith Noir                              |        3 |
| 48     | Star Player Ev Canvas Ox M Marine Blanc      |       10 |
| 48     | Suede Classic+ Peacoat White                 |        2 |
| 48     | Superstar Blanc Noir                         |        6 |
| 48     | Suttino Beige                                |        5 |
+--------+----------------------------------------------+----------+
*/

/*
select si.name as Taille, sum(st.stock) as Qt_Stock from stock as st left join size as si on st.size_id = si.id group by Taille order by Taille;
+--------+----------+
| Taille | Qt_Stock |
+--------+----------+
| 35     |       54 |
| 35 1/2 |       45 |
| 36     |       61 |
| 36 1/2 |       67 |
| 37     |       58 |
| 37 1/2 |       58 |
| 38     |       95 |
| 38 1/2 |      126 |
| 39     |      117 |
| 39 1/2 |      145 |
| 40     |       99 |
| 40 1/2 |      112 |
| 41     |      101 |
| 41 1/2 |       90 |
| 42     |      115 |
| 42 1/2 |       94 |
| 43     |       69 |
| 43 1/2 |       72 |
| 44     |       32 |
| 44 1/2 |       46 |
| 45     |       64 |
| 45 1/2 |       52 |
| 46     |       35 |
| 46 1/2 |       26 |
| 47     |       47 |
| 47 1/2 |       59 |
| 48     |       53 |
+--------+----------+
*/


/*Affichage des quantités en stock par produit sans affichage des tailles avec somme des quantités */
select p.id as ID_Prod, p.name as Produit, sum(st.stock) as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by ID_Prod, Produit order by Produit;
/*
+----------------------------------------------+----------+
| Produit                                      | Qt_Stock |
+----------------------------------------------+----------+
| All Star Dainty Canvas Ox W Blanc Optical    |       65 |
| Benino Black                                 |       55 |
| Benino Gold                                  |       52 |
| Calla Rose Black                             |       38 |
| Chuck Taylor All Star Hi M Blanc Optical     |       79 |
| Classic Cortez Nylon Obsidian White          |       76 |
| Gazelle W Gris Blanc                         |       55 |
| Gazelle W Rose Blanc                         |       69 |
| Inof Vaqueta Noir                            |       72 |
| Ipona Noir                                   |       67 |
| Kaylin Alba Burgundy                         |       77 |
| Nastie Bruciato                              |       79 |
| Petunia Noir                                 |       46 |
| Rilmot                                       |       90 |
| Satingh Brown                                |       73 |
| Southampton Bleu                             |       64 |
| Stall Brown                                  |       49 |
| Stan Smith Blanc Vert                        |       62 |
| Stan Smith Noir                              |      133 |
| Star Player Ev Canvas Ox M Marine Blanc      |       65 |
| Suede Classic+ Peacoat White                 |       73 |
| Suede Hyper Embelished Wn's Black White      |       39 |
| Superstar Blanc Noir                         |       69 |
| Superstar W Blanc Noir                       |       75 |
| Suttino Beige                                |       99 |
| Un Reisel Mara Black Leather                 |       54 |
| W996 Light Cashmere                          |       56 |
| Wmns Air Huarache Run White White            |       64 |
| Wmns Classic Cortez Leather Blanc Rouge Bleu |       68 |
+----------------------------------------------+----------+
29 rows in set (0.02 sec)*/

/*Affichage des quantités en stock par produit et id produit sans affichage des tailles avec somme des quantités */
select p.id as ID_Prod, p.name as Produit, sum(st.stock) as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by ID_Prod, Produit order by Produit;
/*
+---------+----------------------------------------------+----------+
| ID_Prod | Produit                                      | Qt_Stock |
+---------+----------------------------------------------+----------+
|       1 | All Star Dainty Canvas Ox W Blanc Optical    |       65 |
|      16 | Benino Black                                 |       55 |
|       9 | Benino Gold                                  |       52 |
|       7 | Calla Rose Black                             |       38 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     |       79 |
|      23 | Classic Cortez Nylon Obsidian White          |       76 |
|      11 | Gazelle W Gris Blanc                         |       55 |
|       4 | Gazelle W Rose Blanc                         |       69 |
|      12 | Inof Vaqueta Noir                            |       72 |
|      13 | Ipona Noir                                   |       67 |
|       6 | Kaylin Alba Burgundy                         |       77 |
|      27 | Nastie Bruciato                              |       79 |
|       8 | Petunia Noir                                 |       46 |
|      29 | Rilmot                                       |       90 |
|      24 | Satingh Brown                                |       73 |
|      25 | Southampton Bleu                             |       64 |
|      28 | Stall Brown                                  |       49 |
|      18 | Stan Smith Blanc Vert                        |       62 |
|      17 | Stan Smith Noir                              |      133 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      |       65 |
|      20 | Suede Classic+ Peacoat White                 |       73 |
|      15 | Suede Hyper Embelished Wn's Black White      |       39 |
|      19 | Superstar Blanc Noir                         |       69 |
|       2 | Superstar W Blanc Noir                       |       75 |
|      26 | Suttino Beige                                |       99 |
|      14 | Un Reisel Mara Black Leather                 |       54 |
|      10 | W996 Light Cashmere                          |       56 |
|       3 | Wmns Air Huarache Run White White            |       64 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu |       68 |
+---------+----------------------------------------------+----------+
29 rows in set (0.01 sec)*/


select b.name as Marque, p.id as ID_Prod, p.name as Produit, sum(st.stock) as Qt_Stock, sum(st.stock * p.price) as ValeurStock from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by Marque, Produit, ID_Prod order by Marque, Produit;
/*
+---------------------+---------+----------------------------------------------+----------+-------------+
| Marque              | ID_Prod | Produit                                      | Qt_Stock | ValeurStock |
+---------------------+---------+----------------------------------------------+----------+-------------+
| Adidas              |      11 | Gazelle W Gris Blanc                         |       55 |     5224.45 |
| Adidas              |       4 | Gazelle W Rose Blanc                         |       69 |     6899.31 |
| Adidas              |      18 | Stan Smith Blanc Vert                        |       62 |     5022.00 |
| Adidas              |      17 | Stan Smith Noir                              |      133 |    12633.67 |
| Adidas              |      19 | Superstar Blanc Noir                         |       69 |     6899.31 |
| Adidas              |       2 | Superstar W Blanc Noir                       |       75 |     7499.25 |
| Clarks              |       7 | Calla Rose Black                             |       38 |     3798.10 |
| Clarks              |       6 | Kaylin Alba Burgundy                         |       77 |     7696.15 |
| Clarks Unstructured |      14 | Un Reisel Mara Black Leather                 |       54 |     4859.46 |
| Converse            |       1 | All Star Dainty Canvas Ox W Blanc Optical    |       65 |     3380.00 |
| Converse            |      21 | Chuck Taylor All Star Hi M Blanc Optical     |       79 |     5529.21 |
| Converse            |      22 | Star Player Ev Canvas Ox M Marine Blanc      |       65 |     3802.50 |
| Georgia Rose        |      12 | Inof Vaqueta Noir                            |       72 |     6408.00 |
| Georgia Rose        |      13 | Ipona Noir                                   |       67 |     3953.00 |
| I Love Shoes        |      16 | Benino Black                                 |       55 |     2145.00 |
| I Love Shoes        |       9 | Benino Gold                                  |       52 |     2028.00 |
| Les P'tites Bombes  |       8 | Petunia Noir                                 |       46 |     1375.40 |
| Marvin&Co           |      24 | Satingh Brown                                |       73 |     5767.00 |
| Marvin&Co           |      26 | Suttino Beige                                |       99 |     7821.00 |
| Mr SARENZA          |      27 | Nastie Bruciato                              |       79 |    11771.00 |
| Mr SARENZA          |      29 | Rilmot                                       |       90 |     8910.00 |
| Mr SARENZA          |      25 | Southampton Bleu                             |       64 |     6976.00 |
| Mr SARENZA          |      28 | Stall Brown                                  |       49 |     5831.00 |
| New Balance         |      10 | W996 Light Cashmere                          |       56 |     3920.00 |
| Nike                |      23 | Classic Cortez Nylon Obsidian White          |       76 |     6080.00 |
| Nike                |       3 | Wmns Air Huarache Run White White            |       64 |     7679.36 |
| Nike                |       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu |       68 |     5780.00 |
| Puma                |      20 | Suede Classic+ Peacoat White                 |       73 |     5840.00 |
| Puma                |      15 | Suede Hyper Embelished Wn's Black White      |       39 |     3510.00 |
+---------------------+---------+----------------------------------------------+----------+-------------+
29 rows in set (0.06 sec)*/


/* Marque stock */
select b.name as Marque, sum(st.stock) as Qt_Stock, sum(st.stock * p.price) as ValeurStock from product as p inner join brand as b on brand_id = b.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by Marque order by Marque;

select b.name as Marque, sum(st.stock) as Qt_Stock, sum(st.stock * p.price) as ValeurStock from product as p inner join brand as b on brand_id = b.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id where b.name="Adidas" group by Marque order by Marque;

/*
+---------------------+----------+-------------+
| Marque              | Qt_Stock | ValeurStock |
+---------------------+----------+-------------+
| Adidas              |      463 |    44177.99 |
| Clarks              |      115 |    11494.25 |
| Clarks Unstructured |       54 |     4859.46 |
| Converse            |      209 |    12711.71 |
| Georgia Rose        |      139 |    10361.00 |
| I Love Shoes        |      107 |     4173.00 |
| Les P'tites Bombes  |       46 |     1375.40 |
| Marvin&Co           |      172 |    13588.00 |
| Mr SARENZA          |      282 |    33488.00 |
| New Balance         |       56 |     3920.00 |
| Nike                |      208 |    19539.36 |
| Puma                |      112 |     9350.00 |
+---------------------+----------+-------------+
12 rows in set (0.03 sec)
*/

/* Marque categorie stock */
select b.name as Marque, ca.name as Categorie, sum(st.stock) as Qt_Stock, sum(st.stock * p.price) as ValeurStock from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by Marque, Categorie order by Marque, Categorie;

/*
+---------------------+----------------------+----------+-------------+
| Marque              | Categorie            | Qt_Stock | ValeurStock |
+---------------------+----------------------+----------+-------------+
| Adidas              | Baskets              |      463 |    44177.99 |
| Clarks              | Escarpins            |      115 |    11494.25 |
| Clarks Unstructured | Sandales et nu-pieds |       54 |     4859.46 |
| Converse            | Baskets              |      209 |    12711.71 |
| Georgia Rose        | Sandales et nu-pieds |      139 |    10361.00 |
| I Love Shoes        | Sandales et nu-pieds |      107 |     4173.00 |
| Les P'tites Bombes  | Sandales et nu-pieds |       46 |     1375.40 |
| Marvin&Co           | Chaussures à lacets  |      172 |    13588.00 |
| Mr SARENZA          | Chaussures à lacets  |      282 |    33488.00 |
| New Balance         | Baskets              |       56 |     3920.00 |
| Nike                | Baskets              |      208 |    19539.36 |
| Puma                | Baskets              |      112 |     9350.00 |
+---------------------+----------------------+----------+-------------+
12 rows in set (0.01 sec)
*/



/* Categorie stock */
select ca.name as Categorie, sum(st.stock) as Qt_Stock, sum(st.stock * p.price) as ValeurStock from product as p inner join category as ca on category_id=ca.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by Categorie order by Categorie;

/*
+----------------------+----------+-------------+
| Categorie            | Qt_Stock | ValeurStock |
+----------------------+----------+-------------+
| Baskets              |     1048 |    89699.06 |
| Chaussures à lacets  |      454 |    47076.00 |
| Escarpins            |      115 |    11494.25 |
| Sandales et nu-pieds |      346 |    20768.86 |
+----------------------+----------+-------------+
4 rows in set (0.01 sec)
*/



select p.id as ID_Prod, p.name as Produit, sum(st.stock) as Qt_Stock from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by ID_Prod, Produit order by ID_Prod;
/*
+---------+----------------------------------------------+----------+
| ID_Prod | Produit                                      | Qt_Stock |
+---------+----------------------------------------------+----------+
|       1 | All Star Dainty Canvas Ox W Blanc Optical    |       65 |
|       2 | Superstar W Blanc Noir                       |       75 |
|       3 | Wmns Air Huarache Run White White            |       64 |
|       4 | Gazelle W Rose Blanc                         |       69 |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu |       68 |
|       6 | Kaylin Alba Burgundy                         |       77 |
|       7 | Calla Rose Black                             |       38 |
|       8 | Petunia Noir                                 |       46 |
|       9 | Benino Gold                                  |       52 |
|      10 | W996 Light Cashmere                          |       56 |
|      11 | Gazelle W Gris Blanc                         |       55 |
|      12 | Inof Vaqueta Noir                            |       72 |
|      13 | Ipona Noir                                   |       67 |
|      14 | Un Reisel Mara Black Leather                 |       54 |
|      15 | Suede Hyper Embelished Wn's Black White      |       39 |
|      16 | Benino Black                                 |       55 |
|      17 | Stan Smith Noir                              |      133 |
|      18 | Stan Smith Blanc Vert                        |       62 |
|      19 | Superstar Blanc Noir                         |       69 |
|      20 | Suede Classic+ Peacoat White                 |       73 |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     |       79 |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      |       65 |
|      23 | Classic Cortez Nylon Obsidian White          |       76 |
|      24 | Satingh Brown                                |       73 |
|      25 | Southampton Bleu                             |       64 |
|      26 | Suttino Beige                                |       99 |
|      27 | Nastie Bruciato                              |       79 |
|      28 | Stall Brown                                  |       49 |
|      29 | Rilmot                                       |       90 |
+---------+----------------------------------------------+----------+
29 rows in set (0.01 sec)*/

select b.name as Marque, p.id as ID_Prod, p.name as Produit, sum(st.stock) as Qt_Stock, sum(st.stock * p.price) as ValeurStock from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id group by Marque, Produit, ID_Prod order by ID_Prod, Marque;
/*
+---------------------+---------+----------------------------------------------+----------+-------------+
| Marque              | ID_Prod | Produit                                      | Qt_Stock | ValeurStock |
+---------------------+---------+----------------------------------------------+----------+-------------+
| Converse            |       1 | All Star Dainty Canvas Ox W Blanc Optical    |       65 |     3380.00 |
| Adidas              |       2 | Superstar W Blanc Noir                       |       75 |     7499.25 |
| Nike                |       3 | Wmns Air Huarache Run White White            |       64 |     7679.36 |
| Adidas              |       4 | Gazelle W Rose Blanc                         |       69 |     6899.31 |
| Nike                |       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu |       68 |     5780.00 |
| Clarks              |       6 | Kaylin Alba Burgundy                         |       77 |     7696.15 |
| Clarks              |       7 | Calla Rose Black                             |       38 |     3798.10 |
| Les P'tites Bombes  |       8 | Petunia Noir                                 |       46 |     1375.40 |
| I Love Shoes        |       9 | Benino Gold                                  |       52 |     2028.00 |
| New Balance         |      10 | W996 Light Cashmere                          |       56 |     3920.00 |
| Adidas              |      11 | Gazelle W Gris Blanc                         |       55 |     5224.45 |
| Georgia Rose        |      12 | Inof Vaqueta Noir                            |       72 |     6408.00 |
| Georgia Rose        |      13 | Ipona Noir                                   |       67 |     3953.00 |
| Clarks Unstructured |      14 | Un Reisel Mara Black Leather                 |       54 |     4859.46 |
| Puma                |      15 | Suede Hyper Embelished Wn's Black White      |       39 |     3510.00 |
| I Love Shoes        |      16 | Benino Black                                 |       55 |     2145.00 |
| Adidas              |      17 | Stan Smith Noir                              |      133 |    12633.67 |
| Adidas              |      18 | Stan Smith Blanc Vert                        |       62 |     5022.00 |
| Adidas              |      19 | Superstar Blanc Noir                         |       69 |     6899.31 |
| Puma                |      20 | Suede Classic+ Peacoat White                 |       73 |     5840.00 |
| Converse            |      21 | Chuck Taylor All Star Hi M Blanc Optical     |       79 |     5529.21 |
| Converse            |      22 | Star Player Ev Canvas Ox M Marine Blanc      |       65 |     3802.50 |
| Nike                |      23 | Classic Cortez Nylon Obsidian White          |       76 |     6080.00 |
| Marvin&Co           |      24 | Satingh Brown                                |       73 |     5767.00 |
| Mr SARENZA          |      25 | Southampton Bleu                             |       64 |     6976.00 |
| Marvin&Co           |      26 | Suttino Beige                                |       99 |     7821.00 |
| Mr SARENZA          |      27 | Nastie Bruciato                              |       79 |    11771.00 |
| Mr SARENZA          |      28 | Stall Brown                                  |       49 |     5831.00 |
| Mr SARENZA          |      29 | Rilmot                                       |       90 |     8910.00 |
+---------------------+---------+----------------------------------------------+----------+-------------+
29 rows in set (0.00 sec)*/

/*Affichage des quantités en stock par produit avec case pour rupture de stock et qté restante 1 : 2 */
select p.id as ID_Prod, p.name as Produit, si.name as Taille, st.stock as Qt_Stock,
CASE st.stock
when 0 then 'Rupture de stock pour cette taille'
when 1 then 'Plus que 1 article restant !'
when 2 then 'Plus que 2 articles restants !'
else 'article disponible pour cette taille'
end as Etat_Stock
from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id order by Produit, Taille;

/*
select p.id as ID_Prod, p.name as Produit, si.name as Taille, st.stock as Qt_Stock,
    -> CASE st.stock
    -> when 0 then 'Rupture de stock'
    -> when 1 then 'Plus que 1 article restant !'
    -> when 2 then 'Plus que 2 articles restants !'
    -> else 'article disponible'
    -> end as Etat_Stock
    -> from product as p inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id order by Produit, Taille;
+---------+----------------------------------------------+--------+----------+--------------------------------------+
| ID_Prod | Produit                                      | Taille | Qt_Stock | Etat_Stock                           |
+---------+----------------------------------------------+--------+----------+--------------------------------------+
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 35 1/2 |        2 | Plus que 2 articles restants !       |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 36     |        8 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 36 1/2 |        0 | Rupture de stock pour cette taille   |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 37     |        9 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 38     |        4 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 38 1/2 |        8 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 39 1/2 |        3 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 40     |       10 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 40 1/2 |        8 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 41     |        0 | Rupture de stock pour cette taille   |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 41 1/2 |        5 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 42     |        5 | article disponible pour cette taille |
|       1 | All Star Dainty Canvas Ox W Blanc Optical    | 42 1/2 |        3 | article disponible pour cette taille |
|      16 | Benino Black                                 | 36     |        8 | article disponible pour cette taille |
|      16 | Benino Black                                 | 37 1/2 |        7 | article disponible pour cette taille |
|      16 | Benino Black                                 | 38     |        3 | article disponible pour cette taille |
|      16 | Benino Black                                 | 39     |        6 | article disponible pour cette taille |
|      16 | Benino Black                                 | 39 1/2 |        4 | article disponible pour cette taille |
|      16 | Benino Black                                 | 40     |        5 | article disponible pour cette taille |
|      16 | Benino Black                                 | 40 1/2 |        5 | article disponible pour cette taille |
|      16 | Benino Black                                 | 41     |        9 | article disponible pour cette taille |
|      16 | Benino Black                                 | 42     |        8 | article disponible pour cette taille |
|       9 | Benino Gold                                  | 35 1/2 |        0 | Rupture de stock pour cette taille   |
|       9 | Benino Gold                                  | 36     |        2 | Plus que 2 articles restants !       |
|       9 | Benino Gold                                  | 36 1/2 |        8 | article disponible pour cette taille |
|       9 | Benino Gold                                  | 37 1/2 |        3 | article disponible pour cette taille |
|       9 | Benino Gold                                  | 38 1/2 |        9 | article disponible pour cette taille |
|       9 | Benino Gold                                  | 39     |        9 | article disponible pour cette taille |
|       9 | Benino Gold                                  | 39 1/2 |        9 | article disponible pour cette taille |
|       9 | Benino Gold                                  | 40     |        2 | Plus que 2 articles restants !       |
|       9 | Benino Gold                                  | 40 1/2 |        1 | Plus que 1 article restant !         |
|       9 | Benino Gold                                  | 41 1/2 |        1 | Plus que 1 article restant !         |
|       9 | Benino Gold                                  | 42     |        0 | Rupture de stock pour cette taille   |
|       9 | Benino Gold                                  | 42 1/2 |        8 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 35 1/2 |        3 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 36     |        2 | Plus que 2 articles restants !       |
|       7 | Calla Rose Black                             | 36 1/2 |        5 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 37     |        5 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 37 1/2 |        6 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 38     |        0 | Rupture de stock pour cette taille   |
|       7 | Calla Rose Black                             | 38 1/2 |        6 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 39     |        2 | Plus que 2 articles restants !       |
|       7 | Calla Rose Black                             | 41     |        8 | article disponible pour cette taille |
|       7 | Calla Rose Black                             | 42 1/2 |        1 | Plus que 1 article restant !         |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 39     |        1 | Plus que 1 article restant !         |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 40     |       10 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 40 1/2 |        4 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 41     |        2 | Plus que 2 articles restants !       |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 41 1/2 |        7 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 42 1/2 |        4 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 43     |        9 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 43 1/2 |        4 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 44     |        1 | Plus que 1 article restant !         |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 44 1/2 |        1 | Plus que 1 article restant !         |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 45     |        7 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 45 1/2 |        9 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 46 1/2 |        2 | Plus que 2 articles restants !       |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 47 1/2 |        8 | article disponible pour cette taille |
|      21 | Chuck Taylor All Star Hi M Blanc Optical     | 48     |       10 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 38     |        3 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 38 1/2 |        8 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 39     |        3 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 40 1/2 |        7 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 41     |        1 | Plus que 1 article restant !         |
|      23 | Classic Cortez Nylon Obsidian White          | 41 1/2 |        8 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 42 1/2 |        7 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 43     |        5 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 43 1/2 |        2 | Plus que 2 articles restants !       |
|      23 | Classic Cortez Nylon Obsidian White          | 45     |        7 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 45 1/2 |        0 | Rupture de stock pour cette taille   |
|      23 | Classic Cortez Nylon Obsidian White          | 46     |        3 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 46 1/2 |        6 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 47     |        9 | article disponible pour cette taille |
|      23 | Classic Cortez Nylon Obsidian White          | 47 1/2 |        0 | Rupture de stock pour cette taille   |
|      23 | Classic Cortez Nylon Obsidian White          | 48     |        7 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 35 1/2 |        8 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 36     |        5 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 36 1/2 |        4 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 38 1/2 |        3 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 39 1/2 |       10 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 40     |        2 | Plus que 2 articles restants !       |
|      11 | Gazelle W Gris Blanc                         | 40 1/2 |        6 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 41 1/2 |        7 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 42     |       10 | article disponible pour cette taille |
|      11 | Gazelle W Gris Blanc                         | 42 1/2 |        0 | Rupture de stock pour cette taille   |
|       4 | Gazelle W Rose Blanc                         | 35     |        6 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 35 1/2 |        7 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 36 1/2 |        8 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 37 1/2 |       10 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 38 1/2 |        5 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 39     |        5 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 39 1/2 |        3 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 40     |        2 | Plus que 2 articles restants !       |
|       4 | Gazelle W Rose Blanc                         | 40 1/2 |        9 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 42     |        6 | article disponible pour cette taille |
|       4 | Gazelle W Rose Blanc                         | 42 1/2 |        8 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 35     |        6 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 35 1/2 |        7 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 36     |        8 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 37     |        4 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 38     |        9 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 38 1/2 |        2 | Plus que 2 articles restants !       |
|      12 | Inof Vaqueta Noir                            | 39     |        9 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 39 1/2 |        2 | Plus que 2 articles restants !       |
|      12 | Inof Vaqueta Noir                            | 40     |        4 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 40 1/2 |        3 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 41     |        5 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 41 1/2 |        4 | article disponible pour cette taille |
|      12 | Inof Vaqueta Noir                            | 42     |        9 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 35 1/2 |        6 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 36     |        9 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 36 1/2 |        8 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 38     |        2 | Plus que 2 articles restants !       |
|      13 | Ipona Noir                                   | 38 1/2 |        4 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 39     |        3 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 39 1/2 |       10 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 40     |        0 | Rupture de stock pour cette taille   |
|      13 | Ipona Noir                                   | 40 1/2 |        4 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 41     |        8 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 41 1/2 |        4 | article disponible pour cette taille |
|      13 | Ipona Noir                                   | 42     |        9 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 35     |       10 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 35 1/2 |        2 | Plus que 2 articles restants !       |
|       6 | Kaylin Alba Burgundy                         | 36     |        5 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 36 1/2 |        2 | Plus que 2 articles restants !       |
|       6 | Kaylin Alba Burgundy                         | 37     |        3 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 37 1/2 |        7 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 38     |        9 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 38 1/2 |       10 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 39     |        5 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 39 1/2 |       10 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 40     |        7 | article disponible pour cette taille |
|       6 | Kaylin Alba Burgundy                         | 41     |        1 | Plus que 1 article restant !         |
|       6 | Kaylin Alba Burgundy                         | 42     |        6 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 38     |        9 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 38 1/2 |        0 | Rupture de stock pour cette taille   |
|      27 | Nastie Bruciato                              | 39     |        5 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 39 1/2 |        9 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 41     |       10 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 42     |        4 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 43     |        8 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 44     |        4 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 45     |       10 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 45 1/2 |        2 | Plus que 2 articles restants !       |
|      27 | Nastie Bruciato                              | 46     |        9 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 46 1/2 |        0 | Rupture de stock pour cette taille   |
|      27 | Nastie Bruciato                              | 47     |        2 | Plus que 2 articles restants !       |
|      27 | Nastie Bruciato                              | 47 1/2 |        6 | article disponible pour cette taille |
|      27 | Nastie Bruciato                              | 48     |        1 | Plus que 1 article restant !         |
|       8 | Petunia Noir                                 | 35     |        3 | article disponible pour cette taille |
|       8 | Petunia Noir                                 | 35 1/2 |        0 | Rupture de stock pour cette taille   |
|       8 | Petunia Noir                                 | 36     |        9 | article disponible pour cette taille |
|       8 | Petunia Noir                                 | 36 1/2 |        7 | article disponible pour cette taille |
|       8 | Petunia Noir                                 | 37     |        3 | article disponible pour cette taille |
|       8 | Petunia Noir                                 | 39     |        2 | Plus que 2 articles restants !       |
|       8 | Petunia Noir                                 | 39 1/2 |        0 | Rupture de stock pour cette taille   |
|       8 | Petunia Noir                                 | 40     |        2 | Plus que 2 articles restants !       |
|       8 | Petunia Noir                                 | 40 1/2 |        0 | Rupture de stock pour cette taille   |
|       8 | Petunia Noir                                 | 41     |        8 | article disponible pour cette taille |
|       8 | Petunia Noir                                 | 42     |        8 | article disponible pour cette taille |
|       8 | Petunia Noir                                 | 42 1/2 |        4 | article disponible pour cette taille |
|      29 | Rilmot                                       | 38     |        3 | article disponible pour cette taille |
|      29 | Rilmot                                       | 38 1/2 |        1 | Plus que 1 article restant !         |
|      29 | Rilmot                                       | 39 1/2 |       10 | article disponible pour cette taille |
|      29 | Rilmot                                       | 40     |        9 | article disponible pour cette taille |
|      29 | Rilmot                                       | 40 1/2 |        8 | article disponible pour cette taille |
|      29 | Rilmot                                       | 41     |        8 | article disponible pour cette taille |
|      29 | Rilmot                                       | 41 1/2 |        0 | Rupture de stock pour cette taille   |
|      29 | Rilmot                                       | 42     |        7 | article disponible pour cette taille |
|      29 | Rilmot                                       | 42 1/2 |        6 | article disponible pour cette taille |
|      29 | Rilmot                                       | 43     |        2 | Plus que 2 articles restants !       |
|      29 | Rilmot                                       | 43 1/2 |        9 | article disponible pour cette taille |
|      29 | Rilmot                                       | 44     |        0 | Rupture de stock pour cette taille   |
|      29 | Rilmot                                       | 45     |        7 | article disponible pour cette taille |
|      29 | Rilmot                                       | 45 1/2 |        9 | article disponible pour cette taille |
|      29 | Rilmot                                       | 46     |        4 | article disponible pour cette taille |
|      29 | Rilmot                                       | 46 1/2 |        4 | article disponible pour cette taille |
|      29 | Rilmot                                       | 47     |        2 | Plus que 2 articles restants !       |
|      29 | Rilmot                                       | 47 1/2 |        1 | Plus que 1 article restant !         |
|      24 | Satingh Brown                                | 38     |       10 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 38 1/2 |        5 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 39 1/2 |        2 | Plus que 2 articles restants !       |
|      24 | Satingh Brown                                | 40     |        0 | Rupture de stock pour cette taille   |
|      24 | Satingh Brown                                | 40 1/2 |        0 | Rupture de stock pour cette taille   |
|      24 | Satingh Brown                                | 41     |        6 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 41 1/2 |        1 | Plus que 1 article restant !         |
|      24 | Satingh Brown                                | 42     |        7 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 42 1/2 |        4 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 43     |        8 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 43 1/2 |        3 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 44     |        3 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 44 1/2 |        2 | Plus que 2 articles restants !       |
|      24 | Satingh Brown                                | 45 1/2 |        4 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 46     |        1 | Plus que 1 article restant !         |
|      24 | Satingh Brown                                | 46 1/2 |        1 | Plus que 1 article restant !         |
|      24 | Satingh Brown                                | 47     |        9 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 47 1/2 |        5 | article disponible pour cette taille |
|      24 | Satingh Brown                                | 48     |        2 | Plus que 2 articles restants !       |
|      25 | Southampton Bleu                             | 38     |        6 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 40 1/2 |        6 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 41     |        3 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 41 1/2 |        8 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 42     |        0 | Rupture de stock pour cette taille   |
|      25 | Southampton Bleu                             | 42 1/2 |        8 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 43     |        6 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 43 1/2 |        4 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 44 1/2 |        1 | Plus que 1 article restant !         |
|      25 | Southampton Bleu                             | 45     |        4 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 45 1/2 |        1 | Plus que 1 article restant !         |
|      25 | Southampton Bleu                             | 46 1/2 |        6 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 47     |        3 | article disponible pour cette taille |
|      25 | Southampton Bleu                             | 47 1/2 |        8 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 38 1/2 |        8 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 39     |        0 | Rupture de stock pour cette taille   |
|      28 | Stall Brown                                  | 39 1/2 |        6 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 40     |        5 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 40 1/2 |        7 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 41 1/2 |        1 | Plus que 1 article restant !         |
|      28 | Stall Brown                                  | 42     |        0 | Rupture de stock pour cette taille   |
|      28 | Stall Brown                                  | 42 1/2 |        1 | Plus que 1 article restant !         |
|      28 | Stall Brown                                  | 43     |        0 | Rupture de stock pour cette taille   |
|      28 | Stall Brown                                  | 43 1/2 |        0 | Rupture de stock pour cette taille   |
|      28 | Stall Brown                                  | 44     |        2 | Plus que 2 articles restants !       |
|      28 | Stall Brown                                  | 44 1/2 |        3 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 45 1/2 |        5 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 46     |        1 | Plus que 1 article restant !         |
|      28 | Stall Brown                                  | 46 1/2 |        0 | Rupture de stock pour cette taille   |
|      28 | Stall Brown                                  | 47     |        3 | article disponible pour cette taille |
|      28 | Stall Brown                                  | 47 1/2 |        7 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 38 1/2 |       10 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 39     |        5 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 39 1/2 |        1 | Plus que 1 article restant !         |
|      18 | Stan Smith Blanc Vert                        | 40     |        6 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 40 1/2 |        3 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 41 1/2 |        5 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 42     |        1 | Plus que 1 article restant !         |
|      18 | Stan Smith Blanc Vert                        | 43 1/2 |        5 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 44     |        0 | Rupture de stock pour cette taille   |
|      18 | Stan Smith Blanc Vert                        | 44 1/2 |        7 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 46     |        8 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 47     |        4 | article disponible pour cette taille |
|      18 | Stan Smith Blanc Vert                        | 47 1/2 |        0 | Rupture de stock pour cette taille   |
|      18 | Stan Smith Blanc Vert                        | 48     |        7 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 38     |        9 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 38 1/2 |       10 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 39     |        7 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 39 1/2 |        3 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 40     |        5 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 40 1/2 |       10 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 41     |       10 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 41 1/2 |        6 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 42     |       10 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 42 1/2 |        8 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 43     |        7 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 43 1/2 |       10 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 44     |        6 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 44 1/2 |        9 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 46     |        3 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 47     |        7 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 47 1/2 |       10 | article disponible pour cette taille |
|      17 | Stan Smith Noir                              | 48     |        3 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 39     |        1 | Plus que 1 article restant !         |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 39 1/2 |        8 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 41     |        1 | Plus que 1 article restant !         |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 41 1/2 |        5 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 43     |        9 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 43 1/2 |        7 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 44     |        4 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 44 1/2 |        5 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 45     |        7 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 46     |        2 | Plus que 2 articles restants !       |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 47     |        2 | Plus que 2 articles restants !       |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 47 1/2 |        4 | article disponible pour cette taille |
|      22 | Star Player Ev Canvas Ox M Marine Blanc      | 48     |       10 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 38     |        4 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 38 1/2 |        5 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 39     |        9 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 39 1/2 |        3 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 40     |        4 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 41     |        1 | Plus que 1 article restant !         |
|      20 | Suede Classic+ Peacoat White                 | 41 1/2 |        3 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 42     |       10 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 42 1/2 |        3 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 43     |        6 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 43 1/2 |        8 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 45     |        2 | Plus que 2 articles restants !       |
|      20 | Suede Classic+ Peacoat White                 | 45 1/2 |       10 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 46     |        0 | Rupture de stock pour cette taille   |
|      20 | Suede Classic+ Peacoat White                 | 47 1/2 |        3 | article disponible pour cette taille |
|      20 | Suede Classic+ Peacoat White                 | 48     |        2 | Plus que 2 articles restants !       |
|      15 | Suede Hyper Embelished Wn's Black White      | 35     |        5 | article disponible pour cette taille |
|      15 | Suede Hyper Embelished Wn's Black White      | 35 1/2 |        0 | Rupture de stock pour cette taille   |
|      15 | Suede Hyper Embelished Wn's Black White      | 36 1/2 |        2 | Plus que 2 articles restants !       |
|      15 | Suede Hyper Embelished Wn's Black White      | 37     |        2 | Plus que 2 articles restants !       |
|      15 | Suede Hyper Embelished Wn's Black White      | 37 1/2 |        0 | Rupture de stock pour cette taille   |
|      15 | Suede Hyper Embelished Wn's Black White      | 38     |        3 | article disponible pour cette taille |
|      15 | Suede Hyper Embelished Wn's Black White      | 38 1/2 |        5 | article disponible pour cette taille |
|      15 | Suede Hyper Embelished Wn's Black White      | 39     |        2 | Plus que 2 articles restants !       |
|      15 | Suede Hyper Embelished Wn's Black White      | 39 1/2 |       10 | article disponible pour cette taille |
|      15 | Suede Hyper Embelished Wn's Black White      | 40     |        6 | article disponible pour cette taille |
|      15 | Suede Hyper Embelished Wn's Black White      | 40 1/2 |        3 | article disponible pour cette taille |
|      15 | Suede Hyper Embelished Wn's Black White      | 41     |        1 | Plus que 1 article restant !         |
|      15 | Suede Hyper Embelished Wn's Black White      | 42 1/2 |        0 | Rupture de stock pour cette taille   |
|      19 | Superstar Blanc Noir                         | 39     |        4 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 39 1/2 |        2 | Plus que 2 articles restants !       |
|      19 | Superstar Blanc Noir                         | 40 1/2 |        2 | Plus que 2 articles restants !       |
|      19 | Superstar Blanc Noir                         | 41 1/2 |        5 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 43     |        4 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 43 1/2 |        9 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 44     |        5 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 44 1/2 |        5 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 45     |        9 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 45 1/2 |        9 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 46 1/2 |        2 | Plus que 2 articles restants !       |
|      19 | Superstar Blanc Noir                         | 47 1/2 |        7 | article disponible pour cette taille |
|      19 | Superstar Blanc Noir                         | 48     |        6 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 35     |        5 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 37     |        7 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 37 1/2 |        4 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 38     |        0 | Rupture de stock pour cette taille   |
|       2 | Superstar W Blanc Noir                       | 38 1/2 |        3 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 39     |        9 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 39 1/2 |        8 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 40     |        3 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 40 1/2 |        8 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 41     |       10 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 41 1/2 |       10 | article disponible pour cette taille |
|       2 | Superstar W Blanc Noir                       | 42     |        8 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 38     |        3 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 38 1/2 |        8 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 39 1/2 |       10 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 40     |        9 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 40 1/2 |        6 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 41     |        8 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 41 1/2 |        2 | Plus que 2 articles restants !       |
|      26 | Suttino Beige                                | 42 1/2 |       10 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 43     |        0 | Rupture de stock pour cette taille   |
|      26 | Suttino Beige                                | 43 1/2 |        6 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 44     |        2 | Plus que 2 articles restants !       |
|      26 | Suttino Beige                                | 44 1/2 |        8 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 45     |        4 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 45 1/2 |        3 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 46     |        4 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 46 1/2 |        5 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 47     |        6 | article disponible pour cette taille |
|      26 | Suttino Beige                                | 47 1/2 |        0 | Rupture de stock pour cette taille   |
|      26 | Suttino Beige                                | 48     |        5 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 35     |        2 | Plus que 2 articles restants !       |
|      14 | Un Reisel Mara Black Leather                 | 35 1/2 |        3 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 36 1/2 |        9 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 37     |        5 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 37 1/2 |        9 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 38     |        8 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 39     |        3 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 39 1/2 |        3 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 40     |        8 | article disponible pour cette taille |
|      14 | Un Reisel Mara Black Leather                 | 40 1/2 |        4 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 35     |       10 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 36 1/2 |        8 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 37     |        8 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 37 1/2 |        0 | Rupture de stock pour cette taille   |
|      10 | W996 Light Cashmere                          | 38     |        3 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 38 1/2 |        0 | Rupture de stock pour cette taille   |
|      10 | W996 Light Cashmere                          | 39     |       10 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 39 1/2 |        7 | article disponible pour cette taille |
|      10 | W996 Light Cashmere                          | 41     |        1 | Plus que 1 article restant !         |
|      10 | W996 Light Cashmere                          | 42 1/2 |        9 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 35     |        0 | Rupture de stock pour cette taille   |
|       3 | Wmns Air Huarache Run White White            | 36 1/2 |        1 | Plus que 1 article restant !         |
|       3 | Wmns Air Huarache Run White White            | 37     |        9 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 37 1/2 |        7 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 38     |        1 | Plus que 1 article restant !         |
|       3 | Wmns Air Huarache Run White White            | 38 1/2 |        7 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 39     |        9 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 39 1/2 |       10 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 40 1/2 |        7 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 41 1/2 |        2 | Plus que 2 articles restants !       |
|       3 | Wmns Air Huarache Run White White            | 42     |        4 | article disponible pour cette taille |
|       3 | Wmns Air Huarache Run White White            | 42 1/2 |        7 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 35     |        7 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 35 1/2 |        7 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 36     |        5 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 36 1/2 |        5 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 37     |        3 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 37 1/2 |        5 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 38     |        6 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 38 1/2 |        9 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 39     |        8 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 40 1/2 |        1 | Plus que 1 article restant !         |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 41 1/2 |        6 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 42     |        3 | article disponible pour cette taille |
|       5 | Wmns Classic Cortez Leather Blanc Rouge Bleu | 42 1/2 |        3 | article disponible pour cette taille |
+---------+----------------------------------------------+--------+----------+--------------------------------------+
392 rows in set (0.01 sec)*/


/* affichage stock avec marque, categorie et produit*/

select b.name as Marque, ca.name as Categorie, co.name as Couleur, p.name as Produit, p.id as ID_Prod, p.gender as Genre, si.name as Taille, st.stock as Qt_Stock,
CASE st.stock
	when 0 then 'Rupture de stock'
	when 1 then 'Plus que 1 seul article disponible !'
	when 2 then 'Plus que 2 articles disponibles !'
	else 'article disponible'
	end as Etat_Stock
from product as p inner join category as ca on category_id=ca.id inner join brand as b on brand_id = b.id inner join color as co on color_id=co.id inner join stock as st on p.id= st.product_id inner join size as si on st.size_id = si.id order by Marque, Categorie, Couleur, Produit, Taille;
/*
+---------------------+----------------------+---------+----------------------------------------------+---------+-------+--------+----------+--------------------------------------+
| Marque              | Categorie            | Couleur | Produit                                      | ID_Prod | Genre | Taille | Qt_Stock | Etat_Stock                           |
+---------------------+----------------------+---------+----------------------------------------------+---------+-------+--------+----------+--------------------------------------+
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 38 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 39     |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 39 1/2 |        1 | Plus que 1 seul article disponible ! |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 40     |        6 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 40 1/2 |        3 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 41 1/2 |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 42     |        1 | Plus que 1 seul article disponible ! |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 43 1/2 |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 44     |        0 | Rupture de stock                     |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 44 1/2 |        7 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 46     |        8 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 47     |        4 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 47 1/2 |        0 | Rupture de stock                     |
| Adidas              | Baskets              | Blanc   | Stan Smith Blanc Vert                        |      18 | H     | 48     |        7 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 39     |        4 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 39 1/2 |        2 | Plus que 2 articles disponibles !    |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 40 1/2 |        2 | Plus que 2 articles disponibles !    |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 41 1/2 |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 43     |        4 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 43 1/2 |        9 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 44     |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 44 1/2 |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 45     |        9 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 45 1/2 |        9 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 46 1/2 |        2 | Plus que 2 articles disponibles !    |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 47 1/2 |        7 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar Blanc Noir                         |      19 | H     | 48     |        6 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 35     |        5 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 37     |        7 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 37 1/2 |        4 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 38     |        0 | Rupture de stock                     |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 38 1/2 |        3 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 39     |        9 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 39 1/2 |        8 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 40     |        3 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 40 1/2 |        8 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 41     |       10 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 41 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Blanc   | Superstar W Blanc Noir                       |       2 | F     | 42     |        8 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 35 1/2 |        8 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 36     |        5 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 36 1/2 |        4 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 38 1/2 |        3 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 39 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 40     |        2 | Plus que 2 articles disponibles !    |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 40 1/2 |        6 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 41 1/2 |        7 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 42     |       10 | article disponible                   |
| Adidas              | Baskets              | Gris    | Gazelle W Gris Blanc                         |      11 | F     | 42 1/2 |        0 | Rupture de stock                     |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 38     |        9 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 38 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 39     |        7 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 39 1/2 |        3 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 40     |        5 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 40 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 41     |       10 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 41 1/2 |        6 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 42     |       10 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 42 1/2 |        8 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 43     |        7 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 43 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 44     |        6 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 44 1/2 |        9 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 46     |        3 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 47     |        7 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 47 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Noir    | Stan Smith Noir                              |      17 | H     | 48     |        3 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 35     |        6 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 35 1/2 |        7 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 36 1/2 |        8 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 37 1/2 |       10 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 38 1/2 |        5 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 39     |        5 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 39 1/2 |        3 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 40     |        2 | Plus que 2 articles disponibles !    |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 40 1/2 |        9 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 42     |        6 | article disponible                   |
| Adidas              | Baskets              | Rose    | Gazelle W Rose Blanc                         |       4 | F     | 42 1/2 |        8 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 35 1/2 |        3 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 36     |        2 | Plus que 2 articles disponibles !    |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 36 1/2 |        5 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 37     |        5 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 37 1/2 |        6 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 38     |        0 | Rupture de stock                     |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 38 1/2 |        6 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 39     |        2 | Plus que 2 articles disponibles !    |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 41     |        8 | article disponible                   |
| Clarks              | Escarpins            | Noir    | Calla Rose Black                             |       7 | F     | 42 1/2 |        1 | Plus que 1 seul article disponible ! |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 35     |       10 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 35 1/2 |        2 | Plus que 2 articles disponibles !    |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 36     |        5 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 36 1/2 |        2 | Plus que 2 articles disponibles !    |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 37     |        3 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 37 1/2 |        7 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 38     |        9 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 38 1/2 |       10 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 39     |        5 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 39 1/2 |       10 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 40     |        7 | article disponible                   |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 41     |        1 | Plus que 1 seul article disponible ! |
| Clarks              | Escarpins            | Rouge   | Kaylin Alba Burgundy                         |       6 | F     | 42     |        6 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 35     |        2 | Plus que 2 articles disponibles !    |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 35 1/2 |        3 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 36 1/2 |        9 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 37     |        5 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 37 1/2 |        9 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 38     |        8 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 39     |        3 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 39 1/2 |        3 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 40     |        8 | article disponible                   |
| Clarks Unstructured | Sandales et nu-pieds | Noir    | Un Reisel Mara Black Leather                 |      14 | F     | 40 1/2 |        4 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 35 1/2 |        2 | Plus que 2 articles disponibles !    |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 36     |        8 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 36 1/2 |        0 | Rupture de stock                     |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 37     |        9 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 38     |        4 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 38 1/2 |        8 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 39 1/2 |        3 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 40     |       10 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 40 1/2 |        8 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 41     |        0 | Rupture de stock                     |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 41 1/2 |        5 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 42     |        5 | article disponible                   |
| Converse            | Baskets              | Blanc   | All Star Dainty Canvas Ox W Blanc Optical    |       1 | F     | 42 1/2 |        3 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 39     |        1 | Plus que 1 seul article disponible ! |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 40     |       10 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 40 1/2 |        4 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 41     |        2 | Plus que 2 articles disponibles !    |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 41 1/2 |        7 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 42 1/2 |        4 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 43     |        9 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 43 1/2 |        4 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 44     |        1 | Plus que 1 seul article disponible ! |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 44 1/2 |        1 | Plus que 1 seul article disponible ! |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 45     |        7 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 45 1/2 |        9 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 46 1/2 |        2 | Plus que 2 articles disponibles !    |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 47 1/2 |        8 | article disponible                   |
| Converse            | Baskets              | Blanc   | Chuck Taylor All Star Hi M Blanc Optical     |      21 | M     | 48     |       10 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 39     |        1 | Plus que 1 seul article disponible ! |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 39 1/2 |        8 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 41     |        1 | Plus que 1 seul article disponible ! |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 41 1/2 |        5 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 43     |        9 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 43 1/2 |        7 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 44     |        4 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 44 1/2 |        5 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 45     |        7 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 46     |        2 | Plus que 2 articles disponibles !    |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 47     |        2 | Plus que 2 articles disponibles !    |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 47 1/2 |        4 | article disponible                   |
| Converse            | Baskets              | Bleu    | Star Player Ev Canvas Ox M Marine Blanc      |      22 | H     | 48     |       10 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 35     |        6 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 35 1/2 |        7 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 36     |        8 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 37     |        4 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 38     |        9 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 38 1/2 |        2 | Plus que 2 articles disponibles !    |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 39     |        9 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 39 1/2 |        2 | Plus que 2 articles disponibles !    |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 40     |        4 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 40 1/2 |        3 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 41     |        5 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 41 1/2 |        4 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Inof Vaqueta Noir                            |      12 | F     | 42     |        9 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 35 1/2 |        6 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 36     |        9 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 36 1/2 |        8 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 38     |        2 | Plus que 2 articles disponibles !    |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 38 1/2 |        4 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 39     |        3 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 39 1/2 |       10 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 40     |        0 | Rupture de stock                     |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 40 1/2 |        4 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 41     |        8 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 41 1/2 |        4 | article disponible                   |
| Georgia Rose        | Sandales et nu-pieds | Noir    | Ipona Noir                                   |      13 | F     | 42     |        9 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 35 1/2 |        0 | Rupture de stock                     |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 36     |        2 | Plus que 2 articles disponibles !    |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 36 1/2 |        8 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 37 1/2 |        3 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 38 1/2 |        9 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 39     |        9 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 39 1/2 |        9 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 40     |        2 | Plus que 2 articles disponibles !    |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 40 1/2 |        1 | Plus que 1 seul article disponible ! |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 41 1/2 |        1 | Plus que 1 seul article disponible ! |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 42     |        0 | Rupture de stock                     |
| I Love Shoes        | Sandales et nu-pieds | Marron  | Benino Gold                                  |       9 | F     | 42 1/2 |        8 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 36     |        8 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 37 1/2 |        7 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 38     |        3 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 39     |        6 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 39 1/2 |        4 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 40     |        5 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 40 1/2 |        5 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 41     |        9 | article disponible                   |
| I Love Shoes        | Sandales et nu-pieds | Noir    | Benino Black                                 |      16 | F     | 42     |        8 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 35     |        3 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 35 1/2 |        0 | Rupture de stock                     |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 36     |        9 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 36 1/2 |        7 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 37     |        3 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 39     |        2 | Plus que 2 articles disponibles !    |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 39 1/2 |        0 | Rupture de stock                     |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 40     |        2 | Plus que 2 articles disponibles !    |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 40 1/2 |        0 | Rupture de stock                     |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 41     |        8 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 42     |        8 | article disponible                   |
| Les P'tites Bombes  | Sandales et nu-pieds | Noir    | Petunia Noir                                 |       8 | F     | 42 1/2 |        4 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 38     |        3 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 38 1/2 |        8 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 39 1/2 |       10 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 40     |        9 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 40 1/2 |        6 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 41     |        8 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 41 1/2 |        2 | Plus que 2 articles disponibles !    |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 42 1/2 |       10 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 43     |        0 | Rupture de stock                     |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 43 1/2 |        6 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 44     |        2 | Plus que 2 articles disponibles !    |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 44 1/2 |        8 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 45     |        4 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 45 1/2 |        3 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 46     |        4 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 46 1/2 |        5 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 47     |        6 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 47 1/2 |        0 | Rupture de stock                     |
| Marvin&Co           | Chaussures à lacets  | Beige   | Suttino Beige                                |      26 | H     | 48     |        5 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 38     |       10 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 38 1/2 |        5 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 39 1/2 |        2 | Plus que 2 articles disponibles !    |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 40     |        0 | Rupture de stock                     |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 40 1/2 |        0 | Rupture de stock                     |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 41     |        6 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 41 1/2 |        1 | Plus que 1 seul article disponible ! |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 42     |        7 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 42 1/2 |        4 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 43     |        8 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 43 1/2 |        3 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 44     |        3 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 44 1/2 |        2 | Plus que 2 articles disponibles !    |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 45 1/2 |        4 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 46     |        1 | Plus que 1 seul article disponible ! |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 46 1/2 |        1 | Plus que 1 seul article disponible ! |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 47     |        9 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 47 1/2 |        5 | article disponible                   |
| Marvin&Co           | Chaussures à lacets  | Marron  | Satingh Brown                                |      24 | H     | 48     |        2 | Plus que 2 articles disponibles !    |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 38     |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 40 1/2 |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 41     |        3 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 41 1/2 |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 42     |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 42 1/2 |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 43     |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 43 1/2 |        4 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 44 1/2 |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 45     |        4 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 45 1/2 |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 46 1/2 |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 47     |        3 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Bleu    | Southampton Bleu                             |      25 | H     | 47 1/2 |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 38     |        9 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 38 1/2 |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 39     |        5 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 39 1/2 |        9 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 41     |       10 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 42     |        4 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 43     |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 44     |        4 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 45     |       10 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 45 1/2 |        2 | Plus que 2 articles disponibles !    |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 46     |        9 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 46 1/2 |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 47     |        2 | Plus que 2 articles disponibles !    |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 47 1/2 |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Nastie Bruciato                              |      27 | H     | 48     |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 38     |        3 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 38 1/2 |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 39 1/2 |       10 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 40     |        9 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 40 1/2 |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 41     |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 41 1/2 |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 42     |        7 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 42 1/2 |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 43     |        2 | Plus que 2 articles disponibles !    |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 43 1/2 |        9 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 44     |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 45     |        7 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 45 1/2 |        9 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 46     |        4 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 46 1/2 |        4 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 47     |        2 | Plus que 2 articles disponibles !    |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Rilmot                                       |      29 | H     | 47 1/2 |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 38 1/2 |        8 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 39     |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 39 1/2 |        6 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 40     |        5 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 40 1/2 |        7 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 41 1/2 |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 42     |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 42 1/2 |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 43     |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 43 1/2 |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 44     |        2 | Plus que 2 articles disponibles !    |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 44 1/2 |        3 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 45 1/2 |        5 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 46     |        1 | Plus que 1 seul article disponible ! |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 46 1/2 |        0 | Rupture de stock                     |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 47     |        3 | article disponible                   |
| Mr SARENZA          | Chaussures à lacets  | Marron  | Stall Brown                                  |      28 | H     | 47 1/2 |        7 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 35     |       10 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 36 1/2 |        8 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 37     |        8 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 37 1/2 |        0 | Rupture de stock                     |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 38     |        3 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 38 1/2 |        0 | Rupture de stock                     |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 39     |       10 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 39 1/2 |        7 | article disponible                   |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 41     |        1 | Plus que 1 seul article disponible ! |
| New Balance         | Baskets              | Rose    | W996 Light Cashmere                          |      10 | F     | 42 1/2 |        9 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 35     |        0 | Rupture de stock                     |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 36 1/2 |        1 | Plus que 1 seul article disponible ! |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 37     |        9 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 37 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 38     |        1 | Plus que 1 seul article disponible ! |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 38 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 39     |        9 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 39 1/2 |       10 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 40 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 41 1/2 |        2 | Plus que 2 articles disponibles !    |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 42     |        4 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Air Huarache Run White White            |       3 | F     | 42 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 35     |        7 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 35 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 36     |        5 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 36 1/2 |        5 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 37     |        3 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 37 1/2 |        5 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 38     |        6 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 38 1/2 |        9 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 39     |        8 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 40 1/2 |        1 | Plus que 1 seul article disponible ! |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 41 1/2 |        6 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 42     |        3 | article disponible                   |
| Nike                | Baskets              | Blanc   | Wmns Classic Cortez Leather Blanc Rouge Bleu |       5 | F     | 42 1/2 |        3 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 38     |        3 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 38 1/2 |        8 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 39     |        3 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 40 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 41     |        1 | Plus que 1 seul article disponible ! |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 41 1/2 |        8 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 42 1/2 |        7 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 43     |        5 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 43 1/2 |        2 | Plus que 2 articles disponibles !    |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 45     |        7 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 45 1/2 |        0 | Rupture de stock                     |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 46     |        3 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 46 1/2 |        6 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 47     |        9 | article disponible                   |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 47 1/2 |        0 | Rupture de stock                     |
| Nike                | Baskets              | Bleu    | Classic Cortez Nylon Obsidian White          |      23 | H     | 48     |        7 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 38     |        4 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 38 1/2 |        5 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 39     |        9 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 39 1/2 |        3 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 40     |        4 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 41     |        1 | Plus que 1 seul article disponible ! |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 41 1/2 |        3 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 42     |       10 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 42 1/2 |        3 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 43     |        6 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 43 1/2 |        8 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 45     |        2 | Plus que 2 articles disponibles !    |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 45 1/2 |       10 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 46     |        0 | Rupture de stock                     |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 47 1/2 |        3 | article disponible                   |
| Puma                | Baskets              | Bleu    | Suede Classic+ Peacoat White                 |      20 | H     | 48     |        2 | Plus que 2 articles disponibles !    |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 35     |        5 | article disponible                   |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 35 1/2 |        0 | Rupture de stock                     |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 36 1/2 |        2 | Plus que 2 articles disponibles !    |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 37     |        2 | Plus que 2 articles disponibles !    |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 37 1/2 |        0 | Rupture de stock                     |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 38     |        3 | article disponible                   |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 38 1/2 |        5 | article disponible                   |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 39     |        2 | Plus que 2 articles disponibles !    |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 39 1/2 |       10 | article disponible                   |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 40     |        6 | article disponible                   |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 40 1/2 |        3 | article disponible                   |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 41     |        1 | Plus que 1 seul article disponible ! |
| Puma                | Baskets              | Noir    | Suede Hyper Embelished Wn's Black White      |      15 | F     | 42 1/2 |        0 | Rupture de stock                     |
+---------------------+----------------------+---------+----------------------------------------------+---------+-------+--------+----------+--------------------------------------+
392 rows in set (0.01 sec)
