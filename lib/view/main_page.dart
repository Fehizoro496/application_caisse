import 'package:application_caisse/view/widget/input_form.dart';
import 'package:application_caisse/view/widget/invoice_list_view.dart';
import 'package:application_caisse/view/widget/my_drawer.dart';
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
      drawer: const MyDrawer(),
      // App bar with title and actions
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(title),
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
