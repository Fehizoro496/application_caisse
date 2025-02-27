import 'package:application_caisse/view/widget/releve_list_view.dart';
import 'package:application_caisse/view/widget/releve_form.dart';
import 'package:application_caisse/view/widget/my_drawer.dart';
import 'package:flutter/material.dart';

class RelevePage extends StatelessWidget {
  const RelevePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Relevé'),
        backgroundColor: Colors.amber,
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
              ReleveForm(),
              // Invoice list view widget
              releveListView(),
            ],
          ),
        ),
      ),
    );
  }
}
