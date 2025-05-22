import 'package:flutter/material.dart';

class QuickActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(context, Icons.add, 'New Sale', '/new-sale'),
          _buildActionButton(context, Icons.store, 'Inventory Check', '/inventory'),
          _buildActionButton(context, Icons.search, 'Customer Lookup', '/customer-lookup'),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, IconData icon, String label, String route) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
