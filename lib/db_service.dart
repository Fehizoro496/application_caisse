import 'package:get/get.dart';
import './database.dart';
import './models.dart';
import 'package:drift/src/runtime/data_class.dart' as data_class;

class DBService extends GetxService {
  late AppDatabase database;

  Future<DBService> init() async {
    database = AppDatabase();
    return this;
  }

  Future<int> saveOperation(OperationModel operation) async {
    return await database.into(database.operations).insert(
        OperationsCompanion.insert(
            nomOperation: operation.nomOperation,
            prixOperation: operation.prixOperation,
            quantiteOperation: operation.quantiteOperation,
            dateOperation: operation.dateOperation ?? DateTime.timestamp()));
  }

  Future<int> saveUtilisateur({required String nom, required String mdp}) {
    return database.into(database.utilisateurs).insert(
        UtilisateursCompanion.insert(
            nomUtilisateur: nom, motDePasseUtilisateur: mdp));
  }

  Future<int> saveFacture(
      {required String client, required int fournisseur, DateTime? date}) {
    return database.into(database.factures).insert(FacturesCompanion.insert(
        client: client,
        fournisseur: fournisseur,
        dateFacture: date ?? DateTime.timestamp()));
  }

  Future<Operation?> getOperationById(int id) {
    return (database.select(database.operations)
          ..where((tbl) => tbl.idOperation.equals(id)))
        .getSingleOrNull();
  }

  Future<void> assignFactureInOperation(int id, int? factureId) async {
    final operation = await getOperationById(id);
    if (operation != null) {
      await (database.update(database.operations)
            ..where((tbl) => tbl.idOperation.equals(id)))
          .write(
        OperationsCompanion(
          facture: data_class.Value(factureId),
        ),
      );
    }
  }

  // TODO implement Operation update when create Facture
  // fill the facture foreignkey column of Operation row with the id of the Facture created

  Future<List<Operation>> getAllOperations() async {
    List<Operation> out = await database.select(database.operations).get();
    return out;
  }
}

// dart run drift_dev schema dump lib/database.dart db_schemas
// dart run build_runner build --delete-conflicting-outputs