import 'package:get/get.dart';
import 'models.dart';
import 'package:flutter/material.dart';

class Controller extends GetxController {
  List<InvoiceLine> listInvoiceLine = [];
  TextEditingController designationController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double total = 0;

  void save() {
    if (listInvoiceLine.isEmpty) {
      Get.snackbar(
        'Erreur', 'Aucun service à enregistrer!',
        snackPosition: SnackPosition.TOP,
        // overlayColor: Color.fromARGB(176, 255, 0, 0),
        // backgroundColor: Color.fromARGB(175, 255, 0, 0),
        backgroundColor: const Color.fromARGB(175, 244, 67, 54),
        colorText: Colors.white,
      );
    } else {
      Get.dialog(AlertDialog(
        title: Text('Confirmation'.toUpperCase(), textAlign: TextAlign.center),
        content: const Text('Voulez vous confirmer cet enregistrement?'),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
                clearInvoiceList();
              },
              child: const Text('yes')),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('non'))
        ],
      ));
    }

    // Get.snackbar('Enregistrement effectué', ' ');
  }

  void clearInvoiceList() {
    listInvoiceLine.clear();
    total = 0;
    update();
  }

  void addFactureLine(InvoiceLine line) {
    listInvoiceLine.add(line);
    designationController.clear();
    priceController.clear();
    quantityController.clear();
    total += line.quantity * line.service.priceService;
    update();
  }

  void removeFactureLine(index) {
    total -= listInvoiceLine[index].quantity *
        listInvoiceLine[index].service.priceService;
    listInvoiceLine.removeAt(index);
    update();
  }

  void modifyFactureLine(index) {
    designationController.text = listInvoiceLine[index].service.nameService;
    priceController.text =
        listInvoiceLine[index].service.priceService.toString();
    quantityController.text = listInvoiceLine[index].quantity.toString();
    total -= listInvoiceLine[index].quantity *
        listInvoiceLine[index].service.priceService;
    listInvoiceLine.removeAt(index);
    update();
  }
}
