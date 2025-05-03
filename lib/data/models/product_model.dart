class ProductModel {
  final String id;
  final String name;
  final String sku;
  final String category;
  final String description;
  final double price;
  final String packageDetails;
  final String barcode;
  final List<String> imageUrls;
  final int stockLevelWarehouse1;
  final int stockLevelWarehouse2;
  final int stockLevelWarehouse3;
  final List<ProductModel> relatedProducts;

  ProductModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    required this.description,
    required this.price,
    required this.packageDetails,
    required this.barcode,
    required this.imageUrls,
    required this.stockLevelWarehouse1,
    required this.stockLevelWarehouse2,
    required this.stockLevelWarehouse3,
    required this.relatedProducts,
  });
}
