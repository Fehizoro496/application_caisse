import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

//dart run build_runnrt build
part 'database.g.dart';

// class Services extends Table {
//   IntColumn get idService => integer().autoIncrement()();
//   TextColumn get nomService => text()();
//   IntColumn get prixService => integer()();
//   BoolColumn get outdated => boolean()();
// }

class Operations extends Table {
  IntColumn get idOperation => integer().autoIncrement()();
  TextColumn get nomOperation => text()();
  IntColumn get prixOperation => integer()();
  IntColumn get quantiteOperation => integer()();
  DateTimeColumn get dateOperation => dateTime()();
}

// class Ventes extends Table {
//   IntColumn get idVente => integer().autoIncrement()();
//   IntColumn get quantite => integer().withDefault(const Constant(1))();
//   IntColumn get service => integer().references(Services, #idService)();
//   IntColumn get commande => integer().references(Commandes, #idCommande)();
// }

// class Commandes extends Table {
//   IntColumn get idCommande => integer().autoIncrement()();
//   DateTime get date => DateTime.timestamp();
// }

// @DriftDatabase(tables: [Services, Ventes, Commandes])
@DriftDatabase(tables: [Operations])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // if (from < 5) {
        await m.createAll();
        // }
        // await m.createTable(operations);
      },
      beforeOpen: (details) async {
        if (kDebugMode) {}
      },
    );
  }

  // Future<int> createService(
  //     {required String nom, required int prix, required bool outdated}) {
  //   return into(services).insert(ServicesCompanion.insert(
  //       nomService: nom, prixService: prix, outdated: outdated));
  // }

  Future<int> createOperation(
      {required String nom,
      required int prix,
      required int quantite,
      DateTime? date}) {
    return into(operations).insert(OperationsCompanion.insert(
        nomOperation: nom,
        prixOperation: prix,
        quantiteOperation: quantite,
        dateOperation: DateTime.timestamp()));
  }

  Future<List<Operation>> get allOperation => select(operations).get();
  // loads all todo entries
  // Future<List<Service>> get allService => select(services).get();
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

// Future<int> addService(ServicesCompanion entry) {
//   return AppDatabase.into(Services).insert(entry);
// }