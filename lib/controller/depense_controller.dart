import 'package:application_caisse/service/db_service.dart';
import 'package:application_caisse/view/widget/modern_snackbar.dart';
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
      // Get.back();
      _clearForm();
      _successSaveSnackbar();
    }).catchError((error) {
      _errorSaveSnackbar(error);
    });
  }

  void _clearForm() {
    libelleController.clear();
    montantController.clear();
  }

  void _successSaveSnackbar() {
    ModernSnackBar.showSuccess(
      "Enregistrement Effectué",
      "Enregistrement effectué avec succès!",
    );
  }

  void _errorSaveSnackbar(String error) {
    ModernSnackBar.showError(
      "Error",
      error,
    );
  }
}
