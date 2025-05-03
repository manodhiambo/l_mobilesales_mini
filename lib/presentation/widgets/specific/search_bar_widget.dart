import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';

class ProductSearchBar extends StatefulWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onProductSelected;

  const ProductSearchBar({
    required this.products,
    required this.onProductSelected,
    Key? key,
  }) : super(key: key);

  @override
  _ProductSearchBarState createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  late TextEditingController _controller;
  List<ProductModel> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = widget.products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.sku.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: _filterProducts,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search by name or SKU...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 10),
        if (_filteredProducts.isNotEmpty)
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('SKU: ${product.sku}'),
                  onTap: () {
                    widget.onProductSelected(product);
                    _controller.clear();
                    setState(() => _filteredProducts.clear());
                  },
                );
              },
            ),
          )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
