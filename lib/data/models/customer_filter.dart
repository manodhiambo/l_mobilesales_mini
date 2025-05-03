class CustomerFilter {
  final String? category;
  final String? type;
  final String? region;
  final String? creditStatus;
  final String? orderFrequency;

  CustomerFilter({
    this.category,
    this.type,
    this.region,
    this.creditStatus,
    this.orderFrequency,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'category': category,
      'type': type,
      'region': region,
      'creditStatus': creditStatus,
      'orderFrequency': orderFrequency,
    };

    // Remove null or empty string values
    map.removeWhere((key, value) => value == null || (value is String && value.trim().isEmpty));

    return map;
  }
}

