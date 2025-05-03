import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/data/models/customer_model.dart';
class CustomerDetailScreen extends StatelessWidget {
  final CustomerModel customer;

  const CustomerDetailScreen({required this.customer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(customer.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Category: ${customer.category}'),
            Text('Contact: ${customer.contactPerson}'),
            Text('Phone: ${customer.phone}'),
            Text('Email: ${customer.email}'),
            Text('Region: ${customer.region}'),
            Text('Tax ID: ${customer.taxId}'),
            Text('Last Order: ${customer.lastOrderDate.toLocal().toString().split(' ')[0]}'),
          ],
        ),
      ),
    );
  }
}
