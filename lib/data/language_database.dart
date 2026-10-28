import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
// import 'package:prog_lang/mock/languages_data.dart'; //for practice-7

part 'language_database.g.dart';

@DataClassName('LanguageRow')
class Languages extends Table {
  IntColumn get id => integer().autoIncrement()(); //() в конце — вызывает builder, чтобы получить готовую колонку.
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get imagePath => text()();
  IntColumn get iconCode => integer()();
}

@lazySingleton
@DriftDatabase(tables: [Languages]) // table name
class AppDatabase extends _$AppDatabase { // _$AppDatabase is private and generated($) class — shown only inside the language_database.g.dart file
  AppDatabase() : super(driftDatabase(name: 'prog_lang_db')); // .sqlite file name

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll(); //Creates all tables, triggers etc, if they don't exist
      await batch((batch) { // grouping sql-operation in one transaction
        batch.insertAll(languages, [
          LanguagesCompanion.insert(
            name: 'Dart',
            description: 'Язык для Flutter, быстрый и современный.',
            imagePath: 'assets/images/dart.png',
            iconCode: 0xe1c5,
          ),
          LanguagesCompanion.insert(
            name: 'Kotlin',
            description: 'Официальный язык для Android.',
            imagePath: 'assets/images/kotlin.png',
            iconCode: 0xe1b0,
          ),
          LanguagesCompanion.insert(
            name: 'Java',
            description: 'Классика, ООП, 30 лет на рынке.',
            imagePath: 'assets/images/java.png',
            iconCode: 0xe1a6,
          ),
          LanguagesCompanion.insert(
            name: 'Python',
            description: 'Популярен для AI, анализа данных и бэкенда.',
            imagePath: 'assets/images/python.png',
            iconCode: 0xe282,
          ),
          LanguagesCompanion.insert(
            name: 'C++',
            description: 'Мощный язык для систем и игр.',
            imagePath: 'assets/images/c_plus.png',
            iconCode: 0xe234,
          ),
        ]);
      });
    },
  );
}