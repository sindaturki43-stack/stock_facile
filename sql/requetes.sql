Q1.5.1:SELECT * FROM produits;
1	Huile d'olive 1 L	18.5	24	1	2026-10-01T09:00:00	1
2	Couscous moyen 1 kg	2.3	40	1	2026-10-01T09:05:00	1
3	Eau minérale 1,5 L	0.85	120	1	2026-10-02T10:00:00	2
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
5	Savon de Marseille	2.9	15	1	2026-10-03T11:00:00	3
6	Cahier 96 pages	1.6	60	1	2026-10-04T08:30:00	4

Q1.5.2:SELECT * FROM produits WHERE quantite = 0;
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2 .'

Q1.5.3:SELECT * FROM produits ORDER BY prix DESC;
1	Huile d'olive 1 L	18.5	24	1	2026-10-01T09:00:00	1
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
5	Savon de Marseille	2.9	15	1	2026-10-03T11:00:00	3
2	Couscous moyen 1 kg	2.3	40	1	2026-10-01T09:05:00	1
6	Cahier 96 pages	1.6	60	1	2026-10-04T08:30:00	4
3	Eau minérale 1,5 L	0.85	120	1	2026-10-02T10:00:00	2

Q1.5.4:SELECT p.nom AS produit, c.nom AS categorie FROM produits p INNER JOIN categories c ON c.id = p.categorie_id;
Huile d'olive 1 L	Alimentation
Couscous moyen 1 kg	Alimentation
Eau minérale 1,5 L	Boissons
Jus d'orange 1 L	Boissons
Savon de Marseille	Hygiène
Cahier 96 pages	Papeterie

Q1.5.5:SELECT c.nom AS categorie, COUNT(p.id) AS nombre_produits FROM categories c LEFT JOIN produits p ON p.categorie_id = c.id
GROUP BY c.nom;
Alimentation	2
Boissons	2
Hygiène	1
Papeterie	1

Q1.5.6:SELECT SUM(prix * quantite) AS valeur_totale FROM produits;
777.5

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

Q2.1:
- sqflite : exécuter des requêtes SQLite depuis Flutter (ouvrir la base,
  insert, query, update, delete)
- path : construire le chemin du fichier de la base avec join(), pour
  que ça fonctionne sur tous les systèmes
- sqflite_common_ffi : permet à sqflite de fonctionner aussi sur
  Windows et Linux (en desktop uniquement)

Q2.3:
id est int: car une catégorie n'a pas encore d'id avant
d'être insérée en base. C'est SQLite qui le crée avec AUTOINCREMENT.

toMap(): n'ajoute id que s'il n'est pas null pour ne pas envoyer
'id': null lors d'un INSERT. On laisse SQLite générer l'id tout seul.
Si id existe déjà , on l'inclut ce qui est utile pour un update.

Q2.4:
-Pourquoi factory:Parce qu'un factory peut lire une Map et convertir les types avant de
créer l'objet. Un constructeur classique ne peut pas
-Pourquoi (map['prix'] as num).toDouble():
Parce que SQLite peut renvoyer un int (5) au lieu d'un double (5.0)
pour une colonne REAL. "as double" planterait si c'est un int.
"as num" accepte int et double, puis .toDouble() convertit toujours
en double. C'est plus robuste.
