import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/login/view/login.dart';
import 'package:nba_flutter_app/utils/firebase_push_notifications.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'YOUR_API_KEY',
        appId: 'YOUR_APP_ID',
        messagingSenderId: 'YOUR_SENDER_ID',
        projectId: 'YOUR_PROJECT_ID',
      ),
    );
    await FirebasePushNotifications.getToken();
    runApp(const MyApp());
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
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