import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/button.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, String>> _slides = [
    {
      "image": "assets/images/slide-1.png",  // Imagen relacionada a un salón de belleza
      "title": "Bienvenido a nuestro salón",
      "description": "Ofrecemos servicios de belleza y estilo, ¡agende su cita fácilmente!"
    },
    {
      "image": "assets/images/slide-2.png",  // Imagen con servicios de maquillaje
      "title": "Transforma tu look",
      "description": "Contamos con estilistas expertos en moda y belleza."
    },
    {
      "image": "assets/images/slide-3.png",  // Imagen de un estilista trabajando
      "title": "La mejor atención para ti",
      "description": "Agenda una cita hoy mismo y disfruta de un servicio de calidad."
    },
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _slides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Colorblanco,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 70),
            SizedBox(
              height: 400, // Establecemos una altura fija para el carrusel
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _slides[index]["image"]!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Text(
                              _slides[index]["title"]!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.ColorPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _slides[index]["description"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.ColorText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Indicadores para las páginas del carrusel
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage == index ? 20.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: _currentPage == index
                          ? BorderRadius.circular(100.0)
                          : BorderRadius.circular(4.0),
                      color: _currentPage == index
                          ? AppColors.ColorPrimary
                          : AppColors.ColorgrisClaro,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Botones para crear cuenta o iniciar sesión
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                children: [
                  CustomButton(
                    text: "Crear Cuenta",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.signUp);
                    },
                    fixedSize: const Size(300, 50),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.signIn);
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      side: const BorderSide(color: AppColors.ColorPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                          color: AppColors.ColorPrimary, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
