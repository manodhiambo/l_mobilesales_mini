import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  final List<String> lineItems;
  final double subtotal;
  final double tax;
  final double discount;
  final double total;

  OrderSummaryScreen({
    required this.lineItems,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...lineItems.map((item) => Text(item)).toList(),
            Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
            Text('Tax: \$${tax.toStringAsFixed(2)}'),
            Text('Discount: -\$${discount.toStringAsFixed(2)}'),
            Text('Total: \$${total.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                // Implement the order confirmation flow
              },
              child: Text('Submit Order'),
            ),
          ],
        ),
      ),
    );
  }
}
