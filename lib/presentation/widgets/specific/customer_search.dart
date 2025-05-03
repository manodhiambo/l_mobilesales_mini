import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerSearch extends StatefulWidget {
  final Function(Map<String, dynamic>) onCustomerSelected;

  const CustomerSearch({required this.onCustomerSelected, Key? key}) : super(key: key);

  @override
  _CustomerSearchState createState() => _CustomerSearchState();
}

class _CustomerSearchState extends State<CustomerSearch> {
  String searchQuery = '';
  List<Map<String, dynamic>> customerResults = [];

  void _searchCustomers(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('customers')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .get();

    setState(() {
      customerResults = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Search Customer'),
          onChanged: (value) {
            searchQuery = value;
            _searchCustomers(searchQuery);
          },
        ),
        ...customerResults.map((customer) => ListTile(
              title: Text(customer['name']),
              subtitle: Text(customer['contact'] ?? ''),
              onTap: () => widget.onCustomerSelected(customer),
            )),
      ],
    );
  }
}
