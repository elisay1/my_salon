import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
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
  final List<String> countries = ['México', 'Argentina', 'Colombia', 'Chile', 'Perú'];

  // Lista de estados civiles
  final List<String> maritalStatusOptions = ['Soltero', 'Casado', 'Divorciado'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(1.0),
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
                      'Queremos saber un poco más de ti',
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

            // Select País de nacimiento
            const SizedBox(height: 40),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "País de nacimiento",
                border: OutlineInputBorder(),
              ),
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

            // Select Estado civil
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Estado civil",
                border: OutlineInputBorder(),
              ),
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
                  ),
                ),
              ],
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
