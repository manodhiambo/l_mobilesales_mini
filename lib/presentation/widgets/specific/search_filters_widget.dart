import 'package:flutter/material.dart';

class SearchFiltersWidget extends StatefulWidget {
  final Function(String category, bool inStock, RangeValues priceRange) onApply;

  const SearchFiltersWidget({required this.onApply, super.key});

  @override
  _SearchFiltersWidgetState createState() => _SearchFiltersWidgetState();
}

class _SearchFiltersWidgetState extends State<SearchFiltersWidget> {
  String selectedCategory = 'All';
  bool inStockOnly = false;
  RangeValues priceRange = const RangeValues(0, 1000);

  final List<String> categories = ['All', 'Electronics', 'Clothing', 'Books'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedCategory,
          onChanged: (value) {
            setState(() {
              selectedCategory = value!;
            });
          },
          items: categories.map((cat) {
            return DropdownMenuItem(
              value: cat,
              child: Text(cat),
            );
          }).toList(),
        ),
        SwitchListTile(
          title: const Text('In Stock Only'),
          value: inStockOnly,
          onChanged: (value) {
            setState(() {
              inStockOnly = value;
            });
          },
        ),
        const Text('Price Range'),
        RangeSlider(
          values: priceRange,
          min: 0,
          max: 1000,
          divisions: 20,
          labels: RangeLabels(
            '\$${priceRange.start.round()}',
            '\$${priceRange.end.round()}',
          ),
          onChanged: (values) {
            setState(() {
              priceRange = values;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            widget.onApply(selectedCategory, inStockOnly, priceRange);
          },
          child: const Text('Apply Filters'),
        )
      ],
    );
  }
}
