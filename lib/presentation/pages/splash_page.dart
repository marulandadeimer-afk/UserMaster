import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../routes/app_routes.dart';

/// Pantalla inicial de bienvenida.
/// Muestra el logo centrado con el color principal de fondo durante 3 segundos
/// antes de redirigir automáticamente a la pantalla de Inicio de Sesión.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const Duration _duracionSplash = Duration(seconds: 3);
  Timer? _temporizador;

  @override
  void initState() {
    super.initState();
    _temporizador = Timer(_duracionSplash, () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.flutter_dash,
                size: 90,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'UserMaster',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textLight,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'App Base con Clean Architecture',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight.withOpacity(0.85),
              ),
            ),
            const SizedBox(height: 40),
            const SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

