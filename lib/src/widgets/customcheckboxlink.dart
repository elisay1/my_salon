import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../utils/app_colors.dart';

class CustomCheckboxLink extends StatelessWidget {
  final bool value;
  final Widget label;
  final ValueChanged<bool?> onChanged;

  const CustomCheckboxLink({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          // shape: const CircleBorder(),
          side: const BorderSide(color: AppColors.ColorBorder, width: 2),
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.ColorPrimary,
          checkColor: AppColors.Colorblanco,
        ),
        Expanded(
          child: label,
        ),
      ],
    );
  }
}
