import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Colorblanco, // Fondo blanco
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),

            // Encabezado con el botón de regreso
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.ColorgrisClaro, // Fondo gris claro
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.ColorPrimary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Regístrate',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Descripción amigable
            const Text(
              'Crea una cuenta para agendar tus citas y recibir servicios personalizados de belleza.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.ColorText,
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
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce un correo válido.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo de texto para la contraseña
            CustomInput(
              hint: "Escribe tu contraseña",
              prefixIcon: const Icon(Icons.lock_outline,
                  color: AppColors.ColorPrimary),
              isPassword: true,
              obscurePassword: _obscurePassword,
              onTogglePasswordVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una contraseña.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo de texto para repetir la contraseña
            CustomInput(
              hint: "Confirma tu contraseña",
              prefixIcon: const Icon(Icons.lock_outline,
                  color: AppColors.ColorPrimary),
              isPassword: true,
              obscurePassword: _obscurePassword,
              onTogglePasswordVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, confirma tu contraseña.';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),

            // Botón de registrarse
            CustomButton(
              text: "Crear cuenta",
              onPressed: () {
                Navigator.pushNamed(context, Routes.emailVerification);
              },
            ),
            const SizedBox(height: 20),

            // Botón de iniciar con Google
            OutlinedButton.icon(
              onPressed: () {
                // Acción para registrarse con Google
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

            // Texto de "Ya tienes cuenta, Iniciar sesión"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¿Ya tienes una cuenta? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Inicia sesión",
                    style: TextStyle(
                      color: AppColors.ColorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
