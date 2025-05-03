import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:l_mobilesales_mini/data/models/customer_model.dart';
import 'package:l_mobilesales_mini/data/models/customer_filter.dart';

class CustomerController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<CustomerModel> _customers = [];
  List<CustomerModel> get customers => _customers;

  bool isLoading = false;

  /// Fetch all customers from Firestore
  Future<void> fetchCustomers() async {
    isLoading = true;
    notifyListeners();

    try {
      final snapshot = await _firestore.collection('customers').get();
      _customers = snapshot.docs
          .map((doc) => CustomerModel.fromFirestore(
                doc.data() as Map<String, dynamic>,
                doc.id,
              ))
          .toList();
    } catch (e) {
      debugPrint('❌ Error fetching customers: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  /// Search customers locally by name or region
  void searchCustomers(String query) {
    final lowerQuery = query.toLowerCase();
    _customers = _customers
        .where((c) =>
            c.name.toLowerCase().contains(lowerQuery) ||
            c.region.toLowerCase().contains(lowerQuery))
        .toList();
    notifyListeners();
  }

  /// Filter customers using Firestore based on provided filters
  Future<void> filterCustomers(CustomerFilter filter) async {
    isLoading = true;
    notifyListeners();

    try {
      Query query = _firestore.collection('customers');
      final filterMap = filter.toMap();

      for (var entry in filterMap.entries) {
        query = query.where(entry.key, isEqualTo: entry.value);
      }

      final snapshot = await query.get();
      _customers = snapshot.docs
          .map((doc) => CustomerModel.fromFirestore(
                doc.data() as Map<String, dynamic>,
                doc.id,
              ))
          .toList();
    } catch (e) {
      debugPrint('❌ Error filtering customers: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
