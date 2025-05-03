import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../models/sale_model.dart';

class SalesReportScreen extends StatelessWidget {
  const SalesReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SaleModel>('sales');

    return Scaffold(
      appBar: AppBar(title: const Text("Sales Report")),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<SaleModel> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text("No sales yet."));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final sale = box.getAt(index)!;
              return ListTile(
                title: Text(sale.clientName),
                subtitle: Text("KES ${sale.amount.toStringAsFixed(2)}"),
                trailing: Icon(
                  sale.synced ? Icons.cloud_done : Icons.cloud_off,
                  color: sale.synced ? Colors.green : Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
