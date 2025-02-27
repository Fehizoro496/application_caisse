import 'package:application_caisse/controller/prelevement_controller.dart';
import 'package:application_caisse/model/prelevement_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrelevementForm extends StatelessWidget {
  PrelevementForm({super.key});
  final PrelevementController controller = Get.put(PrelevementController());
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
                    return 'Le montant doit être un nombre!';
                  }
                  return null;
                },
                controller: controller.montantController,
                decoration: const InputDecoration(
                  labelText: 'Montant',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.lightGreen),
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.savePrelelevement(PrelevementModel(
                          montant:
                              int.parse(controller.montantController.text)));
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
