import 'dart:async';
import 'package:application_caisse/service/invoice_service.dart';
import 'package:get/get.dart';
import '../model/operation_model.dart';
import 'package:flutter/material.dart';
import '../persistance/database.dart';
import '../service/db_service.dart';
// import 'package:pdf/pdf.dart';
// import 'package:path_provider/path_provider.dart';

class MainController extends GetxController {
  List<int> listOperationsID = [];
  List<OperationModel> listInvoiceLine = [];
  TextEditingController designationController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double total = 0;

  final DBService dbService = Get.find();
  final InvoiceService invoiceService = Get.put(InvoiceService());

  Future<int> _saveOperationToDatabase(OperationModel operation) {
    return dbService.saveOperation(operation);
  }

  Future<List<Operation>> getAllOperations() {
    return dbService.getAllOperations();
  }

  void _successSaveSnackbar() {
    Get.snackbar(
      "Enregistrement Effectué",
      "Enregistrement effectué avec succès!",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
      backgroundColor: const Color.fromARGB(175, 0, 225, 0),
      colorText: Colors.white,
    );
  }

  Future<bool> fillIDList() async {
    bool out = true;
    for (var operation in listInvoiceLine) {
      await _saveOperationToDatabase(operation)
          .then((value) => listOperationsID.add(value))
          .catchError((error) {
        out = false;
        // return false;
      });
    }
    return out;
  }

  void _confirmDialog() {
    Get.dialog(AlertDialog(
      surfaceTintColor: const Color(0xFFFFFFFF),
      title: const Text('CONFIRMATION', textAlign: TextAlign.center),
      content: const Text('Voulez vous confirmer cet enregistrement?'),
      actions: [
        TextButton(
            onPressed: () async {
              Get.back();
              await fillIDList().then((value) {
                invoiceService.invoiceProcess(
                    listInvoiceLine, listOperationsID);
                _clearInvoiceList();
                _successSaveSnackbar();
              });
            },
            child: const Text('OUI')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'NON',
              style: TextStyle(color: Colors.red),
            ))
      ],
    ));
  }

  void saveOperations() {
    if (listInvoiceLine.isEmpty) {
      Get.snackbar(
        'Erreur',
        'Aucune opération à enregistrer!',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
        backgroundColor: const Color.fromARGB(175, 255, 0, 0),
        colorText: Colors.white,
      );
    } else {
      _confirmDialog();
    }

    // Get.snackbar('Enregistrement effectué', ' ');
  }

  void _clearInvoiceList() {
    listOperationsID.clear();
    listInvoiceLine.clear();
    total = 0;
    update();
  }

  void addFactureLine(OperationModel operation) {
    listInvoiceLine.add(operation);
    designationController.clear();
    priceController.clear();
    quantityController.clear();
    total += operation.quantiteOperation * operation.prixOperation;
    update();
  }

  void removeFactureLine(index) {
    total -= listInvoiceLine[index].quantiteOperation *
        listInvoiceLine[index].prixOperation;
    listInvoiceLine.removeAt(index);
    update();
  }

  void modifyFactureLine(index) {
    designationController.text = listInvoiceLine[index].nomOperation;
    priceController.text = listInvoiceLine[index].prixOperation.toString();
    quantityController.text =
        listInvoiceLine[index].quantiteOperation.toString();
    total -= listInvoiceLine[index].quantiteOperation *
        listInvoiceLine[index].prixOperation;
    listInvoiceLine.removeAt(index);
    update();
  }
}
