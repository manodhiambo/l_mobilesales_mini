import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../models/sale_model.dart';

class SyncSalesScreen extends StatelessWidget {
  const SyncSalesScreen({super.key});

  Future<void> _syncSales(BuildContext context) async {
    final box = Hive.box<SaleModel>('sales');
    final unsynced = box.values.where((sale) => !sale.synced).toList();

    for (var sale in unsynced) {
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate sync
      sale.synced = true;
      await sale.save();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${unsynced.length} sales synced!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SaleModel>('sales');
    final unsynced = box.values.where((sale) => !sale.synced).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Sync Sales")),
      body: Column(
        children: [
          ListTile(
            title: Text("Unsynced Sales: ${unsynced.length}"),
          ),
          ElevatedButton(
            onPressed: () => _syncSales(context),
            child: const Text("Sync Now"),
          ),
        ],
      ),
    );
  }
}
