import 'package:flutter/material.dart';
import 'package:application_caisse/view/invoice_line_view.dart';

// import '../models.dart';
import '../../controller.dart';
import 'package:get/get.dart';

Widget invoiceListView() {
  return GetBuilder<Controller>(builder: (context) {
    Controller controller = Get.find<Controller>();
    return Container(
      height: 550,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: controller.listInvoiceLine.length,
            itemBuilder: (context, index) =>
                invoiceLineView(index, controller.listInvoiceLine[index]),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10.0))),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                ),
                Text(
                  '${controller.total} Ar',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16.0),
                )
              ]),
              const SizedBox(height: 10.0),
              ElevatedButton(
                  onPressed: () {
                    controller.saveOperations();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  child: Text('Enregistrer'.toUpperCase())),
            ],
          ),
          // height: 75,
        ),
      ]),
    );
  });
}
