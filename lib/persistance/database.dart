import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class Depenses extends Table {
  IntColumn get idDepense => integer().autoIncrement()();
  TextColumn get libelle => text()();
  IntColumn get montant => integer()();
  DateTimeColumn get dateDepense => dateTime()();
}

class Operations extends Table {
  IntColumn get idOperation => integer().autoIncrement()();
  TextColumn get nomOperation => text()();
  IntColumn get prixOperation => integer()();
  IntColumn get quantiteOperation => integer()();
  IntColumn get facture =>
      integer().references(Factures, #idFacture).nullable()();
  DateTimeColumn get dateOperation => dateTime()();
}

class Factures extends Table {
  IntColumn get idFacture => integer().autoIncrement()();
  TextColumn get client => text()();
  DateTimeColumn get dateFacture => dateTime()();
}

class ReglementsFacture extends Table {
  IntColumn get idReglement => integer().autoIncrement()();
  IntColumn get montant => integer()();
  DateTimeColumn get dateReglement => dateTime()();
  IntColumn get facture => integer().references(Factures, #idFacture)();
}

class Prelevements extends Table {
  IntColumn get idPrelevement => integer().autoIncrement()();
  IntColumn get montant => integer()();
  DateTimeColumn get datePrelevement => dateTime()();
}

class Releves extends Table {
  IntColumn get idReleve => integer().autoIncrement()();
  RealColumn get compteur => real()();
  RealColumn get sousCompteur => real()();
  DateTimeColumn get dateReleve => dateTime()();
}

@DriftDatabase(tables: [Operations, Factures, Depenses, Prelevements, Releves])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await m.createAll();
      },
      beforeOpen: (details) async {
        if (kDebugMode) {}
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationCacheDirectory();
    final file = File(p.join(dbFolder.path, 'caisse_database.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}
