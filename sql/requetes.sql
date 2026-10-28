Q1.5.1:SELECT * FROM produits;
Q1.5.2:SELECT * FROM produits WHERE quantite = 0;
Q1.5.3:SELECT * FROM produits ORDER BY prix DESC;
Q1.5.4:SELECT p.nom AS produit, c.nom AS categorie FROM produits p INNER JOIN categories c ON c.id = p.categorie_id;
Q1.5.5:SELECT c.nom AS categorie, COUNT(p.id) AS nombre_produits FROM categories c LEFT JOIN produits p ON p.categorie_id = c.id
GROUP BY c.nom;
Q1.5.6:SELECT SUM(prix * quantite) AS valeur_totale FROM produits;

Q1.6.a:L'exécution s'est terminée avec des erreurs.
Résultat : CHECK constraint failed: prix >= 0
À la ligne 1 :
INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test prix', -5, 1, '2026-10-05T08:00:00', 1);

Q1.6.b:L'exécution s'est terminée avec des erreurs.
Résultat : FOREIGN KEY constraint failed
À la ligne 1 :
INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test catégorie', 1, 1, '2026-10-05T08:00:00', 99);

Q1.6.c:L'exécution s'est terminée avec des erreurs.
Résultat : FOREIGN KEY constraint failed
À la ligne 1 :
DELETE FROM categories WHERE id = 1;

Q1.7:
Ce fichier contient uniquement la structure de la base : les deux
instructions CREATE TABLE (categories et produits) avec leurs
colonnes et contraintes. Il ne contient pas les données, car on a
choisi « schema uniquement »
Q1.8:
Il faut fermer DB Browser avant qu un autre programme écrive dans le
fichier, car deux programmes ne doivent pas modifier la même base en
même temps. Sinon le fichier .db risque dêtre corrompu ou les
données perdues
