import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';
import 'package:solbank_app/src/widgets/input.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  // Variables para manejar la fecha de nacimiento y otros datos
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  String? selectedGender;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Manejo de la imagen de perfil (opcionalmente, puedes manejar carga de imágenes)
  ImageProvider<Object> _profileImage =
      AssetImage('assets/images/default_avatar.png');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('es', 'ES'), // Fecha en español
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd/MM/yyyy', 'es_ES').format(picked);
      });
    }
  }
  Widget circleBullet() {
    return Container(
      margin:
          EdgeInsets.only(right: 8.0), // Espacio entre el círculo y el texto
      width: 8.0, // Tamaño del círculo
      height: 8.0, // Tamaño del círculo
      decoration: const BoxDecoration(
        color: AppColors.ColorPrimary, // Color del círculo
        shape: BoxShape.circle, // Forma del círculo
      ),
    );
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
            const SizedBox(height: 40),

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
                    'Crea tu perfil',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Foto de perfil
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage, // Imagen de perfil
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.ColorPrimary,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          // Lógica para cambiar la imagen de perfil
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Campo Nombre
            CustomInput(
              hint: "Nombre completo",
              controller: _nameController,
              prefixIcon:
                  const Icon(Icons.person, color: AppColors.ColorPrimary),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu nombre completo.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo Fecha de Nacimiento
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: CustomInput(
                  controller: dateController,
                  secondarySuffixIcon: const Icon(Icons.calendar_today_outlined,
                      color: AppColors.ColorPrimary),
                  hint: "Fecha de nacimiento",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecciona tu fecha de nacimiento.';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Campo Correo
            CustomInput(
              hint: "Correo electrónico",
              controller: _emailController,
              prefixIcon:
                  const Icon(Icons.email, color: AppColors.ColorPrimary),
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce un correo válido.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Campo Teléfono
            CustomInput(
              hint: "Número de teléfono",
              controller: _phoneController,
              prefixIcon:
                  const Icon(Icons.phone, color: AppColors.ColorPrimary),
              textInputType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu número de teléfono.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Dropdown para Género
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.ColorgrisClaro, width: 1.5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Sombra ligera
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                ),
                icon: Icon(Icons.arrow_drop_down, color: AppColors.colorBlack),
                dropdownColor: AppColors
                    .Colorblanco, // Color de fondo de la lista desplegable
                hint: const Text(
                  'Selecciona tu género',
                  style: TextStyle(fontSize: 16, color: AppColors.colorBlack),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Male',
                    child: Text('Masculino', style: TextStyle(fontSize: 16)),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Femenino', style: TextStyle(fontSize: 16)),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Otro', style: TextStyle(fontSize: 16)),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 40),

            // Botón Continuar
            CustomButton(
              text: "Continuar",
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    dateController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    selectedGender == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor completa todos los campos.'),
                    ),
                  );
                } else {
                  // Continúa con la lógica de registro
                  Navigator.pushNamed(context, Routes.home);
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
