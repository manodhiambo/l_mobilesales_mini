import 'package:flutter/material.dart';
import '../../data/models/app_notification.dart';

class NotificationController extends ChangeNotifier {
  final List<AppNotification> _notifications = [];

  List<AppNotification> get notifications => List.unmodifiable(_notifications);

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification); // Stack latest first
    notifyListeners();
  }

  void removeNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
    notifyListeners();
  }

  void clearOldNotifications() {
    _notifications.removeWhere(
      (n) => DateTime.now().difference(n.timestamp).inDays > 7,
    );
    notifyListeners();
  }
}
