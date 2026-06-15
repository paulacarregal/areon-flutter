
import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/maps_screen.dart';
import '../screens/login_screen.dart';
import '../screens/cadastro_screen.dart';
import '../screens/profile_quiz_screen.dart';
import '../screens/review_screen.dart';
import '../screens/post_detail_screen.dart';
import '../screens/navigation_screen.dart';
import '../routes/route_names.dart';
import '../screens/favoritos_screen.dart';
import '../screens/perfil_screen.dart';



class AppRoutes {

  static Map<String, WidgetBuilder> routes = {
    RouteNames.login: (_) => const LoginScreen(),
    RouteNames.cadastro: (_) => const CadastroScreen(),
    RouteNames.quiz: (_) => const ProfileQuizScreen(),
    RouteNames.detail: (_) => const PostDetailScreen(),
    RouteNames.review: (_) => const ReviewScreen(),
    RouteNames.navigation: (_) => const NavigationScreen(),
    RouteNames.favorites: (_) => const FavoritesScreen(),
    RouteNames.profile: (_) => const ProfileScreen(),
    RouteNames.maps: (_) => const MapsScreen(),
    RouteNames.splash: (_) => const SplashScreen(),

  };
}