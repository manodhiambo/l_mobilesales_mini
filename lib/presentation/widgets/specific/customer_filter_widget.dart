import 'package:flutter/material.dart';
import 'package:l_mobilesales_mini/data/models/customer_filter.dart';

class CustomerFilterWidget extends StatefulWidget {
  final Function(CustomerFilter) onApply;

  const CustomerFilterWidget({Key? key, required this.onApply}) : super(key: key);

  @override
  State<CustomerFilterWidget> createState() => _CustomerFilterWidgetState();
}

class _CustomerFilterWidgetState extends State<CustomerFilterWidget> {
  String? category;
  String? type;
  String? region;
  String? creditStatus;
  String? orderFrequency;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Filter Customers"),
      children: [
        DropdownButtonFormField<String>(
          value: category,
          hint: const Text("Customer Category"),
          items: ['A+', 'A', 'B+', 'B', 'C+', 'C'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) => setState(() => category = value),
        ),
        DropdownButtonFormField<String>(
          value: type,
          hint: const Text("Customer Type"),
          items: ['Dealer', 'Retailer', 'Garage'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) => setState(() => type = value),
        ),
        DropdownButtonFormField<String>(
          value: region,
          hint: const Text("Region"),
          items: ['Nairobi', 'Western', 'Nyanza', 'Central'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) => setState(() => region = value),
        ),
        DropdownButtonFormField<String>(
          value: creditStatus,
          hint: const Text("Credit Status"),
          items: ['Good', 'Overdue', 'On Hold'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) => setState(() => creditStatus = value),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onApply(CustomerFilter(
              category: category,
              type: type,
              region: region,
              creditStatus: creditStatus,
              orderFrequency: orderFrequency,
            ));
          },
          child: const Text("Apply Filters"),
        ),
      ],
    );
  }
}
