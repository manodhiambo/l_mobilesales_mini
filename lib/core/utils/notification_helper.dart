import 'package:flutter/material.dart';
import '../../../data/models/app_notification.dart';

class NotificationHelper {
  static Color getColor(NotificationType type) {
    switch (type) {
      case NotificationType.success:
        return Colors.green;
      case NotificationType.warning:
        return Colors.orange;
      case NotificationType.error:
        return Colors.red;
      case NotificationType.info:
      default:
        return Colors.blue;
    }
  }

  static IconData getIcon(NotificationType type) {
    switch (type) {
      case NotificationType.success:
        return Icons.check_circle;
      case NotificationType.warning:
        return Icons.warning;
      case NotificationType.error:
        return Icons.error;
      case NotificationType.info:
      default:
        return Icons.info;
    }
  }
}
