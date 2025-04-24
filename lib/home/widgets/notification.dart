import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nba_flutter_app/notifications/view/notification_view.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';
import 'package:nba_flutter_app/utils/firebase_push_notifications.dart';
import 'package:nba_flutter_app/utils/notification_service.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.resumed) {
    NotificationService.initialize(); // Re-sync count on resume
  }
}

@override
void dispose() {
  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
}


  // void _setupNotificationListener() {
  //   // Listen for foreground messages
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //     if (message.data['isInApp'] == 'true') {
  //       await NotificationService.incrementNotificationCount();
  //     }
  //   });

  //   // Listen for background messages
  //   FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
  //     if (message.data['isInApp'] == 'true') {
  //       await NotificationService.incrementNotificationCount();
  //     }
  //     return Future.value();
  //   });
  // }

  Future<void> _reset() async {
    await NotificationService.resetNotificationCount();
  }
  
  Widget _buildNotificationWithBadge() {
    return IconButton(
      icon: ValueListenableBuilder<int>(
        valueListenable: NotificationService.notificationCount,
        builder: (context, count, child) {
          return Badge.count(
            backgroundColor: Color(0xffFF8A00),
            count: count,
            child: const Icon(Icons.notifications),
          );
        },
      ),
      onPressed: () {
        _reset();
        pushWithTransition(context, const NotificationView());
      },
    );
  }

  Widget _buildNotificationWithoutBadge() {
    return IconButton(
      onPressed: () {
        pushWithTransition(context, const NotificationView());
      },
      icon: const Icon(Icons.notifications), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NotificationService.notificationCount,
      builder: (context, count, child) {
        return count > 0
            ? _buildNotificationWithBadge()
            : _buildNotificationWithoutBadge();
      },
    );
  }
}
