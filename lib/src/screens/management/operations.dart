import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/CustomBottomNavigationBar.dart';

class Operations extends StatefulWidget {
  const Operations({super.key});

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  int _currentIndex = 2;

  final List<String> _routes = [
    Routes.home,
    Routes.movements,
    Routes.operations,
    Routes.myAcount,
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2EBFF),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Contenedor principal con fondo azul
          Container(
            width: double.infinity,
            height: 270,
            decoration: const BoxDecoration(
              color: AppColors.ColorPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 60),
                  Text(
                    'SOLBANK',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Colorblanco,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Tus Inversiones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.Colorblanco,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 40,
            right: 40,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.Colorblanco,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.account_balance_wallet,
                                color: AppColors.ColorPrimary, size: 35),
                            SizedBox(height: 10),
                            Text(
                              'S/. 1,000.00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.ColorPrimary,
                              ),
                            ),
                            Text(
                              'Invertido',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 3,
                          height: 90,
                          color: AppColors.ColorPrimary,
                        ),
                        const Column(
                          children: [
                            Icon(Icons.bar_chart,
                                color: AppColors.ColorPrimary, size: 35),
                            SizedBox(height: 6),
                            Text(
                              'S/. 130.00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.ColorPrimary,
                              ),
                            ),
                            Text(
                              'Rendimiento',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),

          //LUEGO UN TEXTO Movimientos
          Positioned(
            top: 340,
            left: 20,
            right: 20,
            bottom: 0, // Añadimos esto para que ajuste el scroll hasta el final
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildMovementCard(
                        "Fondo mutuo independiente agresivo soles FMIAS",
                        "S/. 1,000.00",
                        "S/. 130.00", // Yield amount
                        "Inversión", // Label for investment
                        "Rendimiento", // Label for yield
                        AppColors
                            .statusWarningBackground, // Yield background color
                        AppColors.statusWarningText, // Yield text color
                        Icon(Icons.directions_car), // Example icon for vehicle
                      ),
                      _buildMovementCard(
                        "Fondo mutuo independiente agresivo soles FMIAS",
                        "S/. 1,000.00",
                        "S/. 130.00", // Yield amount
                        "Inversión", // Label for investment
                        "Rendimiento", // Label for yield
                        AppColors
                            .statusSuccessBackground, // Yield background color
                        AppColors.statusSuccessText, // Yield text color
                        Icon(Icons
                            .motorcycle), // Example icon for another vehicle
                      ),
                      _buildMovementCard(
                        "Fondo mutuo independiente agresivo soles FMIAS",
                        "S/. 1,000.00",
                        "S/. 130.00", // Yield amount
                        "Inversión", // Label for investment
                        "Rendimiento", // Label for yield
                        AppColors
                            .statusDangerBackground, // Yield background color
                        AppColors.statusDangerText, // Yield text color
                        Icon(Icons
                            .directions_bus), // Example icon for another vehicle
                      ),
                      _buildMovementCard(
                        "Fondo mutuo independiente agresivo soles FMIAS",
                        "S/. 1,000.00",
                        "S/. 130.00", // Yield amount
                        "Inversión", // Label for investment
                        "Rendimiento", // Label for yield
                        AppColors
                            .statusWarningBackground, // Yield background color
                        AppColors.statusWarningText, // Yield text color
                        Icon(Icons.directions_car), // Example icon for vehicle
                      ),
                      _buildMovementCard(
                        "Fondo mutuo independiente agresivo soles FMIAS",
                        "S/. 1,000.00",
                        "S/. 130.00", // Yield amount
                        "Inversión", // Label for investment
                        "Rendimiento", // Label for yield
                        AppColors
                            .statusSuccessBackground, // Yield background color
                        AppColors.statusSuccessText, // Yield text color
                        Icon(Icons
                            .motorcycle), // Example icon for another vehicle
                      ),
                      _buildMovementCard(
                        "Fondo mutuo independiente agresivo soles FMIAS",
                        "S/. 1,000.00",
                        "S/. 130.00", // Yield amount
                        "Inversión", // Label for investment
                        "Rendimiento", // Label for yield
                        AppColors
                            .statusDangerBackground, // Yield background color
                        AppColors.statusDangerText, // Yield text color
                        Icon(Icons
                            .directions_bus), // Example icon for another vehicle
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Añadimos el bottomNavigationBar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}

// Método para construir las tarjetas de movimientos
Widget _buildMovementCard(
  String title,
  String investmentAmount,
  String yieldAmount,
  String labelInvestment,
  String labelYield,
  Color yieldBackgroundColor,
  Color yieldTextColor,
  Widget icon, // Icon parameter for the vehicle image
) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    shadowColor: Colors.grey.withOpacity(0.5),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Icon or image of the vehicle on the left
          icon,
          const SizedBox(width: 8),

          // Information section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.ColorTerminos,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),

                // Row with investment and yield
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Investment Amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          investmentAmount,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          labelInvestment,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.ColorPrimary,
                          ),
                        ),
                      ],
                    ),

                    // Yield Amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          yieldAmount,
                          style: TextStyle(
                            color: yieldTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          labelYield,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.ColorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
