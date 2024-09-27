import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Colorblanco, // Fondo blanco
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),

            // Encabezado con botón para regresar
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
                      icon: const Icon(Icons.arrow_back_ios_new_outlined,
                          color: AppColors.ColorPrimary),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Verificación de correo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Descripción explicando el envío del código
            RichText(
              text: const TextSpan(
                text: 'Te enviamos un código de verificación al correo ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.ColorText,
                ),
                children: [
                  TextSpan(
                    text: 'elisay@devcode.com',  // Reemplaza por el correo del usuario
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.ColorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 130),

            // Texto "Código de verificación"
            const Text(
              'Código de verificación',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.ColorText,
              ),
            ),
            const SizedBox(height: 30),

            // Campos para ingresar los 6 dígitos del código
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: AppColors.ColorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      counterText: '',
                      filled: true,
                      fillColor: AppColors.Colorblanco,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: AppColors.ColorBorder, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: AppColors.ColorPrimary, width: 2),
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 70),

            // Botón para validar el código
            CustomButton(
              text: "Validar código",
              onPressed: () {
                // Lógica de validación del código
                Navigator.pushNamed(context, Routes.successFullValidation);
              },
            ),

            const SizedBox(height: 60),

            // Texto "¿No te llegó el código?" con enlace "Reenviar"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿No te llegó el código?',
                  style: TextStyle(
                    color: AppColors.ColorText,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Lógica para reenviar el código
                  },
                  child: const Text(
                    'Reenviar',
                    style: TextStyle(
                      color: AppColors.ColorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
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
