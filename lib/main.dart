// Import necessary packages and files
import 'package:application_caisse/history_page.dart';
import 'package:application_caisse/view/input_form.dart';
// import 'package:application_caisse/view/invoice_line_view.dart';
import 'package:application_caisse/view/invoice_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller.dart';
// import './models.dart';
import './database.dart';

// Main function to initialize the app
void main() async {
  // Ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize the database
  final database = AppDatabase();

  // Insert a test operation into the database
  await database.into(database.operations).insert(OperationsCompanion.insert(
      nomOperation: "testFarany",
      prixOperation: 00,
      dateOperation: DateTime.timestamp()));

  // Retrieve all operations from the database
  List<Operation> allOperations =
      await database.select(database.operations).get();

  // Print the operations to the console
  print('Operations in database: $allOperations');

  // Run the app
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Main page widget
class MainPage extends StatelessWidget {
  MainPage({super.key});
  final String title = 'Flutter Demo Home Page';
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer for navigation
      drawer: Drawer(
        child: ListView(
          children: [
            // Navigation to home page
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text('Accueil'),
              ),
              onTap: () => Get.to(MainPage()),
            ),
            // Navigation to services page
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text('Services'),
              ),
              onTap: () => Get.to(MainPage()),
            ),
            // Navigation to history page
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text('Historique'),
              ),
              onTap: () => Get.to(const HistoryPage()),
            ),
          ],
        ),
      ),
      // App bar with title and actions
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const HistoryPage());
            },
            icon: const Icon(
              Icons.watch_later_outlined,
            ),
          )
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
              InputForm(controller: c),
              // Invoice list view widget
              invoiceListView(c),
            ],
          ),
        ),
      ),
    );
  }
}
