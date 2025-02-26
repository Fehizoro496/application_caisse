import 'package:application_caisse/model/prelevement_model.dart';
import 'package:application_caisse/persistance/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/db_service.dart';

class PrelevementController extends GetxController {
  TextEditingController montantController = TextEditingController();
  List<PrelevementModel> listPrelevement = [];
  final DBService dbService = Get.find();

  Future<List<Prelevement>> getAllPrelevements() {
    return dbService.getAllPrelevements();
  }

  Future<int> savePrelelevementToDatabase(PrelevementModel prelevement) {
    return dbService.savePrelevement(prelevement);
  }

  void savePrelelevement(PrelevementModel prelevement) {
    savePrelelevementToDatabase(prelevement).then((value) {
      Get.snackbar('prel OK', 'prel OK');
      listPrelevement.add(PrelevementModel(
        montant: prelevement.montant,
        datePrelevement: DateTime.now(),
      ));
      montantController.clear();
      update();
    });
  }
}
