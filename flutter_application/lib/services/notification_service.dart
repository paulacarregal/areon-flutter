import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {

    const androidSettings =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    await notifications.initialize(
      const InitializationSettings(
        android: androidSettings,
      ),
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {

        notifications.show(
          0,
          message.notification?.title,
          message.notification?.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'alert_channel',
              'Alertas',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
        );
      },
    );
  }
}