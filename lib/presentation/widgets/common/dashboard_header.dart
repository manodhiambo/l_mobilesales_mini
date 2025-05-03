import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/presentation/controllers/dashboard_controller.dart';

class DashboardHeader extends StatelessWidget {
  final DashboardController controller;

  DashboardHeader({required this.controller});

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final greeting = currentTime.hour < 12
        ? 'Good Morning'
        : currentTime.hour < 18
            ? 'Good Afternoon'
            : 'Good Evening';
    final date = '${currentTime.day}/${currentTime.month}/${currentTime.year}';
    final day = currentTime.weekday == 7
        ? 'Sunday'
        : currentTime.weekday == 1
            ? 'Monday'
            : currentTime.weekday == 2
                ? 'Tuesday'
                : currentTime.weekday == 3
                    ? 'Wednesday'
                    : currentTime.weekday == 4
                        ? 'Thursday'
                        : currentTime.weekday == 5
                            ? 'Friday'
                            : 'Saturday';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$greeting, ${controller.totalSales}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$day, $date',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.notifications),
              SizedBox(width: 8),
              Text('You have ${controller.unreadNotifications} unread notifications'),
            ],
          ),
        ],
      ),
    );
  }
}
