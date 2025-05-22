import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummySales = List.generate(5, (index) {
      return {
        'id': index + 1,
        'client': 'Client ${index + 1}',
        'total': 1000.0 + index * 100,
        'date': DateTime.now().subtract(Duration(days: index)),
        'lineItems': [
          {'product': 'Product A', 'quantity': 2, 'price': 500},
          {'product': 'Product B', 'quantity': 1, 'price': 300},
        ],
        'subtotal': 1300.0 + index * 100,
        'tax': 100.0,
        'discount': 50.0,
        'totalPrice': 1350.0 + index * 100,
      };
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Sales Module")),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummySales.length,
        itemBuilder: (context, index) {
          final sale = dummySales[index];
          return Card(
            child: ListTile(
              title: Text("Sale #${sale['id']}"),
              subtitle: Text("Client: ${sale['client']} • Total: KES ${sale['total']}"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/order-summary',
                  arguments: {
                    'lineItems': sale['lineItems'],
                    'subtotal': sale['subtotal'],
                    'tax': sale['tax'],
                    'discount': sale['discount'],
                    'total': sale['totalPrice'],
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-sale');
        },
        child: const Icon(Icons.add),
        tooltip: 'Add New Sale',
      ),
    );
  }
}
