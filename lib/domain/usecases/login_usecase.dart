import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

/// Caso de uso para iniciar sesión simulado en UserMaster.
class LoginUseCase {
  final UserRepository repository;

  const LoginUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}

