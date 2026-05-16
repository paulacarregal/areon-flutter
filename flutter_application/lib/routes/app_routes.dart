import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/cadastro_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/profile_quiz_screen.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> routes = {

    '/': (context) =>
        const LoginScreen(),

    '/cadastro': (context) =>
        const CadastroScreen(),

    '/quiz': (context) =>
        const QuizScreen(),

    '/menu': (context) =>
        const MenuScreen(),
  };
}