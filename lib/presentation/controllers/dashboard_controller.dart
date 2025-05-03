import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  // State Variables
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';
  int _totalSales = 0;
  int _totalOrders = 0;
  int _itemsSold = 0;
  List<Map<String, dynamic>> _recentTransactions = [];
  int _unreadNotifications = 0;

  // Getters for accessing state variables
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  int get totalSales => _totalSales;
  int get totalOrders => _totalOrders;
  int get itemsSold => _itemsSold;
  List<Map<String, dynamic>> get recentTransactions => _recentTransactions;
  int get unreadNotifications => _unreadNotifications;

  // Methods to update the state

  // Start loading state
  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  // Stop loading state
  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  // Set error state
  void _setError(String message) {
    _hasError = true;
    _errorMessage = message;
    notifyListeners();
  }

  // Clear error state
  void _clearError() {
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }

  // Simulate fetching sales data
  Future<void> fetchSalesData() async {
    _startLoading();
    try {
      // Simulate a delay for fetching data
      await Future.delayed(Duration(seconds: 2));

      // Update the sales data
      _totalSales = 5000; // Simulate a sales value
      _totalOrders = 200; // Simulate an orders count
      _itemsSold = 150;   // Simulate items sold

      // Clear any existing errors
      _clearError();
    } catch (e) {
      // Handle any errors
      _setError('Failed to fetch sales data');
    } finally {
      _stopLoading();
    }
  }

  // Simulate fetching recent transactions
  Future<void> fetchRecentTransactions() async {
    _startLoading();
    try {
      // Simulate a delay for fetching transactions
      await Future.delayed(Duration(seconds: 2));

      // Simulate recent transactions
      _recentTransactions = List.generate(5, (index) {
        return {
          'transactionId': 'T${index + 1}',
          'customerName': 'Customer ${index + 1}',
          'amount': (index + 1) * 100,
          'status': 'Completed',
        };
      });

      // Clear any existing errors
      _clearError();
    } catch (e) {
      // Handle any errors
      _setError('Failed to fetch recent transactions');
    } finally {
      _stopLoading();
    }
  }

  // Simulate fetching notifications
  Future<void> fetchNotifications() async {
    _startLoading();
    try {
      // Simulate a delay for fetching notifications
      await Future.delayed(Duration(seconds: 1));

      // Simulate unread notifications count
      _unreadNotifications = 3;

      // Clear any existing errors
      _clearError();
    } catch (e) {
      // Handle any errors
      _setError('Failed to fetch notifications');
    } finally {
      _stopLoading();
    }
  }

  // Pull to refresh - update all sections
  Future<void> refreshDashboard() async {
    await Future.wait([
      fetchSalesData(),
      fetchRecentTransactions(),
      fetchNotifications(),
    ]);
  }
}
