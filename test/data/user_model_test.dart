import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/data/models/user_model.dart';
import 'package:flutter_application_1/data/mappers/user_mapper.dart';

void main() {
  group('UserModel & UserMapper Tests', () {
    test('Serialización y deserialización JSON de UserModel', () {
      final json = {
        'id': 'usr_99',
        'name': 'Juan Pérez',
        'email': 'juan@ejemplo.com',
      };

      final model = UserModel.fromJson(json);

      expect(model.id, 'usr_99');
      expect(model.name, 'Juan Pérez');
      expect(model.email, 'juan@ejemplo.com');

      final serialized = model.toJson();
      expect(serialized['email'], 'juan@ejemplo.com');
    });

    test('Mapeo de UserModel a UserEntity', () {
      const model = UserModel(
        id: 'usr_1',
        name: 'Maria',
        email: 'maria@test.com',
      );

      final entity = UserMapper.toEntity(model);

      expect(entity.id, model.id);
      expect(entity.name, model.name);
      expect(entity.email, model.email);
    });
  });
}

