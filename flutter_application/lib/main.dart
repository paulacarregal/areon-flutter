import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import 'core/navigation_observer.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'routes/route_names.dart';
import 'services/logging_service.dart';
import 'services/metrics_service.dart';
import 'services/notification_service.dart';
import 'providers/alert_provider.dart';
import 'providers/auth_provider.dart' as app;
import 'providers/weather_provider.dart';
=======
import 'app.dart';
import 'firebase_options.dart';
import 'core/observability/logging_service.dart';
import 'core/observability/metrics_service.dart';
import 'features/alerts/presentation/alert_provider.dart';
import 'features/auth/presentation/auth_provider.dart';
import 'features/feed/presentation/post_provider.dart';
import 'features/map/presentation/place_provider.dart';
import 'features/notifications/notification_service.dart';
import 'features/profile/presentation/quiz_provider.dart';
import 'features/weather/presentation/weather_provider.dart';
>>>>>>> a7177f5 (refactor: ajeitando as pastas)

void main() async {
  final appStarted = Stopwatch()..start();
  WidgetsFlutterBinding.ensureInitialized();

<<<<<<< HEAD
  // Bootstrap observability before anything else
=======
>>>>>>> a7177f5 (refactor: ajeitando as pastas)
  metrics.init();
  log.info('App', 'starting');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  log.info('App', 'Firebase initialized');

<<<<<<< HEAD
  // FCM and local notifications are only supported on mobile/web.
  final bool supportsPush = !kIsWeb
      ? defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS
      : true;
=======
  final bool supportsPush = !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);
>>>>>>> a7177f5 (refactor: ajeitando as pastas)

  if (supportsPush) {
    await NotificationService.initialize();
    await FirebaseMessaging.instance.requestPermission();
    final token = await FirebaseMessaging.instance.getToken();
    log.info('App', 'FCM token obtained', extra: {'token': token});
    metrics.increment('aeon.app.session.start');
  }

  appStarted.stop();
  metrics.timing('aeon.app.start.duration_ms', appStarted.elapsed);
  log.info('App', 'boot complete',
      extra: {'duration_ms': appStarted.elapsedMilliseconds});

  runApp(
    MultiProvider(
      providers: [
<<<<<<< HEAD
        ChangeNotifierProvider(
          create: (_) => app.AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) {
            final provider = AlertProvider();
            provider.startListening();
            return provider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => WeatherProvider()..fetch(),
        ),
=======
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AlertProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()..fetch()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => PlaceProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
>>>>>>> a7177f5 (refactor: ajeitando as pastas)
      ],
      child: const AeonApp(),
    ),
  );
}
<<<<<<< HEAD

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AEON',
      initialRoute: RouteNames.login,
      routes: AppRoutes.routes,
      navigatorObservers: [MetricsNavigationObserver()],
    );
  }
}
=======
>>>>>>> a7177f5 (refactor: ajeitando as pastas)
