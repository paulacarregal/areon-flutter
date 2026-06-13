import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'routes/route_names.dart';

import 'services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:provider/provider.dart';
import 'providers/alert_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService.initialize();

  await FirebaseMessaging.instance
    .requestPermission();
  
  String? token =
      await FirebaseMessaging.instance.getToken();

  debugPrint("FCM TOKEN: $token");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final provider = AlertProvider();
            provider.startListening();
            return provider;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'AEON',

      initialRoute: RouteNames.login,

      routes: AppRoutes.routes,
    );
  }
}