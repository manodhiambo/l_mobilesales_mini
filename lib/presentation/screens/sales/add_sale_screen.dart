import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../models/sale_model.dart';

class AddSaleScreen extends StatefulWidget {
  const AddSaleScreen({super.key});

  @override
  State<AddSaleScreen> createState() => _AddSaleScreenState();
}

class _AddSaleScreenState extends State<AddSaleScreen> {
  final _formKey = GlobalKey<FormState>();
  String client = '';
  double amount = 0.0;

  void _saveSale() async {
    if (_formKey.currentState!.validate()) {
      final sale = SaleModel(
        clientName: client,
        amount: amount,
        date: DateTime.now(),
      );
      final box = Hive.box<SaleModel>('sales');
      await box.add(sale);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sale added")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Sale")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Client Name"),
                onChanged: (val) => client = val,
                validator: (val) => val!.isEmpty ? "Enter client name" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                onChanged: (val) => amount = double.tryParse(val) ?? 0.0,
                validator: (val) => val!.isEmpty || double.tryParse(val) == null
                    ? "Enter valid amount"
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveSale,
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
