import 'package:flutter/material.dart';
import 'package:solbank_app/src/utils/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String? hint;
  final InputDecoration? decoration;
  final Color? dropdownColor;
  final double? iconSize;
  final Widget? icon;
  final bool readOnly;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    this.value,
    required this.onChanged,
    this.onSaved,
    this.validator,
    this.hint,
    this.decoration,
    this.dropdownColor,
    this.iconSize,
    this.icon,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        decoration: decoration ??
            InputDecoration(
              filled: true,
              fillColor: readOnly ? Colors.grey[300] : AppColors.Colorblanco,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: AppColors.ColorBorder, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: AppColors.ColorPrimary, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: AppColors.ColorBorder, width: 2),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: AppColors.ColorBorder, width: 2),
              ),
            ),
        items: items,
        value: value,
        onChanged: readOnly ? null : onChanged,
        onSaved: onSaved,
        validator: validator,
        dropdownColor: dropdownColor,
        iconSize: iconSize ?? 24.0,
        icon: icon ??
            const Icon(Icons
                .arrow_drop_down), // Icono por defecto si no se proporciona
        isExpanded:
            false, // Asegura que el dropdown ocupe todo el ancho disponible
      ),
    );
  }
}
