import 'package:flutter/material.dart';

class QuantityAndPricingScreen extends StatefulWidget {
  @override
  _QuantityAndPricingScreenState createState() => _QuantityAndPricingScreenState();
}

class _QuantityAndPricingScreenState extends State<QuantityAndPricingScreen> {
  int _quantity = 1;
  double _unitPrice = 20.0; // Example unit price
  double _discount = 0.0; // Discount in percentage

  double get _lineTotal => (_unitPrice * _quantity) * (1 - _discount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quantity & Pricing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Unit Price: \$$_unitPrice'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                Text('Quantity: $_quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            Text('Discount: $_discount%'),
            Text('Line Total: \$${_lineTotal.toStringAsFixed(2)}'),
            // Display the final order calculation
          ],
        ),
      ),
    );
  }
}
