import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/DropdownButtonFormField.dart';
import 'package:solbank_app/src/widgets/button.dart';

class ResidenceOcupationPage extends StatefulWidget {
  const ResidenceOcupationPage({super.key});

  @override
  State<ResidenceOcupationPage> createState() => _ResidenceOcupationPageState();
}

class _ResidenceOcupationPageState extends State<ResidenceOcupationPage> {
  String? selectedIncomeSource;
  String? selectedEconomicActivity;
  String? selectedCountry;
  String? selectedRegion;

  // Método para generar los DropdownMenuItem
  List<DropdownMenuItem<String>> _buildDropdownMenuItems(List<String> items) {
    return items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList();
  }

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
                    'Datos de ocupación',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "¿Aque te dedicas?",
              style: TextStyle(
                  color: AppColors.ColorPrimary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
            // Select Elegir fuente de ingresos / ocupación
            const Text(
              "Fuente de ingresos / ocupación",
              style: TextStyle(
                  color: AppColors.ColorText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Fuente de ingresos / ocupación",
              hint: "Elegir una opción",
              value: selectedIncomeSource,
              items: _buildDropdownMenuItems(
                  ['Empleado', 'Independiente', 'Estudiante']),
              onChanged: (value) {
                setState(() {
                  selectedIncomeSource = value;
                });
              },
            ),

            // Select Elegir actividad Económica
            const SizedBox(height: 20),
            const Text(
              "Actividad Económica",
              style: TextStyle(
                  color: AppColors.ColorText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Actividad Económica",
              hint: "Elegir una opción",
              value: selectedEconomicActivity,
              items: _buildDropdownMenuItems(
                  ['Comercio', 'Industria', 'Servicios']),
              onChanged: (value) {
                setState(() {
                  selectedEconomicActivity = value;
                });
              },
            ),

            // Select Elegir país
            const SizedBox(height: 20),
            const Text(
              "País",
              style: TextStyle(
                  color: AppColors.ColorText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "País",
              hint: "Elegir una opción",
              value: selectedCountry,
              items: _buildDropdownMenuItems(['Perú']),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),

            // Select Elegir región
            const SizedBox(height: 20),
            const Text(
              "Región",
              style: TextStyle(
                  color: AppColors.ColorText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Región",
              hint: "Elegir una opción",
              value: selectedRegion,
              items: _buildDropdownMenuItems(
                  ['La Libertad', 'Arequipa', 'Amazonas']),
              onChanged: (value) {
                setState(() {
                  selectedRegion = value;
                });
              },
            ),

            const SizedBox(height: 100),
            CustomButton(
              text: "Continuar",
              onPressed: () {
                // Verifica que todos los campos sean válidos antes de continuar
                if (selectedIncomeSource != null &&
                    selectedEconomicActivity != null &&
                    selectedCountry != null &&
                    selectedRegion != null) {
                  // Navega a la siguiente pantalla o ejecuta alguna acción
                  Navigator.pushNamed(
                      context,
                      Routes
                          .activityData); // Cambia 'nextPage' por la ruta correcta
                } else {
                  // Muestra un mensaje de error si algún campo no está seleccionado
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, completa todos los campos.'),
                    ),
                  );
                }
              },
              fixedSize: const Size(300, 50),
            ),
          ],
        ),
      ),
    );
  }
}
