import 'package:application_caisse/model/releve_model.dart';
import 'package:application_caisse/model/prelevement_model.dart';
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

  Future<List<Prelevement>> getAllPrelevements() async {
    List<Prelevement> out = await database.select(database.prelevements).get();
    return out;
  }

  Future<int> savePrelevement(PrelevementModel prelevement) async {
    return await database.into(database.prelevements).insert(
        PrelevementsCompanion.insert(
            montant: prelevement.montant,
            datePrelevement:
                prelevement.datePrelevement ?? DateTime.timestamp()));
  }

  Future<List<Releve>> getAllReleves() async {
    List<Releve> out = await database.select(database.releves).get();
    return out;
  }

  Future<int> saveReleve(ReleveModel releve) async {
    return await database.into(database.releves).insert(RelevesCompanion.insert(
        compteur: releve.compteur,
        sousCompteur: releve.sousCompteur,
        dateReleve: releve.dateReleve ?? DateTime.timestamp()));
  }
}

// dart run drift_dev schema dump lib/persistance/database.dart db_schemas
// dart run build_runner build --delete-conflicting-outputs