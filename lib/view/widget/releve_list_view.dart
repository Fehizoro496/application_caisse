import 'package:application_caisse/what_day.dart';
import 'package:flutter/material.dart';
import 'package:application_caisse/controller/releve_controller.dart';
import 'package:get/get.dart';

Widget releveListView() {
  return GetBuilder<ReleveController>(builder: (context) {
    ReleveController controller = Get.find<ReleveController>();
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
          future: controller.getAllReleves(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
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
                  var releve = snapshot.data?[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text('${releve!.compteur}'),
                        subtitle: Text('${releve.sousCompteur}'),
                        trailing: Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          spacing: 4,
                          children: [
                            Text(
                                '${whatDay(releve.dateReleve)}\t${releve.dateReleve.day}/${releve.dateReleve.month}/${releve.dateReleve.year}'),
                            Text(
                                '${releve.dateReleve.hour}:${releve.dateReleve.minute}'),
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
