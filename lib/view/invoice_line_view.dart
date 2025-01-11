import 'package:flutter/material.dart';
import '../models.dart';
import '../controller.dart';
// import 'package:get/get.dart';

Widget invoiceLineView(int index, InvoiceLine invoiceLine, Controller c) {
  return ListTile(
    title:
        Text("${invoiceLine.service.nameService}\t x${invoiceLine.quantity}"),
    trailing: Wrap(
      spacing: 4,
      children: [
        IconButton(
          onPressed: () {
            c.modifyFactureLine(index);
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
        IconButton(
            onPressed: () {
              c.removeFactureLine(index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ],
    ),
    subtitle: Text(
        "${(invoiceLine.service.priceService * invoiceLine.quantity).toString()} Ar"),
    selected: false,
  );
}
