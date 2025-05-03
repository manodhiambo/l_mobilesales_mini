import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageGallery(product),
            _buildSectionHeader('Product Information'),
            _buildInfoTile('SKU', product.sku),
            _buildInfoTile('Category', product.category),
            _buildInfoTile('Description', product.description),
            _buildInfoTile('Price', 'KES ${product.price.toStringAsFixed(2)}'),
            _buildInfoTile('Dimensions', product.packageDetails),
            _buildInfoTile('Barcode', product.barcode),
	    _buildSectionHeader('Stock Information'),
  	    _buildStockInfoTile('Warehouse 1', product.stockLevelWarehouse1),
  	    _buildStockInfoTile('Warehouse 2', product.stockLevelWarehouse2),
            _buildStockInfoTile('Warehouse 3', product.stockLevelWarehouse3),
	    _buildSectionHeader('Related Products'),
  	    _buildRelatedProductsCarousel(product.relatedProducts),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGallery(ProductModel product) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: product.imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            product.imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }

  Widget _buildStockInfoTile(String warehouse, int stockLevel) {
    String status;
    Color indicatorColor;

    if (stockLevel > 50) {
      status = 'Good Stock';
      indicatorColor = Colors.green;
    } else if (stockLevel > 0) {
      status = 'Low Stock';
      indicatorColor = Colors.orange;
    } else {
      status = 'Out of Stock';
      indicatorColor = Colors.red;
    }

    return ListTile(
      title: Text(warehouse),
      subtitle: Text('$status: $stockLevel units'),
      trailing: Icon(Icons.check_circle, color: indicatorColor),
    );
  }

  Widget _buildRelatedProductsCarousel(List<ProductModel> relatedProducts) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: relatedProducts.length,
        itemBuilder: (context, index) {
          final relatedProduct = relatedProducts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the detailed view of the related product
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: relatedProduct),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      relatedProduct.imageUrls.first,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            relatedProduct.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('SKU: ${relatedProduct.sku}'),
                          Text('Price: \$${relatedProduct.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
