import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_button.dart';

/// Pantalla de Perfil de Usuario.
/// Muestra un avatar genérico, el nombre del usuario, su correo
/// y un botón rojo de "Cerrar sesión" que destruye el historial de navegación.
class ProfilePage extends StatelessWidget {
  final bool showAppBar;

  const ProfilePage({
    super.key,
    this.showAppBar = true,
  });

  void _cerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas salir de UserMaster?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () {
              Navigator.pop(dialogContext);
              // Destruye el historial de navegación y regresa al Login
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            child: const Text('Salir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar genérico con icono
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: const CircleAvatar(
              radius: 54,
              backgroundColor: Color(0xFFE2E8F0),
              child: Icon(
                Icons.person,
                size: 64,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Nombre de usuario
          const Text(
            'Usuario Master',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),

          // Correo del usuario
          const Text(
            'usuario@usermaster.com',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 32),

          // Tarjeta de información de la cuenta
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.border),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.badge_outlined, color: AppColors.primary),
                  title: const Text('Rol'),
                  subtitle: const Text('Administrador'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                ListTile(
                  leading: const Icon(Icons.security_outlined, color: AppColors.primary),
                  title: const Text('Seguridad'),
                  subtitle: const Text('Autenticación local'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                ListTile(
                  leading: const Icon(Icons.verified_user_outlined, color: AppColors.primary),
                  title: const Text('Estado de la cuenta'),
                  subtitle: const Text('Activa y verificada'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Botón rojo de Cerrar sesión
          CustomButton(
            text: 'Cerrar sesión',
            icon: Icons.logout,
            backgroundColor: AppColors.danger,
            textColor: AppColors.textLight,
            onPressed: () => _cerrarSesion(context),
          ),
        ],
      ),
    );

    if (!showAppBar) {
      return content;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: content,
    );
  }
}

