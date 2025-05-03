import 'package:flutter/material.dart';
import '../../../core/utils/notification_helper.dart';
import '../../../data/models/app_notification.dart';

class ToastNotification extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback onDismiss;

  const ToastNotification({
    super.key,
    required this.notification,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final color = NotificationHelper.getColor(notification.type);
    final icon = NotificationHelper.getIcon(notification.type);

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.up,
      onDismissed: (_) => onDismiss(),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        color: color.withOpacity(0.9),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(notification.message, style: const TextStyle(color: Colors.white)),
          subtitle: Text(
            _formatTimestamp(notification.timestamp),
            style: const TextStyle(color: Colors.white70),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: onDismiss,
          ),
          onTap: notification.onAction,
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes} mins ago';
    if (diff.inDays < 1) return '${diff.inHours} hrs ago';
    return '${diff.inDays} days ago';
  }
}
