import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

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
  TextColumn get nomClient => text()();
  IntColumn get fournisseur =>
      integer().references(Utilisateurs, #idUtilisateur)();
  DateTimeColumn get dateFacture => dateTime()();
}

class Utilisateurs extends Table {
  IntColumn get idUtilisateur => integer().autoIncrement()();
  TextColumn get nomUtilisateur => text().unique()();
  TextColumn get motDePasseUtilisateur => text()();
}

// @DriftDatabase(tables: [Services, Ventes, Commandes])
@DriftDatabase(tables: [Operations, Factures, Utilisateurs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}
