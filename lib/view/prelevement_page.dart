// import 'package:application_caisse/controller/prelevement_controller.dart';
import 'package:application_caisse/view/widget/my_drawer.dart';
import 'package:application_caisse/view/widget/prelevement_form.dart';
import 'package:application_caisse/view/widget/prelevement_list_view.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class PrelevementPage extends StatelessWidget {
  final String title = 'Prelevement';

  const PrelevementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prélèvement'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Input form widget
              PrelevementForm(),
              // Invoice list view widget
              prelevementListView(),
            ],
          ),
        ),
      ),
    );
  }
}
