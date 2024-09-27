import 'package:flutter/material.dart';

class CustomInputWithButton extends StatelessWidget {
  final String hint;
  final Icon prefixIcon;
  final String text; // Texto en el centro
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  const CustomInputWithButton({
    super.key,
    required this.hint,
    required this.prefixIcon,
    required this.text,
    required this.textInputType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // Espaciado interno
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Borde del rectángulo
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alineación a la izquierda
        children: [
          Row(
            children: [
              prefixIcon,
              const SizedBox(width: 8), // Espacio entre el ícono y el texto
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16), // Estilo del texto
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // Espacio entre el texto y el botón
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
            ),
            keyboardType: textInputType,
            validator: validator,
          ),
          const SizedBox(height: 8), // Espacio entre el campo y el botón
          ElevatedButton(
            onPressed: () {
              // Lógica del botón "Completado"
            },
            child: const Text("Completado"),
          ),
        ],
      ),
    );
  }
}
