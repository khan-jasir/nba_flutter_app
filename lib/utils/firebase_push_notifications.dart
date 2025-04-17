import 'package:firebase_messaging/firebase_messaging.dart';

class FirebasePushNotifications {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;


  static void getToken() async {
    String? token = await messaging.getToken();
    print('Token : : $token');
  }

}