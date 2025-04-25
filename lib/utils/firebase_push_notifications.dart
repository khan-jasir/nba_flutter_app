import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:nba_flutter_app/utils/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebasePushNotifications {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String _channelId = 'high_importance_channel';
  static const String _channelName = 'High Importance Notifications';
  static const String _channelDescription = 'This channel is used for important notifications.';

  static Future<void> init() async {
    try {
      await _requestPermissions();
      await _initializeLocalNotifications();
      await _setupMessageHandlers();
      await _getAndPrintToken();
    } catch (e) {
      debugPrint('Error initializing Firebase Push Notifications: $e');
      rethrow;
    }
  }

  static Future<void> _requestPermissions() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    debugPrint('Notification permission status: ${settings.authorizationStatus}');
  }

  static Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    await _localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );
  }

  static Future<void> _getAndPrintToken() async {
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');
  }

  static Future<void> _setupMessageHandlers() async {
    // Foreground message handler
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Notification click handlers
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationClick);
    
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationClick(initialMessage);
    }
  }

  static Future<void> _handleForegroundMessage(RemoteMessage message) async {
    debugPrint('Received foreground message: ${message.messageId}');
    
    if (message.data['isInApp'] == 'true') {
      await NotificationService.incrementNotificationCount();
      return;
    }

    if (message.notification != null) {
      await _showNotification(message);
    }
  }

  static void _handleNotificationClick(RemoteMessage message) {
    debugPrint('Notification clicked with data: ${message.data}');
    // Add navigation logic here based on message data
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      enableLights: true,
      color: Colors.blue,
    );

    await _localNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(android: androidDetails),
      payload: message.data.toString(),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  debugPrint('Handling background message: ${message.messageId}');

  if (message.data['isInApp'] == 'true') {
    final currentCount = prefs.getInt('notification_count') ?? 0;
    await prefs.setInt('notification_count', currentCount + 1);
    return;
  }

  if (message.notification != null) {
    const androidDetails = AndroidNotificationDetails(
      FirebasePushNotifications._channelId,
      FirebasePushNotifications._channelName,
      channelDescription: FirebasePushNotifications._channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    await FirebasePushNotifications._localNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(android: androidDetails),
      payload: message.data.toString(),
    );
  }
}
