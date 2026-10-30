import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/domain/entities/user_entity.dart';

void main() {
  group('UserEntity Tests', () {
    test('Crea una instancia válida de UserEntity', () {
      const user = UserEntity(
        id: '123',
        name: 'Usuario Prueba',
        email: 'test@usermaster.com',
      );

      expect(user.id, '123');
      expect(user.name, 'Usuario Prueba');
      expect(user.email, 'test@usermaster.com');
    });
  });
}

