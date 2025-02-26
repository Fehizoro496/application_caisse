import 'package:application_caisse/format_number.dart';
import 'package:flutter/material.dart';
import 'package:application_caisse/controller/prelevement_controller.dart';
import 'package:get/get.dart';

Widget prelevementListView() {
  return GetBuilder<PrelevementController>(builder: (context) {
    PrelevementController controller = Get.find<PrelevementController>();
    // Create a new ScrollController for this instance
    final ScrollController scrollController = ScrollController();

    return Container(
        height: 550,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: FutureBuilder(
          future: controller.getAllPrelevements(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            } else if (snapshot.hasData) {
              // Schedule scroll to bottom after build
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (scrollController.hasClients) {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                }
              });

              return ListView.builder(
                controller: scrollController,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var prelevement = snapshot.data?[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(formatNumber(prelevement!.montant)),
                        trailing: Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          spacing: 4,
                          children: [
                            Text(
                                '${prelevement.datePrelevement.day}/${prelevement.datePrelevement.month}/${prelevement.datePrelevement.year}'),
                            Text(
                                '${prelevement.datePrelevement.hour}:${prelevement.datePrelevement.minute}'),
                          ],
                        ),
                      ),
                      if (index != (snapshot.data!.length - 1)) const Divider(),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ));
  });
}
