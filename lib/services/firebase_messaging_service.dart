import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyFirebaseMessagingService {
  Future<void> init() async {
    // Ensure Awesome Notifications is initialized

    // Check and request notification permissions
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    //  await getToken();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10, // Notification ID
          channelKey: 'basic_channel',
          title: message.notification?.title,
          body: message.notification?.body,
          notificationLayout: NotificationLayout.Default,
        ),
      );
    });
  }

  // Future<String?> getToken() async {
  //   final token = await FirebaseMessaging.instance.getToken();

  //   return token;
  // }
}
