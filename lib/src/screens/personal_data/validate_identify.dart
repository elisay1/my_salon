import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/screens/management/home_screen.dart';
import 'package:solbank_app/src/screens/personal_data/validate_identity/personal_data.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/CustomFormField.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/checkbox.dart';
import 'package:solbank_app/src/widgets/input.dart';

class ValidateIdentifyPage extends StatefulWidget {
  const ValidateIdentifyPage({super.key});

  @override
  State<ValidateIdentifyPage> createState() => _ValidateIdentifyPageState();
}

class _ValidateIdentifyPageState extends State<ValidateIdentifyPage> {
  final bool _obscurePassword = true;
  final bool _obscureConfirmPassword = true;
  bool _isChecked = false;

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

            // Encabezado
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: 40, // Adjust size as needed
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          AppColors.ColorgrisClaro, // Change background color
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_outlined,
                          color: AppColors
                              .ColorPrimary), // White icon on blue background
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Tu seguridad es primero',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ColorPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Descripción
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
                      text:
                          'Antes de invertir en SolBank deberás de validar tu identidad y completar esta información',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // RECTANGULO CON BORDE
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //       // Navegar a otra pantalla
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) =>  const HomePage()),

            //       );
            //     },
            //     child: Container(
            //       width: 350, // Ancho del rectángulo
            //       height: 100, // Altura del rectángulo
            //       padding: const EdgeInsets.all(16.0),
            //       decoration: BoxDecoration(
            //         color: Colors.transparent, // Sin color de fondo
            //         border: Border.all(
            //           color: AppColors.ColorBorder, // Color del borde
            //           width: 2.0, // Grosor del borde
            //         ),
            //         borderRadius:
            //             BorderRadius.circular(16.0), // Esquinas redondeadas
            //       ),
            //       child: Row(
            //         crossAxisAlignment:
            //             CrossAxisAlignment.center, // Alineación vertical
            //         children: [
            //           const Icon(
            //             Icons.badge,
            //             color: AppColors.ColorIcon, // Color del icono
            //             size: 50,
            //           ),
            //           const SizedBox(
            //               width: 20), // Espacio entre el ícono y el texto
            //           Expanded(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Text(
            //                   'Validar identidad',
            //                   style: TextStyle(
            //                     color: AppColors.ColorTerminos,
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                     height: 8), // Espacio entre el texto y el botón
            //                 Container(
            //                   width: 130.0, // Ancho específico en píxeles
            //                   padding: const EdgeInsets.symmetric(
            //                     horizontal: 8.0,
            //                     vertical: 4.0, // Espaciado alrededor del texto
            //                   ),
            //                   decoration: BoxDecoration(
            //                     color:
            //                         AppColors.ColorBorder, // Fondo del estado
            //                     borderRadius: BorderRadius.circular(
            //                         8.0), // Borde redondeado
            //                   ),
            //                   child: const Center(
            //                     child: Text(
            //                       'PENDIENTE',
            //                       style: TextStyle(
            //                         color: AppColors
            //                             .ColorTerminos, // Color del texto
            //                         fontSize: 16.0, // Tamaño del texto
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: InkWell(
                onTap: () {
                  // Navegar a otra pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalData()),
                  );
                },
                borderRadius: BorderRadius.circular(
                    16.0), // Bordes redondeados del splash
                splashColor: AppColors.ColorgrisClaro.withOpacity(
                    0.2), // Color del splash
                child: Container(
                  width: 350, // Ancho del rectángulo
                  height: 100, // Altura del rectángulo
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Sin color de fondo
                    border: Border.all(
                      color: AppColors.ColorBorder, // Color del borde
                      width: 2.0, // Grosor del borde
                    ),
                    borderRadius:
                        BorderRadius.circular(16.0), // Esquinas redondeadas
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Alineación vertical
                    children: [
                      const Icon(
                        Icons.badge,
                        color: AppColors.ColorIcon, // Color del icono
                        size: 50,
                      ),
                      const SizedBox(
                          width: 20), // Espacio entre el ícono y el texto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Validar identidad',
                              style: TextStyle(
                                color: AppColors.ColorTerminos,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                                height: 8), // Espacio entre el texto y el botón
                            Container(
                              width: 130.0, // Ancho específico en píxeles
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0, // Espaciado alrededor del texto
                              ),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.ColorBorder, // Fondo del estado
                                borderRadius: BorderRadius.circular(
                                    8.0), // Borde redondeado
                              ),
                              child: const Center(
                                child: Text(
                                  'PENDIENTE',
                                  style: TextStyle(
                                    color: AppColors
                                        .ColorTerminos, // Color del texto
                                    fontSize: 16.0, // Tamaño del texto
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // RECTANGULO CON BORDE
            Center(
              child: InkWell(
                onTap: () {
                  // Navegar a otra pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalData()),
                  );
                },
                borderRadius: BorderRadius.circular(
                    16.0), // Bordes redondeados del splash
                splashColor: AppColors.ColorgrisClaro.withOpacity(
                    0.2), // Color del splash
                child: Container(
                  width: 350, // Ancho del rectángulo
                  height: 100, // Altura del rectángulo
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Sin color de fondo
                    border: Border.all(
                      color: AppColors.ColorBorder, // Color del borde
                      width: 2.0, // Grosor del borde
                    ),
                    borderRadius:
                        BorderRadius.circular(16.0), // Esquinas redondeadas
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Alineación vertical
                    children: [
                      const Icon(
                        Icons.badge,
                        color: AppColors.ColorIcon, // Color del icono
                        size: 50,
                      ),
                      const SizedBox(
                          width: 20), // Espacio entre el ícono y el texto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Validar identidad',
                              style: TextStyle(
                                color: AppColors.ColorTerminos,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                                height: 8), // Espacio entre el texto y el botón
                            Container(
                              width: 130.0, // Ancho específico en píxeles
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0, // Espaciado alrededor del texto
                              ),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.ColorBorder, // Fondo del estado
                                borderRadius: BorderRadius.circular(
                                    8.0), // Borde redondeado
                              ),
                              child: const Center(
                                child: Text(
                                  'PENDIENTE',
                                  style: TextStyle(
                                    color: AppColors
                                        .ColorTerminos, // Color del texto
                                    fontSize: 16.0, // Tamaño del texto
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // RECTANGULO CON BORDE
            Center(
              child: InkWell(
                onTap: () {
                  // Navegar a otra pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalData()),
                  );
                },
                borderRadius: BorderRadius.circular(
                    16.0), // Bordes redondeados del splash
                splashColor: AppColors.ColorgrisClaro.withOpacity(
                    0.2), // Color del splash
                child: Container(
                  width: 350, // Ancho del rectángulo
                  height: 100, // Altura del rectángulo
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Sin color de fondo
                    border: Border.all(
                      color: AppColors.ColorBorder, // Color del borde
                      width: 2.0, // Grosor del borde
                    ),
                    borderRadius:
                        BorderRadius.circular(16.0), // Esquinas redondeadas
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Alineación vertical
                    children: [
                      const Icon(
                        Icons.badge,
                        color: AppColors.ColorIcon, // Color del icono
                        size: 50,
                      ),
                      const SizedBox(
                          width: 20), // Espacio entre el ícono y el texto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Informción adicional',
                              style: TextStyle(
                                color: AppColors.ColorTerminos,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                                height: 8), // Espacio entre el texto y el botón
                            Container(
                              width: 130.0, // Ancho específico en píxeles
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0, // Espaciado alrededor del texto
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent, // Fondo celeste
                                borderRadius: BorderRadius.circular(
                                    8.0), // Borde redondeado
                              ),
                              child: const Center(
                                child: Text(
                                  'COMPLETADO',
                                  style: TextStyle(
                                    color: AppColors.Colorblanco, // Color del texto
                                    fontSize: 16.0, // Tamaño del texto
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Center(
            //   child: Container(
            //     width: 350,
            //     height: 100,
            //     padding: const EdgeInsets.all(16.0),
            //     decoration: BoxDecoration(
            //       color: Colors.transparent, // Sin color de fondo
            //       border: Border.all(
            //         color: AppColors.ColorBorder, // Color del borde
            //         width: 2.0, // Grosor del borde
            //       ),
            //       borderRadius:
            //           BorderRadius.circular(16.0), // Esquinas redondeadas
            //     ),
            //     child: Row(
            //       crossAxisAlignment:
            //           CrossAxisAlignment.center, // Alineación vertical
            //       children: [
            //         const Icon(
            //           Icons.edit_document,
            //           color: AppColors.ColorIcon, // Color del icono
            //           size: 50,
            //         ),
            //         const SizedBox(
            //             width: 20), // Espacio entre el ícono y el texto
            //         Expanded(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             //mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               const Text(
            //                 'Informción adicional',
            //                 style: TextStyle(
            //                   color: AppColors.ColorTerminos,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               const SizedBox(
            //                   height: 8), // Espacio entre el texto y el botón
            //               Container(
            //                 width: 130.0, // Ancho específico en píxeles
            //                 padding: const EdgeInsets.symmetric(
            //                   horizontal: 8.0,
            //                   vertical: 4.0, // Espaciado alrededor del texto
            //                 ),
            //                 decoration: BoxDecoration(
            //                   color: Colors.blueAccent, // Fondo celeste
            //                   borderRadius: BorderRadius.circular(
            //                       8.0), // Borde redondeado
            //                 ),
            //                 child: const Center(
            //                   // Centra el contenido
            //                   child: Text(
            //                     'COMPLETADO',
            //                     style: TextStyle(
            //                       color: AppColors.Colorblanco, // Color del texto
            //                       fontSize: 16.0, // Tamaño del texto
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            const SizedBox(height: 10),

            // Botón de recordar usuario
            // Row(
            //   children: [
            //     Checkbox(
            //       value: _isChecked, // Indicamos si está seleccionado o no
            //       onChanged: (bool? value) {
            //         setState(() {
            //           _isChecked = value ?? false;
            //         });
            //       }, // Manejar el cambio de estado
            //     ),
            //     const Text('Acepto el contrato de administración'),
            //   ],
            // ),

            Row(
              children: [
                CustomCheckbox(
                  label: 'Acepto el contrato de administración',
                  value: _isChecked, // Indicamos si está seleccionado o no
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                         });
                        }, // Manejar el cambio de estado
                 ),
                  // Aquí puedes manejar la lógica del estado del checkbox si es necesario
                
              ],
            ),
            const SizedBox(height: 60),

            CustomButton(
              text: "Continuar",
              onPressed: () {
                Navigator.pushNamed(context, Routes.additionalInformation);
              },
              fixedSize: const Size(300, 50),
            ),
          ],
        ),
      ),
    );
  }
}
