import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/customer_model.dart';

class FirebaseCustomerService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('customers');

  Future<List<Customer>> fetchCustomers() async {
    final snapshot = await _ref.orderBy('name').get();
    return snapshot.docs
        .map((doc) => Customer.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Stream<List<Customer>> streamCustomers() {
    return _ref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Customer.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList());
  }

  Future<List<Customer>> searchCustomers(String query) async {
    final snapshot = await _ref
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .get();
    return snapshot.docs
        .map((doc) => Customer.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
