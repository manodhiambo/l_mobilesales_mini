import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sales Module")),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text("Sale #${index + 1}"),
            subtitle: Text("Client: Client ${index + 1}"),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

