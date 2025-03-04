import 'package:application_caisse/model/releve_model.dart';
import 'package:application_caisse/persistance/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/db_service.dart';

class ReleveController extends GetxController {
  TextEditingController compteurController = TextEditingController();
  TextEditingController sousCompteurController = TextEditingController();
  late ReleveModel lastReleve = ReleveModel(compteur: 0.0, sousCompteur: 0.0);
  final DBService dbService = Get.find();

  @override
  void onInit() async {
    dbService.getAllReleves().then((value) {
      if (value.isNotEmpty) {
        lastReleve = ReleveModel(
            idReleve: value.last.idReleve,
            compteur: value.last.compteur,
            sousCompteur: value.last.sousCompteur,
            dateReleve: value.last.dateReleve);
      }
    });
    super.onInit();
  }

  Future<List<Releve>> getAllReleves() {
    return dbService.getAllReleves();
  }

  Future<int> _saveReleveToDatabase(ReleveModel releve) {
    return dbService.saveReleve(releve);
  }

  void saveReleve(ReleveModel releve) {
    _saveReleveToDatabase(releve).then((value) {
      Get.snackbar(
        "Relevé Effectué",
        "Relevé enregistré avec succès!",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
        backgroundColor: const Color.fromARGB(175, 0, 225, 0),
        colorText: Colors.white,
      );
      compteurController.clear();
      sousCompteurController.clear();
      lastReleve = releve;
    });
    update();
  }
}
