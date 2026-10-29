import '../entities/user_entity.dart';

/// Contrato de repositorio para operaciones de usuario en la capa de Dominio.
abstract class UserRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String name, String email, String password);
  Future<void> sendPasswordReset(String email);
  Future<void> logout();
}

