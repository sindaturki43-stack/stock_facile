-Q1.3:
disponible :en entier 1 = vrai, 0 = faux
date_ajout: en text format ISO 8601
AUTOINCREMENT : l'id augmente tout seul et n'est jamais reutiliser, meme apres une suppression
nom est UNIQUE: interdit deux catégories avec le même nom
CHECK (prix >= 0):interdit un prix negatif
ON DELETE RESTRICTM:On ne peut pas supprimer une categorie tant qu'il contient encore des produits

-Q1.4:
On écrit 'Huile d''olive' avec deux apostrophes parce qu'en SQL
l'apostrophe délimite le texte. Comme « d'olive » contient une apostrophe,
SQLite croirait que le texte s'arrête au milieu. La règle SQL est de
doubler l'apostrophe : SQLite enregistre alors « Huile d'olive » avec
une seule apostrophe.
