import 'package:application_caisse/view/depense_page.dart';
import 'package:application_caisse/view/main_page.dart';
import 'package:application_caisse/view/prelevement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Navigation to home page
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('Entrant'),
            ),
            onTap: () => Get.to(() => MainPage()),
          ),
          // Navigation to services page
          InkWell(
            child: const ListTile(
              // leading: Icon(Icons.home),
              title: Text('Dépense'),
            ),
            onTap: () => Get.to(() => DepensePage()),
          ),
          InkWell(
            child: const ListTile(
              // leading: Icon(Icons.home),
              title: Text('Prélèvement'),
            ),
            onTap: () => Get.to(() => const PrelevementPage()),
          ),
        ],
      ),
    );
  }
}
