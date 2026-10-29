import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';
import '../mappers/user_mapper.dart';

/// Implementación del repositorio de usuario conectando datos con dominio.
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    final model = await localDataSource.login(email, password);
    return UserMapper.toEntity(model);
  }

  @override
  Future<UserEntity> register(String name, String email, String password) async {
    final model = await localDataSource.register(name, email, password);
    return UserMapper.toEntity(model);
  }

  @override
  Future<void> sendPasswordReset(String email) {
    return localDataSource.sendPasswordReset(email);
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}

