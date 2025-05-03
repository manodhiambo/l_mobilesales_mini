import 'package:hive/hive.dart';

part 'sale_model.g.dart';

@HiveType(typeId: 0)
class SaleModel extends HiveObject {
  @HiveField(0)
  final String clientName;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  bool synced;

  SaleModel({
    required this.clientName,
    required this.amount,
    required this.date,
    this.synced = false,
  });
}

