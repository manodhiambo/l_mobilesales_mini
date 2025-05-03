import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductSearch extends StatefulWidget {
  final Function(Map<String, dynamic>) onProductSelected;

  const ProductSearch({required this.onProductSelected, Key? key}) : super(key: key);

  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  String searchQuery = '';
  List<Map<String, dynamic>> productResults = [];

  void _searchProducts(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .get();

    setState(() {
      productResults = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Search Product'),
          onChanged: (value) {
            searchQuery = value;
            _searchProducts(searchQuery);
          },
        ),
        ...productResults.map((product) => ListTile(
              title: Text(product['name']),
              subtitle: Text('KES ${product['price']}'),
              onTap: () => widget.onProductSelected(product),
            )),
      ],
    );
  }
}
