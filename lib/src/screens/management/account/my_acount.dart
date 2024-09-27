import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/CustomBottomNavigationBar.dart';

class MyAcount extends StatefulWidget {
  const MyAcount({super.key});

  @override
  State<MyAcount> createState() => _MyAcountState();
}

class _MyAcountState extends State<MyAcount> {
  int _currentIndex = 3;

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
      body: ListView(
        children: <Widget>[
          Container(
            height: 500, // Altura del Stack
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  // Contenedor principal con fondo azul
                  Container(
                    width: double.infinity,
                    height: 305,
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
                          SizedBox(height: 50),
                          Text(
                            'ELISAY CASTAÑEDA',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppColors.Colorblanco,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Inversión a plazo fijo / Inversión en start-up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: AppColors.Colorblanco,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Codigo: 0000999 ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: AppColors.Colorblanco,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    left: 40,
                    right: 40,
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 2),
                        width: 300,
                        height: 265,
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
                            // First Bank Account Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.account_balance,
                                      color: AppColors.ColorPrimary, size: 35),
                                  SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BCP Eli Sayes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '34577607048083',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: AppColors.ColorPrimary),
                                    onPressed: () {
                                      // Handle edit action
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            // Second Bank Account Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.account_balance,
                                      color: AppColors.ColorPrimary, size: 35),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Banco de la nación Lr.',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '34577607048083',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: AppColors.ColorPrimary),
                                    onPressed: () {
                                      // Handle edit action
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            // Add Bank Account Button
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle add bank account action
                                },
                                icon: const Icon(Icons.add,
                                    color: AppColors.Colorblanco),
                                label: const Text(
                                  '+ Agregar cuenta bancaria',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.Colorblanco),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.ColorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 480, // Adjust the top position as per your UI layout
                    left: 40,
                    right: 40,
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 2),
                        width: 300,
                        height: 600, // Adjust height as necessary
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
                            // Phone Row
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.phone,
                                      color: AppColors.ColorPrimary, size: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    '+51986414705',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                            Divider(),
                            // Email Row
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.email,
                                      color: AppColors.ColorPrimary, size: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    'laurencio@ondastec.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                            Divider(),
                            // FAQ Row
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.help_outline,
                                      color: AppColors.ColorPrimary, size: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    'Preguntas frecuentes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                            Divider(),
                            // Contract and Regulations Row
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.description,
                                      color: AppColors.ColorPrimary, size: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    'Contrato y reglamento',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                            Divider(),
                            // Change Password Link
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: TextButton(
                                onPressed: () {
                                  // Handle change password action
                                },
                                child: const Text(
                                  'Cambiar contraseña',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.ColorPrimary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            // Logout Button
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle logout action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white, // Button background color
                                  side: BorderSide(
                                      color: AppColors.ColorPrimary,
                                      width: 2), // Border color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Cerrar sesión',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.ColorPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],

              ),
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

