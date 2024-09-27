import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Paquete para la localización
import 'package:solbank_app/src/routes/app_routes.dart';
import 'package:solbank_app/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: appRoutes,

      // Soporte para la localización
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'), // Español
        Locale('en', 'US'), // Inglés (puedes agregar más si es necesario)
      ],

      // Opcional: Establecer español como idioma por defecto
      locale: const Locale('es', 'ES'),
    );
  }
}
