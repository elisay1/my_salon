import 'package:flutter/material.dart';
import 'package:solbank_app/src/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Iniciar una animación
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Iniciar animación y redirigir después de 2.5 segundos
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, '/inicio');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.Colorblanco, // Fondo de pantalla blanco
      body: Stack(
        children: [
          // Centrar el logo y el eslogan
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Imagen del logo
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/solbank_logo.png'), // Ruta del logo
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Eslogan o mensaje de bienvenida
                  const Text(
                    'Belleza a tu alcance',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorBlack, // Color primario (rosado vibrante)
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Indicador de carga en la parte inferior
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.ColorPrimary, // Indicador en color primario
                backgroundColor: AppColors.ColorgrisClaro, // Fondo del indicador de progreso
              ),
            ),
          ),
        ],
      ),
    );
  }
}
