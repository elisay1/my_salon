import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';

class SuccessFullDataPagePage extends StatefulWidget {
  const SuccessFullDataPagePage({super.key});

  @override
  State<SuccessFullDataPagePage> createState() => _SuccessFullDataPagePageState();
}

class _SuccessFullDataPagePageState extends State<SuccessFullDataPagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            const Text(
              '¡Felicitaciones!',
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ColorPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(
                  16.0), // Ajusta el padding según tus necesidades
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.ColorText,
                  ),
                  children: [
                    TextSpan(
                      text: 'Afiliaremos el número de celular ',
                    ),
                    TextSpan(
                      text: '921 674 886',
                      style: TextStyle(
                        color: AppColors.ColorPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: ' a tu cuenta.',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: AppColors.ColorPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: AppColors.Colorblanco,
                size: 80,
              ),
            ),
            const SizedBox(height: 100),
            CustomButton(
              text: "Continuar",
              onPressed: () {
                Navigator.pushNamed(context, Routes.validateIdentify);
              },
             fixedSize: const Size(300, 50),
            ),
          ],
        ),
      ),
    );
  }
}