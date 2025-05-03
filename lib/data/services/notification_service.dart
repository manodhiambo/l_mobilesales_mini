import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/app_notification.dart';

class NotificationService {
  static final _uuid = const Uuid();

  static AppNotification create({
    required String message,
    required NotificationType type,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return AppNotification(
      id: _uuid.v4(),
      message: message,
      type: type,
      timestamp: DateTime.now(),
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }
}
