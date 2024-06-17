import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  // LocalNotifications._internal();

  // static final _instance = LocalNotifications._internal();

  // factory LocalNotifications() {
  //   return _instance;
  // }

  static final plugin = FlutterLocalNotificationsPlugin();

  static Future<void> initial() async {
    const andriod = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: andriod);

    await plugin.initialize(settings);
  }

  static Future<void> show(
    String title,
    String body,
    String payload,
  ) async {
    const androidDetail = AndroidNotificationDetails(
      'other custom channel id',
      'other custom channel name',
      channelDescription: 'other custom channel dndndndnndfdfescription',
      // showWhen: false,
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetail);

    await plugin.show(
      999,
      title,
      body,
      notificationDetails,
    );
  }
}
