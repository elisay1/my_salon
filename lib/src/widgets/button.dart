import 'package:flutter/material.dart';
import 'package:solbank_app/src/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Size? fixedSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        backgroundColor: AppColors.ColorPrimary, // Reemplaza con tu color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: fixedSize,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.Colorblanco,
          fontSize: 16,
        ),
      ),
    );
  }
}
