import 'package:flutter/material.dart';
import '../pages/dashboard_page.dart';
import '../pages/forgot_password_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/register_page.dart';
import '../pages/splash_page.dart';

/// Nombres de las rutas centralizadas de la aplicación UserMaster.
abstract final class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String registro = '/registro'; // Alias de compatibilidad
  static const String forgotPassword = '/forgot_password';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
}

/// Mapa de rutas que consume [MaterialApp] en `app.dart`.
Map<String, WidgetBuilder> get appRoutes => <String, WidgetBuilder>{
  AppRoutes.splash: (context) => const SplashPage(),
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.register: (context) => const RegisterPage(),
  AppRoutes.registro: (context) => const RegisterPage(),
  AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
  AppRoutes.dashboard: (context) => const DashboardPage(),
  AppRoutes.profile: (context) => const ProfilePage(),
};
