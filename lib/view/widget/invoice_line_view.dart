import 'package:flutter/material.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/controller/controller.dart';
import 'package:get/get.dart';

Widget invoiceLineView(int index, OperationModel operation) {
  Controller controller = Get.find<Controller>();
  return ListTile(
    title: Text("${operation.nomOperation}\t x${operation.quantiteOperation}"),
    trailing: Wrap(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            controller.modifyFactureLine(index);
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
        IconButton(
            onPressed: () {
              controller.removeFactureLine(index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ],
    ),
    subtitle: Text(
        "${(operation.prixOperation * operation.quantiteOperation).toString()} Ar"),
    selected: false,
  );
}
