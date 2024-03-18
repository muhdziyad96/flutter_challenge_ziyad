import 'package:flutter_challenge_ziyad/routes/app_routes.dart';
import 'package:flutter_challenge_ziyad/screen/auth/login_screen.dart';
import 'package:flutter_challenge_ziyad/screen/auth/sign_up_screen.dart';
import 'package:flutter_challenge_ziyad/screen/home/home_screen.dart';
import 'package:flutter_challenge_ziyad/screen/main/details_screen.dart';
import 'package:flutter_challenge_ziyad/screen/splash_screen.dart';
import 'package:flutter_challenge_ziyad/screen/welcome_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const home = AppRoutes.home;
  static const splashScreen = AppRoutes.splashScreen;

  static final pageList = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.details,
      page: () => const DetailScreen(),
    ),
  ];
}
