import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample mock product data
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Sugar 2kg',
        'sku': 'SUG002',
        'stock': 20,
        'price': 240.00,
      },
      {
        'name': 'Cooking Oil 1L',
        'sku': 'OIL001',
        'stock': 12,
        'price': 320.00,
      },
      {
        'name': 'Bar Soap',
        'sku': 'SOAP010',
        'stock': 8,
        'price': 60.00,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add New Item',
            onPressed: () {
              Navigator.pushNamed(context, '/item-add');
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.inventory_2),
              title: Text(product['name']),
              subtitle: Text('SKU: ${product['sku']}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${product['stock']} in stock',
                    style: TextStyle(
                      color: product['stock'] < 10 ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Ksh ${product['price'].toStringAsFixed(2)}'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/product-detail',
                  arguments: product, // Replace with ProductModel if available
                );
              },
            ),
          );
        },
      ),
    );
  }
}
