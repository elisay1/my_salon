import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/DropdownButtonFormField.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/checkbox.dart';

class AdditionalInformationPage extends StatefulWidget {
  const AdditionalInformationPage({super.key});

  @override
  State<AdditionalInformationPage> createState() =>
      _AdditionalInformationPageState();
}

class _AdditionalInformationPageState extends State<AdditionalInformationPage> {
  String? selectedCountry;
  String? selectedMaritalStatus;
  bool isFemale = false;
  bool isMale = false;

  // Lista de países (puedes cambiarla o cargarla desde una fuente)
  final List<String> countries = [
    'México',
    'Argentina',
    'Colombia',
    'Chile',
    'Perú'
  ];

  // Lista de estados civiles
  final List<String> maritalStatusOptions = ['Soltero', 'Casado', 'Divorciado'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Colorblanco,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),

            // Encabezado
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.ColorgrisClaro,
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
                    'Queremos saber un poco más de ti',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            // Select País de nacimiento usando CustomDropdown
            const SizedBox(height: 70),
            const Text(
              "País de nacimiento",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "País de nacimiento",
              hint: "Elegir una opción",
              value: selectedCountry,
              items: countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCountry = newValue;
                });
              },
            ),

            // Select Estado civil usando CustomDropdown
            const SizedBox(height: 20),
            const Text(
              "Estado civil",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Estado civil",
              hint: "Elegir una opción",
              value: selectedMaritalStatus,
              items: maritalStatusOptions.map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedMaritalStatus = newValue;
                });
              },
            ),

            // Checkbox de género
            const SizedBox(height: 20),
            const Text(
              "Género",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomCheckbox(
                    value: isFemale,
                    onChanged: (value) {
                      setState(() {
                        isFemale = value ?? false;
                        if (isFemale) isMale = false; // Solo se marca uno
                      });
                    },
                    label: "Femenino",
                    size: 30.0, // Aumenta el tamaño del checkbox
                    textStyle: const TextStyle(
                        fontSize: 18.0,
                        color: AppColors
                            .ColorPrimary), // Aumenta el tamaño del texto
                  ),
                ),
                Expanded(
                  child: CustomCheckbox(
                    value: isMale,
                    onChanged: (value) {
                      setState(() {
                        isMale = value ?? false;
                        if (isMale) isFemale = false; // Solo se marca uno
                      });
                    },
                    label: "Masculino",
                    size: 30.0, // Aumenta el tamaño del checkbox
                    textStyle: const TextStyle(
                        fontSize: 18.0,
                        color: AppColors
                            .ColorPrimary), // Aumenta el tamaño del texto
                  ),
                ),
              ],
            ),

            const SizedBox(height: 150),
            CustomButton(
              text: "Continuar",
              onPressed: () {
                Navigator.pushNamed(context, Routes.residenceData);
              },
              fixedSize: const Size(300, 50),
            ),
          ],
        ),
      ),
    );
  }
}
