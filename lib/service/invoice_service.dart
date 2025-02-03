import 'package:application_caisse/chiffre_en_lettre.dart';
import 'package:get/get.dart';
import '../model/operation_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/material.dart';
import './db_service.dart';

class InvoiceService extends GetxService {
  List<OperationModel> listInvoiceLine = [];
  List<int> listOperationsID = [];
  late String client;
  TextEditingController clientController = TextEditingController();

  final DBService dbService = Get.find();

  Future<InvoiceService> init() async {
    return this;
  }

  void _clearData() {
    listInvoiceLine.clear();
    client = "";
    clientController.text = "";
  }

  void _getClientName() {
    Get.dialog(AlertDialog(
      surfaceTintColor: const Color(0xFFFFFFFF),
      title: const Text(
        "Client Name",
        textAlign: TextAlign.center,
      ),
      content: TextFormField(
        controller: clientController,
        decoration: const InputDecoration(label: Text("Nom du client")),
      ),
      actions: [
        TextButton(
            onPressed: () {
              client = clientController.text;
              _generateInvoicePdf();
              Get.close(1);
              _clearData();
            },
            child: const Text("OUI"))
      ],
    ));
  }

  void invoiceProcess(List<OperationModel> listInvoiceLine, List<int> listID) {
    this.listInvoiceLine.addAll(listInvoiceLine);
    listOperationsID.addAll(listID);

    Get.dialog(AlertDialog(
      surfaceTintColor: const Color(0xFFFFFFFF),
      title: const Text('Facturation', textAlign: TextAlign.center),
      content: const Text('Voulez vous imprimer une facture?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.close(1);
              _getClientName();
            },
            child: const Text("OUI")),
        TextButton(
          onPressed: () {
            Get.close(1);
          },
          child: const Text(
            "NON",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  Future<bool> _generateInvoicePdf() async {
    // print(listOperationsID);
    dbService.saveFacture(client: client).then((factureID) => {
          for (int id in listOperationsID)
            {dbService.assignFactureInOperation(id, factureID)}
        });

    final pdf = pw.Document();
    double total = 0;
    for (var element in listInvoiceLine) {
      total += element.prixOperation * element.quantiteOperation;
    }

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('FACTURE',
                  style: pw.TextStyle(
                      fontSize: 32, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 40),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('MULTI-SERVICE ITAOSY ANDRANONAHOATRA',
                        style: const pw.TextStyle(fontSize: 12)),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text('Doit:',
                              style: const pw.TextStyle(
                                  fontSize: 12,
                                  decoration: pw.TextDecoration.underline)),
                          pw.Text(' $client',
                              style: const pw.TextStyle(fontSize: 12)),
                        ])
                  ]),
              pw.SizedBox(height: 20),
              pw.TableHelper.fromTextArray(
                headerAlignment: pw.Alignment.center,
                columnWidths: const {
                  0: pw.FractionColumnWidth(0.35),
                  1: pw.FractionColumnWidth(0.2),
                  2: pw.FractionColumnWidth(0.2),
                  3: pw.FractionColumnWidth(0.25),
                },
                cellAlignments: const {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.centerRight,
                },
                headers: <String>[
                  'Désignation',
                  'Quantité',
                  'PU (en Ar)',
                  'Total'
                ],
                data: listInvoiceLine.map((operation) {
                  return <String>[
                    operation.nomOperation,
                    operation.quantiteOperation.toString(),
                    operation.prixOperation.toString(),
                    "${operation.quantiteOperation * operation.prixOperation} Ar"
                  ];
                }).toList(),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.SizedBox(),
                  pw.Text(
                    'Total: $total Ar',
                    style: const pw.TextStyle(fontSize: 18),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                  "Présente facture arrêtée à la somme de ${chiffreEnLettre(total.floor())} Ariary."),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.SizedBox(),
                  pw.Text(
                    'Le fournisseur',
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    // final output = await getTemporaryDirectory();
    // final file = File("${output.path}\invoice.pdf");

    final file = File(
        "C:\\Users\\${_getWindowsUsername()}\\Desktop\\facture ${client.split(" ").last}.pdf");
    await file.writeAsBytes(await pdf.save());
    // print("Chemin vers la facture => ${file.path}");

    Get.snackbar(
      'PDF Generated',
      'Invoice PDF has been generated successfully!',
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
      backgroundColor: const Color.fromARGB(175, 0, 225, 0),
      colorText: Colors.white,
    );
    return true;
  }

  String _getWindowsUsername() {
    return Platform.environment['USERNAME'] ?? 'Utilisateur inconnu';
  }
}
