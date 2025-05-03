import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_mobilesales_mini/presentation/controllers/dashboard_controller.dart';
import '../widgets/common/dashboard_header.dart';
import '../widgets/specific/daily_summary_card.dart';
import '../widgets/specific/quick_action_buttons.dart';
import '../widgets/specific/recent_activity_feed.dart';
import '../widgets/specific/performance_chart.dart';
import '../widgets/specific/inventory_status_summary.dart';
import '../widgets/common/bottom_nav_bar.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access DashboardController
    final controller = Provider.of<DashboardController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: AppDrawer(),
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading spinner if data is being fetched
          : SingleChildScrollView(
              child: Column(
                children: [
                  DashboardHeader(controller: controller),
                  DailySummaryCard(controller: controller),
                  PerformanceChart(controller: controller),
                  InventoryStatusSummary(controller: controller),
                  QuickActionButtons(),
                  RecentActivityFeed(),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
