import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/core/utils/validators.dart';

void main() {
  group('Validators Tests', () {
    test('Validación de correo electrónico', () {
      expect(Validators.validateEmail(''), isNotNull);
      expect(Validators.validateEmail('invalido'), isNotNull);
      expect(Validators.validateEmail('usuario@correo.com'), isNull);
    });

    test('Validación de contraseña', () {
      expect(Validators.validatePassword(''), isNotNull);
      expect(Validators.validatePassword('123'), isNotNull);
      expect(Validators.validatePassword('123456'), isNull);
    });

    test('Validación de nombre', () {
      expect(Validators.validateName(''), isNotNull);
      expect(Validators.validateName('Jo'), isNotNull);
      expect(Validators.validateName('John Doe'), isNull);
    });
  });
}

