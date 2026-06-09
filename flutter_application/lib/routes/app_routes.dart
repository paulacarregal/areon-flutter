import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/cadastro_screen.dart';
import '../screens/profile_quiz_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/maps_screen.dart';
import '../screens/review_screen.dart';
import '../screens/favoritos_screen.dart';
import '../screens/perfil_screen.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> routes = {

    '/': (context) => const LoginScreen(),

    '/cadastro': (context) => const CadastroScreen(),

    '/quiz': (context) => const QuizScreen(),

    '/menu': (context) => const MenuScreen(),

    '/mapa': (context) => const MapsScreen(),

    '/review': (context) => const ReviewScreen(),

    '/favoritos': (context) => const FavoritosScreen(),

    '/perfil': (context) => const PerfilScreen(),
  };
}