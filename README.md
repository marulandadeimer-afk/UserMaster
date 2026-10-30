# UserMaster - App Base con Clean Architecture

[![Deploy Flutter Web to GitHub Pages](https://github.com/actions/workflows/deploy.yml/badge.svg)](https://github.com)

Aplicación móvil y web desarrollada en **Flutter** para el **Taller 2: Flutter “UserMaster - App Base con Clean Architecture”**. Implementa los principios fundamentales de la arquitectura limpia (Clean Architecture) con enfoque en la capa de presentación, navegación centralizada, componentes reutilizables y un flujo automatizado de CI/CD para despliegue en GitHub Pages.

---

## 📋 1. Descripción del Proyecto

**UserMaster** es una aplicación base orientada a la gestión y navegación de usuarios. En esta etapa inicial, no requiere conexión a un backend real; la autenticación, validación y consulta de información están simuladas empleando estados locales reactivos y retardos asíncronos con `Future.delayed`.

La aplicación cuenta con un flujo completo de autenticación (Splash Screen, Inicio de Sesión, Registro y Recuperación de Contraseña) y una interfaz principal (Dashboard con navegación inferior y Perfil de Usuario).

---

## 🎯 2. Objetivos del Proyecto

- **Desarrollar la interfaz gráfica (UI)** siguiendo lineamientos modernos de Material Design 3 y buenas prácticas de experiencia de usuario.
- **Implementar Clean Architecture**, separando responsabilidades entre las capas de presentación (`presentation`), lógica central (`core`), dominio (`domain`) y datos (`data`).
- **Construir componentes reutilizables** (`CustomButton`, `CustomTextField`) para evitar duplicación de código.
- **Centralizar el sistema de rutas** mediante un catálogo de rutas nombradas (`app_routes.dart`).
- **Simular operaciones asíncronas** de autenticación y carga con temporizadores e indicadores visuales de progreso.
- **Configurar CI/CD** con GitHub Actions para el despliegue automático en GitHub Pages tras cada entrega en la rama principal.

---

## 💻 3. Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (v3.x / SDK Dart ^3.x)
- **Lenguaje:** [Dart](https://dart.dev/)
- **Diseño UI:** Material 3 (Material Design) & Cupertino Icons
- **Gestión de Estado y Rutas:** Navegación por rutas nombradas con estados locales (`StatefulWidget`, `Future.delayed`, `Timer`)
- **Control de Versiones:** Git & GitHub
- **CI/CD & Hosting:** GitHub Actions & GitHub Pages / Vercel

---

## 🏛️ 4. Estructura del Proyecto (Clean Architecture)

El proyecto sigue rigurosamente la estructura modular de Clean Architecture:

```text
flutter_application_1/
├── .github/
│   └── workflows/
│       └── deploy.yml            # Pipeline de CI/CD para GitHub Pages
├── lib/
│   ├── core/                     # Lógica transversal y recursos compartidos
│   │   ├── constants/            # Constantes globales y paleta (app_colors.dart)
│   │   ├── errors/               # Manejo de fallos (failures.dart)
│   │   ├── network/              # Verificación de conectividad de red
│   │   ├── themes/               # Configuración de temas visuales (app_theme.dart)
│   │   ├── utils/                # Utilidades y validadores (validators.dart)
│   │   └── widgets/              # Widgets transversales reutilizables
│   │
│   ├── data/                     # Capa de datos (fuentes locales y remotas)
│   │   ├── datasources/          # Fuentes de datos simuladas (user_local_datasource.dart)
│   │   ├── models/               # Modelos DTO y serialización (user_model.dart)
│   │   ├── repositories/         # Implementación de repositorios (user_repository_impl.dart)
│   │   └── mappers/              # Mapeadores de modelo a entidad (user_mapper.dart)
│   │
│   ├── domain/                   # Capa de dominio (reglas de negocio puras)
│   │   ├── entities/             # Entidades del dominio (user_entity.dart)
│   │   ├── repositories/         # Contratos e interfaces (user_repository.dart)
│   │   ├── usecases/             # Casos de uso (login_usecase.dart)
│   │   └── exceptions/           # Excepciones de negocio (app_exception.dart)
│   │
│   ├── presentation/             # Capa de presentación (UI y estado local)
│   │   ├── blocs/                # Gestión de estado (placeholders)
│   │   ├── pages/                # Pantallas de la aplicación:
│   │   │   ├── splash_page.dart          # Splash Screen (3 segundos)
│   │   │   ├── login_page.dart           # Login con simulación de 2s
│   │   │   ├── register_page.dart        # Registro con validación de contraseña
│   │   │   ├── forgot_password_page.dart # Recuperación de contraseña
│   │   │   ├── dashboard_page.dart       # Dashboard con BottomNav y Cards
│   │   │   └── profile_page.dart         # Perfil y cierre de sesión
│   │   ├── widgets/              # Componentes UI reutilizables (CustomButton, CustomTextField)
│   │   ├── routes/               # Rutas centralizadas (app_routes.dart)
│   │   └── themes/               # Temas específicos de UI
│   │
│   ├── app.dart                  # Configuración de MaterialApp y temas
│   └── main.dart                 # Punto de entrada de la aplicación
│
├── test/                         # Pruebas automatizadas organizadas por capa
│   ├── data/                     # Pruebas de modelos y serialización
│   ├── domain/                   # Pruebas de entidades de dominio
│   ├── presentation/             # Pruebas de widgets y flujo de navegación
│   ├── utils/                    # Pruebas de validadores
│   └── widget_test.dart          # Suite principal de pruebas
│
├── assets/                       # Recursos estáticos e imágenes
├── pubspec.yaml                  # Configuración de dependencias
└── README.md                     # Documentación técnica
```

---

## 📱 5. Pantallas y Flujos Funcionales

1. **Splash Screen (`splash_page.dart`):**
   - Muestra el icono central y la marca UserMaster con el color principal de fondo.
   - Cuenta con una duración exacta de 3 segundos antes de redirigir automáticamente a la pantalla de Login.

2. **Inicio de Sesión (`login_page.dart`):**
   - Inputs para correo electrónico y contraseña con validaciones de formato.
   - Botón *"Ingresar"* que simula una carga de 2 segundos mediante un indicador circular (`CircularProgressIndicator`) y redirige al Dashboard.
   - Enlaces directos hacia *"Registrarse"* y *"¿Olvidaste tu contraseña?"*.

3. **Registro de Usuario (`register_page.dart`):**
   - Formulario para Nombre completo, Correo electrónico, Contraseña y Confirmar contraseña.
   - Botón *"Crear cuenta"* que valida que ambas contraseñas coincidan antes de simular el registro y retornar al Login.

4. **Recuperar Contraseña (`forgot_password_page.dart`):**
   - Campo para el correo electrónico del usuario.
   - Botón *"Enviar enlace de recuperación"* que notifica al usuario mediante un `SnackBar`.

5. **Dashboard Sencillo (`dashboard_page.dart`):**
   - Barra de navegación inferior (`BottomNavigationBar`) con opciones de **Inicio** y **Perfil**.
   - **Pestaña Inicio:** Mensaje de bienvenida (*"Hola, Usuario"*) y un `ListView` con más de 5 tarjetas (`Card`) con notificaciones y tareas recientes.

6. **Perfil de Usuario (`profile_page.dart`):**
   - Muestra avatar genérico, nombre y correo del usuario.
   - Botón rojo de *"Cerrar sesión"* con cuadro de confirmación que destruye el historial (`pushNamedAndRemoveUntil`) y devuelve al Login.

---

## 🚀 6. Despliegue Continuo (CI/CD)

El archivo `.github/workflows/deploy.yml` compila la versión web de Flutter automáticamente en cada `git push` a la rama `main` y la publica en **GitHub Pages**.

Para habilitarlo en tu repositorio de GitHub:
1. Ve a **Settings > Pages** en tu repositorio de GitHub.
2. En **Build and deployment > Source**, selecciona **GitHub Actions**.
3. Al realizar el push del último commit, el workflow compilará y desplegará la app de forma automática.

---

## 👤 7. Autor

- **Nombre:** Deimer Marulanda
- **Correo:** marulandadeimer@gmail.com
- **Materia:** Programación Móvil - Taller 2
- **Institución:** Facultad de Ingeniería
