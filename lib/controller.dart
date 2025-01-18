import 'package:get/get.dart';
import 'models.dart';
import 'package:flutter/material.dart';
import './database.dart';
import './db_service.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Controller extends GetxController {
  List<OperationModel> listInvoiceLine = [];
  TextEditingController designationController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double total = 0;
  final DBService dbService = Get.find();

  // Use the database from the service
  AppDatabase get database => dbService.database;

  void saveOperation(OperationModel operation) {
    dbService.saveOperation(operation);
  }

  Future<List<Operation>> getAllOperations() {
    return dbService.getAllOperations();
  }

  void successSaveSnackbar() {
    Get.snackbar(
      "Enregistrement Effectué",
      "Enregistrement effectué avec succès!",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
      backgroundColor: const Color.fromARGB(100, 0, 255, 0),
      colorText: Colors.white,
    );
  }

  void invoiceDialog() {
    Get.dialog(AlertDialog(
      surfaceTintColor: const Color(0xFFFFFFFF),
      title: const Text('Facturation', textAlign: TextAlign.center),
      content: const Text('Voulez vous imprimer une facture?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
              generateInvoicePdf();
              successSaveSnackbar();
            },
            child: const Text("OUI")),
        TextButton(
          onPressed: () {
            Get.back();
            clearInvoiceList();
            successSaveSnackbar();
          },
          child: const Text(
            "NON",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  void confirmDialog() {
    Get.dialog(AlertDialog(
      surfaceTintColor: const Color(0xFFFFFFFF),
      title: const Text('CONFIRMATION', textAlign: TextAlign.center),
      content: const Text('Voulez vous confirmer cet enregistrement?'),
      actions: [
        TextButton(
            onPressed: () async {
              for (var operation in listInvoiceLine) {
                saveOperation(operation);
              }
              // print("rows Added");
              // getAllOperations().then((value) => print(value));
              Get.back();
              invoiceDialog();
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

  void save() {
    if (listInvoiceLine.isEmpty) {
      Get.snackbar(
        'Erreur',
        'Aucune opération à enregistrer!',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
        backgroundColor: const Color.fromARGB(100, 255, 0, 0),
        colorText: Colors.white,
      );
    } else {
      confirmDialog();
    }

    // Get.snackbar('Enregistrement effectué', ' ');
  }

  void clearInvoiceList() {
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

  Future<void> generateInvoicePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Facture', style: const pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.TableHelper.fromTextArray(
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.centerRight,
                },
                headers: ['Désignation', 'Quantité', 'PU', 'Total'],
                data: listInvoiceLine.map((operation) {
                  return [
                    operation.nomOperation,
                    operation.quantiteOperation.toString(),
                    operation.prixOperation.toString(),
                    (operation.quantiteOperation * operation.prixOperation)
                        .toString()
                  ];
                }).toList(),
              ),
              pw.SizedBox(),
              pw.Text('Total: $total', style: const pw.TextStyle(fontSize: 18)),
            ],
          );
        },
      ),
    );

    // final output = await getTemporaryDirectory();
    // final file = File("${output.path}\invoice.pdf");

    final file =
        File("C:\\Users\\${getWindowsUsername()}\\Desktop\\facture.pdf");
    await file.writeAsBytes(await pdf.save());
    print("Chemin vers la facture => ${file.path}");

    Get.snackbar(
      'PDF Generated',
      'Invoice PDF has been generated successfully!',
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
      backgroundColor: const Color.fromARGB(100, 0, 255, 0),
      colorText: Colors.white,
    );
    clearInvoiceList();
  }

  String getWindowsUsername() {
    return Platform.environment['USERNAME'] ?? 'Utilisateur inconnu';
  }
}
