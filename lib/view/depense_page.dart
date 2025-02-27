import 'package:application_caisse/view/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/controller/depense_controller.dart';

class DepensePage extends StatelessWidget {
  final String title = "Sortant";
  final _formKey = GlobalKey<FormState>();
  late final DepenseController controller;

  DepensePage({super.key}) {
    controller = Get.put(DepenseController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
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
                            return null;
                          },
                          controller: controller.libelleController,
                          decoration: const InputDecoration(
                            labelText: 'Libellé',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                          ),
                        ),
                        const SizedBox(height: 20.0),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.redAccent),
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.handleSubmit();
                              }
                            },
                            child: Text("Enregistrer".toUpperCase()))
                      ],
                    )),
              )),
        ),
      ),
    );
  }
}
