import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/checkbox.dart';

class PoliticallyExposedPersonPage extends StatefulWidget {
  const PoliticallyExposedPersonPage({super.key});

  @override
  State<PoliticallyExposedPersonPage> createState() =>
      _PoliticallyExposedPersonPageState();
}

class _PoliticallyExposedPersonPageState
    extends State<PoliticallyExposedPersonPage> {
  bool isYes = false;
  bool isNot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Colorblanco,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.ColorgrisClaro,
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
                const SizedBox(height: 20),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Text(
                      '¿Eres una persona políticamente expuesta PEP?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ColorPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Información de datos
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EFF4),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  //Todo esto tiene que ir de esta color(0xFFE8EFF4) en un recuadro al rededordel iccono y texto
                  Icon(Icons.info_outline,
                      size: 40, color: AppColors.ColorPrimary),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Son consideradas Personas políticamente Expuestas las personas naturales que desempeñen o hayan desempeñado en los últimos 5 años una función pública destacada o prominente.',
                      style: TextStyle(color: AppColors.ColorPrimary),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 70),
            // Checkbox de sí y no
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(30.0)),
                Expanded(
                  child: CustomCheckbox(
                    value: isYes,
                    onChanged: (value) {
                      setState(() {
                        isYes = value ?? false;
                        if (isYes) isNot = false; // Solo se marca uno
                      });
                    },
                    label: "SI",
                    size: 30.0, // Aumenta el tamaño del checkbox
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                        color: AppColors
                            .ColorPrimary), // Aumenta el tamaño del texto
                  ),
                ),
                Expanded(
                  child: CustomCheckbox(
                    value: isNot,
                    onChanged: (value) {
                      setState(() {
                        isNot = value ?? false;
                        if (isNot) isYes = false; // Solo se marca uno
                      });
                    },
                    label: "NO",
                    size: 30.0, // Aumenta el tamaño del checkbox
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                        color: AppColors
                            .ColorPrimary), // Aumenta el tamaño del texto
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            CustomButton(
              text: "Continuar",
              fixedSize: const Size(300, 50),
              onPressed: () {
                // Mostrar el modal desde la parte inferior
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height *
                          0.5, // Mitad de la pantalla
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Línea indicadora para cerrar
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color:
                                  AppColors.ColorPrimary, // Color de la línea
                              borderRadius: BorderRadius.circular(2),
                            ),
                            margin: const EdgeInsets.only(
                                bottom: 16), // Margen debajo de la línea
                          ),
                          const Icon(
                            Icons.info_outline,
                            size: 80,
                            color: AppColors.ColorPrimary,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Atención',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'La información proporcionada tiene carácter de declaración jurada para Solbank.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: AppColors.ColorText,
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomButton(
                            text: "OK",
                            fixedSize: const Size(350, 50),
                            onPressed: () {
                              // Primero cerrar el modal
                              Navigator.of(context).pop();

                              // Luego, navegar a la nueva página
                              Navigator.pushNamed(
                                  context, Routes.validateIdentify);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
