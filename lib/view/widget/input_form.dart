import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/controller/main_controller.dart';

class InputForm extends StatelessWidget {
  InputForm({super.key});
  final MainController controller = Get.find<MainController>();
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
                    return 'Ce champ ne doit pas être vide';
                  }
                  return null;
                },
                controller: controller.designationController,
                decoration: const InputDecoration(
                  labelText: 'Désignation',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ ne doit pas être vide';
                  }
                  if (!value.isNum) {
                    return 'Le prix unitaire doit être un nombre!';
                  }
                  return null;
                },
                controller: controller.priceController,
                decoration: const InputDecoration(
                  labelText: 'Prix unitaire',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ doit être rempli!';
                  }
                  if (!value.isNum) {
                    return 'La quantité doit être un nombre!';
                  }
                  return null;
                },
                controller: controller.quantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantité',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.addFactureLine(
                        OperationModel(
                          nomOperation: controller.designationController.text,
                          prixOperation:
                              int.parse(controller.priceController.text),
                          quantiteOperation:
                              int.parse(controller.quantityController.text),
                        ),
                      );
                    }
                  },
                  child: Text('ajouter'.toUpperCase())),
            ],
          ),
        ),
      ),
    );
  }
}
