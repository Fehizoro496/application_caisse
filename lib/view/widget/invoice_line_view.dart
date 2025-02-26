import 'package:application_caisse/format_number.dart';
import 'package:flutter/material.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/controller/main_controller.dart';
import 'package:get/get.dart';

Widget invoiceLineView(int index, OperationModel operation) {
  final MainController controller = Get.find<MainController>();

  return ListTile(
    title: Text(
        "${operation.nomOperation}\t x${formatNumber(operation.quantiteOperation)}"),
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
        "${formatNumber(operation.prixOperation * operation.quantiteOperation)} Ar"),
    selected: false,
  );
}
