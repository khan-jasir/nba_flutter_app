import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/login/view/login.dart';
import 'package:nba_flutter_app/utils/firebase_push_notifications.dart';
import 'package:nba_flutter_app/utils/notification_service.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Initialize Firebase
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBc6wqmEPfNAihjL_jmzyUrx77GLvQpT0Q',
        appId: '1:498795297534:android:060fcef50b078ad7d943af',
        messagingSenderId: '498795297534',
        projectId: 'flutter-nba',
        storageBucket: 'flutter-nba.firebasestorage.app',
      ),
    );

    // Initialize services
    await Future.wait([
      FirebasePushNotifications.init(),
      NotificationService.initialize(),
    ]);

    runApp(const MyApp());
  } catch (e) {
    debugPrint('Error initializing app: $e');
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Best Actions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        ],
        child: PhoneNumberScreen()
      )
    );
  }
}