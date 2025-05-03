import 'package:flutter/material.dart';

class QuickActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.add, 'New Sale'),
        _buildActionButton(Icons.store, 'Inventory Check'),
        _buildActionButton(Icons.search, 'Customer Lookup'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(icon: Icon(icon), onPressed: () {}),
        Text(label),
      ],
    );
  }
}
