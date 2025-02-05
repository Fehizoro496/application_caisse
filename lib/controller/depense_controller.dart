import 'package:application_caisse/service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/depense_model.dart';

class DepenseController extends GetxController {
  TextEditingController libelleController = TextEditingController();
  TextEditingController montantController = TextEditingController();

  final DBService dbService = Get.find();

  Future<int> _saveDepenseToDatabase(DepenseModel depense) {
    return dbService.saveDepense(depense);
  }

  void handleSubmit() async {
    await _saveDepenseToDatabase(DepenseModel(
            libelle: libelleController.text,
            montant: int.parse(montantController.text),
            dateDepense: DateTime.timestamp()))
        .then((value) {
      Get.back();
      _successSaveSnackbar();
      // _clearForm();
    }).catchError((error) {
      _errorSaveSnackbar(error);
    });
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

  void _errorSaveSnackbar(String error) {
    Get.snackbar(
      "Error",
      error,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
      backgroundColor: const Color.fromARGB(175, 255, 0, 0),
      colorText: Colors.white,
    );
  }
}
