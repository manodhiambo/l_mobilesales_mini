import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final Function(String category)? onFilterChanged;

  const ProductListView({
    Key? key,
    required this.products,
    this.onFilterChanged,
  }) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ScrollController _scrollController = ScrollController();
  int _loadedItems = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        _loadedItems += 10;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibleProducts = widget.products.take(_loadedItems).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            hint: const Text("Filter by Category"),
            onChanged: widget.onFilterChanged,
            items: widget.products
                .map((product) => product['category'] as String)
                .toSet()
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: visibleProducts.length,
            itemBuilder: (context, index) {
              final product = visibleProducts[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(product['imageUrl'], width: 50, height: 50),
                  title: Text(product['name'] ?? 'No name'),
                  subtitle: Text('SKU: ${product['sku']}\nCategory: ${product['category']}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${product['stock']} in stock',
                          style: TextStyle(
                              color: product['stock'] > 10 ? Colors.green : Colors.red)),
                      Text('\$${product['price']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    // Navigate to product details screen (to be implemented)
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

