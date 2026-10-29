/// Representación de fallos en la capa Core.
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Error en el servidor']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Error en almacenamiento local']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Credenciales inválidas']);
}

