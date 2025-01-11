import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "title",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: const Center(
          child: Text("test"),
        ),
      ),
    );
  }
}
