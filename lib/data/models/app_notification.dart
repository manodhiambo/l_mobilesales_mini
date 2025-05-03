import 'package:flutter/material.dart'; 
enum NotificationType { success, warning, error, info }

class AppNotification {
  final String id;
  final String message;
  final NotificationType type;
  final DateTime timestamp;
  final String? actionLabel;
  final VoidCallback? onAction;

  AppNotification({
    required this.id,
    required this.message,
    required this.type,
    required this.timestamp,
    this.actionLabel,
    this.onAction,
  });
}
