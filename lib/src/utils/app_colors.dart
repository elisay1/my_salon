import 'package:flutter/material.dart';

//creamos los colores personalizados
class AppColors {
  static const ColorPrimary = Color(0xFFFA0F5E);
  static const Colorblanco = Color(0xFFFFFFFF);
  static const colorBlack = Color.fromARGB(255, 0, 0, 0);
  //static const Colorgris = Color(0xFF7E848D);
  static const ColorText = Color(0xFF7E848D);
  static const ColorIcon = Color(0xFF919194);
  static const ColorgrisClaro = Color(0xFFECECEC);
  static const ColorBorder = Color(0xFFECECEC);
  static const ColorYellow = Color(0xFFF7BF30);
  static const ColorTerminos = Color(0xFF5A6375);

  //Creamos gradientes

  // Colores de estados con transparencia
  static const Color statusSuccessBackground = Color(0x806EF9BF); // 50% transparencia
  static const Color statusSuccessText = Color(0xFF1FAA47);

  static const Color statusWarningBackground = Color(0x80FFCE5B); // 50% transparencia
  static const Color statusWarningText = Color(0xFFF79F1A);

  static const Color statusDangerBackground = Color(0x80FF3F60); // 50% transparencia
  static const Color statusDangerText = Color(0xFFFF0000);

  // Sombras
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color(0x40002A82), // 25% transparencia
    offset: Offset(0, 0),
    blurRadius: 15,
    spreadRadius: 2,
  );
}
