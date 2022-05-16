// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:training_fetching/screens/home_screen.dart';
import 'package:training_fetching/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        return null;
    }
  }
}
