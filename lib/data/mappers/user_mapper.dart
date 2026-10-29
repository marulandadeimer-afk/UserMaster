import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

/// Mapeador entre UserModel (Data) y UserEntity (Domain).
class UserMapper {
  UserMapper._();

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
}

