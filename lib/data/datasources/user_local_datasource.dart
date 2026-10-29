import '../models/user_model.dart';

/// Fuente de datos simulada local para UserMaster con Future.delayed.
abstract class UserLocalDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<void> sendPasswordReset(String email);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulación de respuesta con delay
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      id: 'usr_001',
      name: 'Usuario Master',
      email: email,
    );
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
    );
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

