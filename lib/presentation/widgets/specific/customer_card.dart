import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/data/models/customer_model.dart';

class CustomerCard extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback? onTap;

  const CustomerCard({super.key, required this.customer, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customer.name),
      subtitle: Text('${customer.contactPerson} • ${customer.region}'),
      trailing: Text(customer.category),
      onTap: onTap,
    );
  }
}
