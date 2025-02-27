// import 'package:application_caisse/controller/prelevement_controller.dart';
import 'package:application_caisse/controller/releve_controller.dart';
// import 'package:application_caisse/model/prelevement_model.dart';
import 'package:application_caisse/model/releve_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReleveForm extends StatelessWidget {
  ReleveForm({super.key});
  final ReleveController controller = Get.put(ReleveController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ doit être rempli!';
                  }
                  if (!value.isNum) {
                    return 'Veuillez entrer un nombre!';
                  }
                  return null;
                },
                controller: controller.compteurController,
                decoration: const InputDecoration(
                  labelText: 'Compteur',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ doit être rempli!';
                  }
                  if (!value.isNum) {
                    return 'Veuillez entrer un nombre!!';
                  }
                  return null;
                },
                controller: controller.sousCompteurController,
                decoration: const InputDecoration(
                  labelText: 'Sous-compteur',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.amber),
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.saveReleve(ReleveModel(
                        compteur:
                            double.parse(controller.compteurController.text),
                        sousCompteur: double.parse(
                            controller.sousCompteurController.text),
                        dateReleve: DateTime.timestamp(),
                      ));
                    }
                  },
                  child: Text('enregistrer'.toUpperCase())),
            ],
          ),
        ),
      ),
    );
  }
}
