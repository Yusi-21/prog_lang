import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../models/language.dart';
import 'language_database.dart';

@lazySingleton
class LanguageRepository {
  final AppDatabase _db;

  LanguageRepository(this._db);

  Future<List<Language>> fetchLanguages() async {
    final rows = await _db.select(_db.languages).get();

    return rows
        .map( // Преобразовать LanguageRow → Language
          (row) => Language(
        icon: _iconFromCode(row.iconCode),
        name: row.name,
        description: row.description,
        imagePath: row.imagePath,
      ),
    )
        .toList();
  }

  IconData _iconFromCode(int code) {
    return IconData(code, fontFamily: 'MaterialIcons');
  }
}