import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/controllers/notification_controller.dart';
import '../../presentation/widgets/common/toast_notification.dart';
import '../../data/models/app_notification.dart';
import '../../data/services/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: SafeArea(
        child: Consumer<NotificationController>(
          builder: (context, controller, child) {
            return Stack(
              children: [
                // Main content of the screen
                ListView.builder(
                  itemCount: 10, // Replace with actual number of notifications
                  itemBuilder: (_, index) {
                    // Mock notification content
                    final notification = AppNotification(
                      id: 'id$index',
                      message: 'New notification $index',
                      type: NotificationType.info,
                      timestamp: DateTime.now(),
                    );
                    return ListTile(
                      title: Text(notification.message),
                      subtitle: Text(notification.timestamp.toString()),
                    );
                  },
                ),

                // Notifications Toasts
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: controller.notifications.map((notification) {
                      return ToastNotification(
                        notification: notification,
                        onDismiss: () => controller.removeNotification(notification.id),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
