import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'firebase_options.dart';

import 'routes/app_routes.dart';
import 'routes/route_names.dart';

import 'services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:provider/provider.dart';
import 'providers/alert_provider.dart';

import 'package:flutter/foundation.dart';

void main() async {
  // 1. Garante a inicialização dos bindings do Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Carrega as variáveis de ambiente do arquivo .env primeiro
  await dotenv.load(fileName: ".env");

  // 3. Inicializa o Firebase passando as opções geradas pelo FlutterFire
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 4. Inicializa o seu serviço de notificações locais
  await NotificationService.initialize();

  // 5. Solicita permissão para notificações push (Firebase Messaging)
  await FirebaseMessaging.instance.requestPermission();
  
  // 6. Busca o token do dispositivo para testes de push
  if (!kIsWeb) {
    await FirebaseMessaging.instance.requestPermission();

    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN: $token");
  }

  // 7. Rodar o aplicativo injetando os Providers
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