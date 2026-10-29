import 'package:flutter/material.dart';
import 'app.dart';

/// Punto de entrada de la aplicación UserMaster.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const UserMasterApp());
}

/// Alias para mantener retrocompatibilidad con tests anteriores si aplica.
typedef MyTwoApp = UserMasterApp;
