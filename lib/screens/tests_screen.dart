import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/categorie.dart';
import '../database/categorie_dao.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tests')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () async {
              final db = await DatabaseHelper().database;
              final resultat =
                  await db.rawQuery('SELECT COUNT(*) AS nb FROM categories');
              debugPrint('Nombre de catégories : ${resultat.first['nb']}');
            },
            child: const Text('Ouvrir la base'),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () async {
              final nouvelle = Categorie(
                nom: 'Électroménager',
                description: 'Petits appareils',
              );
              try {
                final id = await CategorieDao().insererCategorie(nouvelle);
                debugPrint('Catégorie insérée avec l\'id $id');
              } on DatabaseException catch (e) {
                if (e.isUniqueConstraintError()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cette catégorie existe déjà'),
                    ),
                  );
                } else {
                  debugPrint('Erreur SQLite : $e');
                }
              }
            },
            child: const Text('Test : ajouter une catégorie'),
          ),
        ],
      ),
    );
  }
}