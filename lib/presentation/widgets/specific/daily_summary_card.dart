import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/presentation/controllers/dashboard_controller.dart';

class DailySummaryCard extends StatelessWidget {
  final DashboardController controller;

  DailySummaryCard({required this.controller});

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
              'Daily Sales Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Sales: \$${controller.totalSales}'),
                Text('Total Orders: ${controller.totalOrders}'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items Sold: ${controller.itemsSold}'),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to detailed sales report
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
