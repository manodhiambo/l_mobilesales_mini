import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic> orderData;

  const OrderConfirmationScreen({required this.orderData, Key? key}) : super(key: key);

  Future<void> _submitOrder() async {
    final ordersRef = FirebaseFirestore.instance.collection('orders');
    await ordersRef.add(orderData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Review your order...'),
            ElevatedButton(
              onPressed: () async {
                await _submitOrder();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order submitted successfully')),
                );
              },
              child: Text('Submit Order'),
            )
          ],
        ),
      ),
    );
  }
}
