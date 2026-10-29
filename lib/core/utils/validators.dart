/// Validadores reutilizables para formularios de UserMaster.
class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'El correo electrónico es requerido';
    if (!email.contains('@') || !email.contains('.')) {
      return 'Ingresa un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'La contraseña es requerida';
    if (password.length < 6) return 'Mínimo 6 caracteres requeridos';
    return null;
  }

  static String? validateName(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) return 'El nombre es requerido';
    if (name.length < 3) return 'Mínimo 3 caracteres requeridos';
    return null;
  }
}

