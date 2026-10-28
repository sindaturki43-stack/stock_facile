import 'package:sqflite/sqflite.dart';
import '../models/categorie.dart';
import 'database_helper.dart';

class CategorieDao {
  static const String table = 'categories';

  Future<int> insererCategorie(Categorie categorie) async {
    // 1. Ouvrir la base (ou la réutiliser si déjà ouverte)
    final Database db = await DatabaseHelper().database;

    // 2. Insérer la catégorie dans la table (toMap la convertit en Map, insert renvoie l'id)
    final int id = await db.insert(table, categorie.toMap());

    // 3. Retourner l'id de la nouvelle catégorie
    return id;
  }
}