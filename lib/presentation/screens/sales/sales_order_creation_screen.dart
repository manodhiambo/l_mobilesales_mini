import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/presentation/widgets/specific/customer_search.dart';

class SalesOrderCreationScreen extends StatefulWidget {
  @override
  _SalesOrderCreationScreenState createState() =>
      _SalesOrderCreationScreenState();
}

class _SalesOrderCreationScreenState extends State<SalesOrderCreationScreen> {
  Map<String, dynamic>? _selectedCustomer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Sales Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomerSearch(
              onCustomerSelected: (customer) {
                setState(() {
                  _selectedCustomer = customer; // Assuming the passed customer is a Map<String, dynamic>
                });
              },
            ),
            if (_selectedCustomer != null) ...[
              // Safely accessing the customer name
              Text("Customer: ${_selectedCustomer!['name'] ?? 'N/A'}"),
              // Checking if the 'contact' key exists before accessing
              if (_selectedCustomer!.containsKey('contact'))
                Text("Contact: ${_selectedCustomer!['contact'] ?? 'N/A'}"),
            ],
          ],
        ),
      ),
    );
  }
}
