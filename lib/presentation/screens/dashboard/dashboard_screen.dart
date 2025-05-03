import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:l_mobilesales_mini/presentation/widgets/app_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("L-Mobile Dashboard")),
      drawer: AppDrawer(),  // Fixed here
      body: const Center(child: Text("Welcome to the Dashboard")),
    );
  }
}
