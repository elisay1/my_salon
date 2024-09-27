import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/DropdownButtonFormField.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/input.dart';

class ResidenceDataPage extends StatefulWidget {
  const ResidenceDataPage({super.key});

  @override
  State<ResidenceDataPage> createState() => _ResidenceDataPageState();
}

class _ResidenceDataPageState extends State<ResidenceDataPage> {
  String? selectedCountry;
  String? selectedDepartment;
  String? selectedProvince;
  String? selectedDistrict;

  final List<String> countries = ["Perú"];
  
  // Define los departamentos, provincias y distritos en estructuras de datos
  final Map<String, List<String>> departments = {
    "Lima": ["Lima", "Callao"],
    // Agrega más departamentos y provincias según sea necesario
  };

  final Map<String, List<String>> provinces = {
    "Lima": ["Lima", "Callao"],
    // Agrega más provincias según sea necesario
  };

  final Map<String, List<String>> districts = {
    "Lima": ["Miraflores", "San Isidro", "Lima"],
    // Agrega más distritos según sea necesario
  };

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
                    'Datos de residencia',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ColorPrimary,
                    ),
                  ),
                ),
              ],
            ),

            // Select País (solo Perú)
            const SizedBox(height: 70),
            const Text(
              "País",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "País",
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
                  selectedDepartment = null; // Reiniciar selección de departamento
                  selectedProvince = null; // Reiniciar selección de provincia
                  selectedDistrict = null; // Reiniciar selección de distrito
                });
              },
            ),

            // Select Departamento
            const SizedBox(height: 20),
            const Text(
              "Departamento",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Departamento",
              hint: "Elegir una opción",
              value: selectedDepartment,
              items: departments.keys.map((String department) {
                return DropdownMenuItem<String>(
                  value: department,
                  child: Text(department),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDepartment = newValue;
                  selectedProvince = null; // Reiniciar selección de provincia
                  selectedDistrict = null; // Reiniciar selección de distrito
                });
              },
            ),

            // Select Provincia
            const SizedBox(height: 20),
            const Text(
              "Provincia",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Provincia",
              hint: "Elegir una opción",
              value: selectedProvince,
              items: selectedDepartment != null
                  ? provinces[selectedDepartment]!.map((String province) {
                      return DropdownMenuItem<String>(
                        value: province,
                        child: Text(province),
                      );
                    }).toList()
                  : [],
              onChanged: (newValue) {
                setState(() {
                  selectedProvince = newValue;
                  selectedDistrict = null; // Reiniciar selección de distrito
                });
              },
            ),

            // Select Distrito
            const SizedBox(height: 20),
            const Text(
              "Distrito",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            CustomDropdown(
              label: "Distrito",
              hint: "Elegir una opción",
              value: selectedDistrict,
              items: selectedProvince != null
                  ? districts[selectedProvince]!.map((String district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList()
                  : [],
              onChanged: (newValue) {
                setState(() {
                  selectedDistrict = newValue;
                });
              },
            ),

            // Input para escribir la dirección
            const SizedBox(height: 20),
            CustomInput(
              hint: "Escribir tu dirección",
              validator: (value) {},
            ),        

            const SizedBox(height: 100),
            CustomButton(
              text: "Continuar",
              onPressed: () {
                // Verifica que todos los campos sean válidos antes de continuar
                if (selectedCountry != null &&
                    selectedDepartment != null &&
                    selectedProvince != null &&
                    selectedDistrict != null) {
                  Navigator.pushNamed(context, Routes.residenceOcupation);
                } else {
                  // Muestra un mensaje de error si falta algún dato
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Completa todos los campos')),
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