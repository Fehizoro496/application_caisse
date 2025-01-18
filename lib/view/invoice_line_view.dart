import 'package:flutter/material.dart';
import '../models.dart';
import '../controller.dart';
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
