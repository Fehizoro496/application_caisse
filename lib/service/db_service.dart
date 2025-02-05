import 'package:get/get.dart';
import 'package:application_caisse/persistance/database.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/model/depense_model.dart';
import 'package:drift/src/runtime/data_class.dart' as data_class;

class DBService extends GetxService {
  late AppDatabase database;

  Future<DBService> init() async {
    database = AppDatabase();
    return this;
  }

  Future<int> saveDepense(DepenseModel depense) async {
    return await database.into(database.depenses).insert(
        DepensesCompanion.insert(
            libelle: depense.libelle,
            montant: depense.montant,
            dateDepense: depense.dateDepense ?? DateTime.timestamp()));
  }

  Future<int> saveOperation(OperationModel operation) async {
    return await database.into(database.operations).insert(
        OperationsCompanion.insert(
            nomOperation: operation.nomOperation,
            prixOperation: operation.prixOperation,
            quantiteOperation: operation.quantiteOperation,
            dateOperation: operation.dateOperation ?? DateTime.timestamp()));
  }

  Future<int> saveFacture({required String client, DateTime? date}) {
    return database.into(database.factures).insert(FacturesCompanion.insert(
        client: client,
        // fournisseur: fournisseur,
        dateFacture: date ?? DateTime.timestamp()));
  }

  Future<Operation?> getOperationById(int id) {
    return (database.select(database.operations)
          ..where((tbl) => tbl.idOperation.equals(id)))
        .getSingleOrNull();
  }

  Future<void> assignFactureInOperation(int operationID, int factureID) async {
    final operation = await getOperationById(operationID);
    if (operation != null) {
      await (database.update(database.operations)
            ..where((tbl) => tbl.idOperation.equals(operationID)))
          .write(
        OperationsCompanion(
          facture: data_class.Value(factureID),
        ),
      );
    }
  }

  Future<List<Operation>> getAllOperations() async {
    List<Operation> out = await database.select(database.operations).get();
    return out;
  }
}

// dart run drift_dev schema dump lib/database.dart db_schemas
// dart run build_runner build --delete-conflicting-outputs