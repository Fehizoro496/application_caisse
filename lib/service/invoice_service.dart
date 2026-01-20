import 'package:application_caisse/utils.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/material.dart';
import './db_service.dart';
import '../model/operation_model.dart';

class InvoiceService extends GetxService {
  List<OperationModel> listInvoiceLine = [];
  List<String> listOperationsID = [];
  late String client;
  TextEditingController clientController = TextEditingController();

  final DBService dbService = Get.find();

  Future<InvoiceService> init() async {
    return this;
  }

  void _clearData() {
    listInvoiceLine.clear();
    listOperationsID.clear();
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
              _generateInvoicePdf().then((value) {
                _clearData();
                Get.close(1);
              });
            },
            child: const Text("OUI"))
      ],
    ));
  }

  void invoiceProcess(
      List<OperationModel> listInvoiceLine, List<String> listID) {
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
    String factureID = await dbService.saveFacture(client: client);
    for (String id in listOperationsID) {
      await dbService.assignFactureInOperation(id, factureID);
    }

    pw.Document pdf = pw.Document();
    int total = 0;
    for (var element in listInvoiceLine) {
      total += element.prixOperation * element.quantiteOperation;
    }

    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(now);

    // Couleurs modernes - theme gris professionnel
    const primaryColor = PdfColor.fromInt(0xFF374151); // Gris fonce
    const darkColor = PdfColor.fromInt(0xFF111827); // Gris tres fonce
    const mutedColor = PdfColor.fromInt(0xFF6B7280); // Gris moyen
    const lightBg = PdfColor.fromInt(0xFFF9FAFB); // Gris tres clair
    const borderColor = PdfColor.fromInt(0xFFE5E7EB); // Gris bordure

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header avec logo et infos entreprise
              pw.Container(
                padding: const pw.EdgeInsets.all(20),
                decoration: pw.BoxDecoration(
                  color: primaryColor,
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'MULTI-SERVICE',
                          style: pw.TextStyle(
                            fontSize: 24,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          'ITAOSY ANDRANONAHOATRA',
                          style: const pw.TextStyle(
                            fontSize: 12,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '033 60 371 38 / 034 02 579 82',
                          style: const pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.white,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          'FACTURE',
                          style: pw.TextStyle(
                            fontSize: 28,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: pw.BoxDecoration(
                            color: const PdfColor(1, 1, 1, 0.2),
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Text(
                            'Ref: $factureID',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              pw.SizedBox(height: 30),

              // Informations client et date
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Client
                  pw.Container(
                    width: 250,
                    padding: const pw.EdgeInsets.all(16),
                    decoration: pw.BoxDecoration(
                      color: lightBg,
                      borderRadius: pw.BorderRadius.circular(8),
                      border: pw.Border.all(color: borderColor),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Doit:',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: mutedColor,
                          ),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Text(
                          client.isNotEmpty ? client : 'Client',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: darkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Date
                  pw.Container(
                    padding: const pw.EdgeInsets.all(16),
                    decoration: pw.BoxDecoration(
                      color: lightBg,
                      borderRadius: pw.BorderRadius.circular(8),
                      border: pw.Border.all(color: borderColor),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          'DATE',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: mutedColor,
                          ),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Text(
                          formattedDate,
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            color: darkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              pw.SizedBox(height: 30),

              // Tableau des articles
              pw.Table(
                border: null,
                columnWidths: const {
                  0: pw.FractionColumnWidth(0.08),
                  1: pw.FractionColumnWidth(0.37),
                  2: pw.FractionColumnWidth(0.15),
                  3: pw.FractionColumnWidth(0.18),
                  4: pw.FractionColumnWidth(0.22),
                },
                children: [
                  // Header du tableau
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(
                      color: primaryColor,
                      borderRadius: pw.BorderRadius.vertical(
                        top: pw.Radius.circular(6),
                      ),
                    ),
                    children: [
                      _buildHeaderCell('N°'),
                      _buildHeaderCell('Designation'),
                      _buildHeaderCell('Qte'),
                      _buildHeaderCell('P.U.'),
                      _buildHeaderCell('Total'),
                    ],
                  ),
                  // Lignes des articles
                  ...listInvoiceLine.mapIndexed((index, operation) {
                    final isEven = index % 2 == 0;
                    return pw.TableRow(
                      decoration: pw.BoxDecoration(
                        color: isEven ? PdfColors.white : lightBg,
                        border: pw.Border(
                          left: pw.BorderSide(color: borderColor),
                          right: pw.BorderSide(color: borderColor),
                          bottom: pw.BorderSide(color: borderColor),
                        ),
                      ),
                      children: [
                        _buildCell('${index + 1}', center: true),
                        _buildCell(operation.nomOperation),
                        _buildCell(
                          formatNumber(operation.quantiteOperation),
                          center: true,
                        ),
                        _buildCell(
                          '${formatNumber(operation.prixOperation)} Ar',
                          center: true,
                        ),
                        _buildCell(
                          '${formatNumber(operation.quantiteOperation * operation.prixOperation)} Ar',
                          alignRight: true,
                          bold: true,
                        ),
                      ],
                    );
                  }),
                ],
              ),

              pw.SizedBox(height: 16),

              // Total
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Container(
                    width: 220,
                    padding: const pw.EdgeInsets.all(16),
                    decoration: pw.BoxDecoration(
                      color: primaryColor,
                      borderRadius: pw.BorderRadius.circular(8),
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'TOTAL',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.Text(
                          '${formatNumber(total)} Ar',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              pw.SizedBox(height: 24),

              // Montant en lettres
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: lightBg,
                  borderRadius: pw.BorderRadius.circular(8),
                  border: pw.Border.all(color: borderColor),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'MONTANT EN LETTRES',
                      style: pw.TextStyle(
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold,
                        color: mutedColor,
                      ),
                    ),
                    pw.SizedBox(height: 6),
                    pw.Text(
                      '${toLetter(total.floor()).trim()} Ariary',
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: darkColor,
                        fontStyle: pw.FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              pw.Spacer(),

              // Footer avec signature
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Merci pour votre confiance !',
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: mutedColor,
                          fontStyle: pw.FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                        'Le Responsable',
                        style: pw.TextStyle(
                          fontSize: 11,
                          fontWeight: pw.FontWeight.bold,
                          color: darkColor,
                        ),
                      ),
                      pw.SizedBox(height: 40),
                      pw.Container(
                        width: 120,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            top: pw.BorderSide(color: mutedColor),
                          ),
                        ),
                        child: pw.SizedBox(height: 1),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        'Signature',
                        style: const pw.TextStyle(
                          fontSize: 9,
                          color: mutedColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final file = File(
        "C:\\Users\\${_getWindowsUsername()}\\Desktop\\facture N°$factureID ${client.trim()}.pdf");
    await file.writeAsBytes(await pdf.save()).then((value) {
      Get.snackbar(
        'PDF genere',
        'La facture a ete generee avec succes !',
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
        backgroundColor: const Color.fromARGB(200, 34, 197, 94),
        colorText: Colors.white,
      );
    });

    return true;
  }

  pw.Widget _buildHeaderCell(String text) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 10,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.white,
        ),
        textAlign: pw.TextAlign.center,
      ),
    );
  }

  pw.Widget _buildCell(
    String text, {
    bool center = false,
    bool alignRight = false,
    bool bold = false,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 10,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: const PdfColor.fromInt(0xFF1E293B),
        ),
        textAlign: alignRight
            ? pw.TextAlign.right
            : center
                ? pw.TextAlign.center
                : pw.TextAlign.left,
      ),
    );
  }

  String _getWindowsUsername() {
    return Platform.environment['USERNAME'] ?? 'Utilisateur inconnu';
  }

  // String formatNumber(int i) {
  //   List<String> tab = [];
  //   int temp = i;
  //   while (temp > 0) {
  //     tab.add('${temp % 1000}');
  //     temp = (temp / 1000).ceil();
  //   }
  //   return tab.reversed.toList().join(' ');
  // }
}
