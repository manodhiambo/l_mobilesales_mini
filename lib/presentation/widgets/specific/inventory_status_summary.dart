import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/presentation/controllers/dashboard_controller.dart';

class InventoryStatusSummary extends StatelessWidget {
  final DashboardController controller;

  InventoryStatusSummary({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items in Stock: 150'),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to detailed inventory screen
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
