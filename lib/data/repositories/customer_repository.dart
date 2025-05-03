import '../models/customer_model.dart';
import '../services/firebase_customer_service.dart';

class CustomerRepository {
  final FirebaseCustomerService _service = FirebaseCustomerService();

  Future<List<Customer>> getAllCustomers() => _service.fetchCustomers();
  Stream<List<Customer>> getCustomerStream() => _service.streamCustomers();
  Future<List<Customer>> search(String query) => _service.searchCustomers(query);
}
