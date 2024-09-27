import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String label;
  final double size; // Tamaño del checkbox
  final TextStyle? textStyle; // Estilo del texto

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
     this.size = 24.0, // Valor por defecto del tamaño del checkbox
    this.textStyle, // Estilo opcional del texto
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale( // Escala para cambiar el tamaño del checkbox
          scale: widget.size / 23.0, // El tamaño se basa en el valor por defecto 24.0
          child: Checkbox(
            shape: const CircleBorder(),
            side: const BorderSide(color: AppColors.ColorBorder, width: 2),
            value: widget.value,
            onChanged: widget.onChanged,
            activeColor: AppColors.ColorPrimary,
            checkColor: AppColors.Colorblanco,
          ),
        ),
        const SizedBox(width: 1), // Espacio entre checkbox y texto
        Text(
          widget.label,
          style: widget.textStyle ??
              const TextStyle(
                color: AppColors.ColorText,
                fontSize: 14, // Tamaño de texto por defecto
              ),
        ),
      ],
    );
  }
}
