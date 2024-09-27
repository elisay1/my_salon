import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/input.dart';
import 'package:solbank_app/src/widgets/checkbox.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberUser = false;
  bool _obscurePassword = true;
  final bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Colorblanco, // Fondo blanco
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100), // Espacio superior

            // Logo en la parte superior
            Center(
              child: Image.asset(
                'assets/images/solbank_logo.png', // Tu logo local
                height: 150,
              ),
            ),
            const SizedBox(height: 40),

            // Campo de texto para el correo
            CustomInput(
              hint: "Escribe tu correo",
              prefixIcon: const Icon(Icons.email_outlined,
                  color: AppColors.ColorPrimary),
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                // Aquí va la lógica de validación del correo
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce un correo valido.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo de texto para la contraseña
            CustomInput(
              hint: "Escribe tu Contraseña",
              prefixIcon:
                  const Icon(Icons.lock_outline, color: AppColors.ColorPrimary),
              isPassword: true,
              obscurePassword: _obscurePassword,
              onTogglePasswordVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              validator: (value) {
                // Aquí va la lógica de validación de la contraseña
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una contraseña';
                }
                return null;
              },
            ),
            const SizedBox(height: 1),

            // Botón de recordar usuario
            Row(
              children: [
                CustomCheckbox(
                  value: _rememberUser,
                  onChanged: (value) {
                    setState(() {
                      _rememberUser = value ?? false;
                    });
                  },
                  label: 'Recordar usuario',
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Botón de iniciar sesión
            CustomButton(
              text: "Iniciar sesión",
              onPressed: () {
                Navigator.pushNamed(context, Routes.home);
              },
            ),

            const SizedBox(height: 1),

            // Texto de "Olvidé mi contraseña"
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.splash);
              },
              child: const Text(
                "Olvidé mi contraseña",
                style: TextStyle(color: AppColors.ColorPrimary),
              ),
            ),
            const SizedBox(height: 15),

            // Botón de iniciar con Google
            OutlinedButton.icon(
              onPressed: () {
                // Acción para iniciar sesión con Google
              },
              icon: Image.asset(
                'assets/images/google_logo.png', // Icono de Google
                height: 24.0,
              ),
              label: const Text("Iniciar con Google"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                side: const BorderSide(color: AppColors.ColorPrimary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Texto de "Si no tienes cuenta, crea tu cuenta"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Si no tienes cuenta, "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                  child: const Text(
                    "Crea tu cuenta",
                    style: TextStyle(
                      color: AppColors.ColorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40), // Espacio inferior
          ],
        ),
      ),
    );
  }
}
