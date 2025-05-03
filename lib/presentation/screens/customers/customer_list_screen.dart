import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../presentation/controllers/customer_controller.dart';
import '../../../presentation/widgets/specific/customer_card.dart';
import 'customer_detail_screen.dart';
import 'package:l_mobilesales_mini/presentation/widgets/specific/customer_filter_widget.dart';
import 'package:l_mobilesales_mini/data/models/customer_filter.dart';
import 'package:l_mobilesales_mini/data/models/customer_model.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  CustomerFilter? activeFilter;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CustomerController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 🔍 Search bar
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: controller.searchCustomers,
                  ),
                ),

                // 🔎 Filter section
                CustomerFilterWidget(
                  onApply: (filter) async {
                    setState(() {
                      activeFilter = filter;
                    });
                    await controller.filterCustomers(filter); // Firestore filter logic
                  },
                ),

                // 🧾 Customer list
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.customers.length,
                    itemBuilder: (_, i) {
                      final c = controller.customers[i];
                      return CustomerCard(
                        customer: c,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CustomerDetailScreen(customer: c),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

