class CustomerModel {
  final String id;
  final String name;
  final String category;
  final String type;
  final String contactPerson;
  final String phone;
  final String email;
  final String address;
  final String region;
  final String taxId;
  final double latitude;
  final double longitude;
  final DateTime lastOrderDate;

  CustomerModel({
    required this.id,
    required this.name,
    required this.category,
    required this.type,
    required this.contactPerson,
    required this.phone,
    required this.email,
    required this.address,
    required this.region,
    required this.taxId,
    required this.latitude,
    required this.longitude,
    required this.lastOrderDate,
  });

  factory CustomerModel.fromFirestore(Map<String, dynamic> data, String id) {
    return CustomerModel(
      id: id,
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      type: data['type'] ?? '',
      contactPerson: data['contactPerson'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      region: data['region'] ?? '',
      taxId: data['taxId'] ?? '',
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
      lastOrderDate: DateTime.tryParse(data['lastOrderDate'] ?? '') ?? DateTime.now(),
    );
  }
}

