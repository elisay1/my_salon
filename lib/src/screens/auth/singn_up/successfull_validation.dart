import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';

class SuccessFullValidationPage extends StatefulWidget {
  const SuccessFullValidationPage({super.key});

  @override
  State<SuccessFullValidationPage> createState() => _SuccessFullValidationPageState();
}

class _SuccessFullValidationPageState extends State<SuccessFullValidationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(height: 150),
            const Text(
              'Tu correo ha sido validado con éxito',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                color: AppColors.ColorPrimary
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Todo listo para crear tu cuenta en SPC',
              style: TextStyle(
                fontSize: 16.0,
                color: AppColors.ColorText,
              ),
              textAlign: TextAlign.center,
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
                Navigator.pushNamed(context, Routes.personalData);
              },
              fixedSize: const Size(300, 50),
            ),
          ],
        ),
      ),
    );
  }
}




// class SuccessfulValidationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Successful Validation'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Your email has been successfully validated',
//               style: TextStyle(
//                 fontSize: 32.0,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Everything ready to create your account in SolBank',
//               style: TextStyle(
//                 fontSize: 18.0,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 40.0),
//             CustomButton(
//               text: 'Continue',
//               onPressed: () {
//                 Navigator.pushNamed(context, Routes.emailVerification);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }