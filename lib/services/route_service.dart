import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_ziyad/screen/splash_screen.dart';
import 'package:flutter_challenge_ziyad/screen/welcome_screen.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/login':
        return CupertinoPageRoute(builder: (_) {
          return const SplashScreen();
        });
      case '/home':
        return CupertinoPageRoute(builder: (_) {
          return const WelcomeScreen();
        });

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
}
