import 'package:flutter/material.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    this.title,
    this.hint,
    this.controller,
    required this.validator,
    this.node,
    this.obscurePassword = false,
    this.width,
    this.textInputType,
    this.maxLines,
    this.callback,
    this.prefixIcon,
    this.isPassword = false,
    this.onTogglePasswordVisibility,
    this.readOnly = false,
    this.secondarySuffixIcon,
    //this.textStyle,
  });

  final double? width;
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final bool readOnly;
  final Function validator;
  final FocusNode? node;
  final bool obscurePassword;
  final TextInputType? textInputType;
  final int? maxLines;
  final Function? callback;
  final Widget? prefixIcon;
  final bool isPassword;
  final VoidCallback? onTogglePasswordVisibility;
  final Widget? secondarySuffixIcon;
  //final TextStyle? textStyle;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool mPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    mPasswordVisible = widget.obscurePassword;
  }

  void _toggle() {
    setState(() {
      mPasswordVisible = !mPasswordVisible;
    });
    if (widget.onTogglePasswordVisibility != null) {
      widget.onTogglePasswordVisibility!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        focusNode: widget.node,
        onChanged: (String text) {
          if (widget.callback != null) {
            widget.callback!();
          }
        },
        validator: (value) => widget.validator(value) as String?,
        controller: widget.controller,
        keyboardType:
            widget.maxLines == null ? widget.textInputType : TextInputType.text,
        textInputAction: widget.maxLines == null
            ? TextInputAction.next
            : TextInputAction.done,
        obscureText: widget.isPassword ? mPasswordVisible : false,
        style: const TextStyle(
          color: AppColors.ColorPrimary,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        cursorColor: AppColors.ColorYellow,
        autofocus: true,
        maxLines: widget.maxLines ?? 1,
        readOnly: widget.readOnly,
        // Aplicar formateadores de texto condicionalmente
        inputFormatters: widget.textInputType == TextInputType.number
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly, // Solo permite números
              ]
            : null, // No aplicamos ningún formateador si no es de tipo número

        decoration: InputDecoration(
          filled: true,
          //fillColor: AppColors.Colorblanco,
          fillColor: widget.readOnly ? Color(0xFFE8EFF4) : AppColors.Colorblanco,
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
          // labelText: widget.title,
          // labelStyle: TextStyle(
          //   color: Colors.black,
          //   fontSize: 16.0,
          //   fontWeight: FontWeight.normal,
          // ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12.0,
          ),
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: AppColors.ColorBorder, width: 2),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isPassword)
                IconButton(
                  icon: Icon(
                    mPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onPressed: _toggle,
                ),
              if (widget.secondarySuffixIcon != null)
                widget.secondarySuffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}
