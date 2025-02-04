import 'package:application_caisse/view/depense_page.dart';
import 'package:application_caisse/view/widget/input_form.dart';
import 'package:application_caisse/view/widget/invoice_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';

class MainPage extends StatelessWidget {
  final String title = 'Entrant';
  late final MainController c;

  MainPage({super.key}) {
    c = Get.put(MainController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer for navigation
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       // Navigation to home page
      //       InkWell(
      //         child: const ListTile(
      //           leading: Icon(Icons.home),
      //           title: Text('Accueil'),
      //         ),
      //         onTap: () => Get.to(MainPage()),
      //       ),
      //       // Navigation to services page
      //       InkWell(
      //         child: const ListTile(
      //           leading: Icon(Icons.home),
      //           title: Text('Services'),
      //         ),
      //         onTap: () => Get.to(MainPage()),
      //       ),
      //       // Navigation to history page
      //       InkWell(
      //         child: const ListTile(
      //           leading: Icon(Icons.home),
      //           title: Text('Historique'),
      //         ),
      //         onTap: () => Get.to(const HistoryPage()),
      //       ),
      //     ],
      //   ),
      // ),
      // App bar with title and actions
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(title),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => DepensePage());
              },
              child: const Text(
                'Dépense',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ))
        ],
      ),
      // Main body content
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Input form widget
              InputForm(),
              // Invoice list view widget
              invoiceListView(),
            ],
          ),
        ),
      ),
    );
  }
}
