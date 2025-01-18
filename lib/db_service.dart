import 'package:get/get.dart';
import './database.dart';
import './models.dart';

class DBService extends GetxService {
  late AppDatabase database;

  Future<DBService> init() async {
    database = AppDatabase();
    return this;
  }

  void saveOperation(OperationModel operation) async {
    await database.into(database.operations).insert(OperationsCompanion.insert(
        nomOperation: operation.nomOperation,
        prixOperation: operation.prixOperation,
        quantiteOperation: operation.quantiteOperation,
        dateOperation: DateTime.timestamp()));
  }

  Future<List<Operation>> getAllOperations() async {
    List<Operation> out = await database.select(database.operations).get();
    return out;
  }
}
