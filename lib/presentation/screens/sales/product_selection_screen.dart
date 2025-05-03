import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/presentation/widgets/specific/product_search.dart';

class ProductSelectionScreen extends StatefulWidget {
  @override
  _ProductSelectionScreenState createState() => _ProductSelectionScreenState();
}

class _ProductSelectionScreenState extends State<ProductSelectionScreen> {
  Map<String, dynamic>? _selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductSearch(
              onProductSelected: (product) {
                setState(() {
                  _selectedProduct = product;
                });
              },
            ),
            if (_selectedProduct != null) ...[
              Text("Product: ${_selectedProduct!['name']}"),
              if (_selectedProduct!.containsKey('price'))
                Text("Price: ${_selectedProduct!['price']}"),
            ],
          ],
        ),
      ),
    );
  }
}
