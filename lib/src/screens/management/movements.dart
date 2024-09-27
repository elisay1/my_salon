import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/CustomBottomNavigationBar.dart';

class Movements extends StatefulWidget {
  const Movements({super.key});

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  // Lista de filtros seleccionables
  int selectedIndex = 0; // Default: "Todo" seleccionado
  String selectedFilter = "todo"; // Default: Filtro inicial

  int _currentIndex = 1;

  final List<String> _routes = [
    Routes.home,
    Routes.movements,
    Routes.operations,
    Routes.myAcount,
  ];

  // Datos de los movimientos
  List<Map<String, dynamic>> movements = [
      {
      "title": "Inversión",
      "amount": "S/. 1,000.00",
      "status": "EN PROCESO",
      "type": "inversiones",
      "code": "6G23M33AKM",
      "date": "23/09/2024",
      "bgColor": AppColors.statusWarningBackground,
      "textColor": AppColors.statusWarningText,
    },
    {
      "title": "Retiro",
      "amount": "S/. 1,130.00",
      "status": "APROBADO",
      "type": "retiros",
      "code": "6G45Z33AKM",
      "date": "15/06/2024 ",
      "bgColor": AppColors.statusSuccessBackground,
      "textColor": AppColors.statusSuccessText,
    },
    {
      "title": "Inversión",
      "amount": "S/. 1,000.00",
      "status": "APROBADO",
      "type": "inversiones",
      "code": "6H40Z23ALM",
      "date": "10/06/2023",
      "bgColor": AppColors.statusDangerBackground,
      "textColor": AppColors.statusDangerText,
    },
      {
      "title": "Inversión",
      "amount": "S/. 1,000.00",
      "status": "EN PROCESO",
      "type": "inversiones",
      "code": "6G23M33AKM",
      "date": "23/09/2024",
      "bgColor": AppColors.statusWarningBackground,
      "textColor": AppColors.statusWarningText,
    },
    {
      "title": "Retiro",
      "amount": "S/. 1,130.00",
      "status": "APROBADO",
      "type": "retiros",
      "code": "6G45Z33AKM",
      "date": "15/06/2024 ",
      "bgColor": AppColors.statusSuccessBackground,
      "textColor": AppColors.statusSuccessText,
    },
    {
      "title": "Inversión",
      "amount": "S/. 1,000.00",
      "status": "APROBADO",
      "type": "inversiones",
      "code": "6H40Z23ALM",
      "date": "10/06/2023",
      "bgColor": AppColors.statusDangerBackground,
      "textColor": AppColors.statusDangerText,
    },
      {
      "title": "Inversión",
      "amount": "S/. 1,000.00",
      "status": "EN PROCESO",
      "type": "inversiones",
      "code": "6G23M33AKM",
      "date": "23/09/2024",
      "bgColor": AppColors.statusWarningBackground,
      "textColor": AppColors.statusWarningText,
    },
    {
      "title": "Retiro",
      "amount": "S/. 1,130.00",
      "status": "APROBADO",
      "type": "retiros",
      "code": "6G45Z33AKM",
      "date": "15/06/2024 ",
      "bgColor": AppColors.statusSuccessBackground,
      "textColor": AppColors.statusSuccessText,
    },
    {
      "title": "Inversión",
      "amount": "S/. 1,000.00",
      "status": "APROBADO",
      "type": "inversiones",
      "code": "6H40Z23ALM",
      "date": "10/06/2023",
      "bgColor": AppColors.statusDangerBackground,
      "textColor": AppColors.statusDangerText,
    },
  ];

  // Filtrar la lista de movimientos según el filtro seleccionado
  List<Map<String, dynamic>> _getFilteredMovements() {
    if (selectedFilter == "todo") {
      return movements; // Muestra todos los movimientos
    } else {
      return movements.where((movement) => movement['type'] == selectedFilter).toList();
    }
  }

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
            height: 215,
            decoration: const BoxDecoration(
              color: AppColors.ColorPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
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
                ],
              ),
            ),
          ),
          // Menú de Filtros
          Positioned(
            top: 170,
            left: 30,
            right: 30,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: 300,
                height: 60,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuButton("Todo", 0, "todo"),
                    _buildMenuButton("Inversiones", 1, "inversiones"),
                    _buildMenuButton("Retiros", 2, "retiros"),
                  ],
                ),
              ),
            ),
          ),
          // Texto "Movimientos" y Lista de Movimientos
          Positioned(
            top: 240,
            left: 20,
            right: 20,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto "Movimientos"
                // Lista de Movimientos filtrada
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: _getFilteredMovements().map((movement) {
                      return _buildMovementCard(
                        movement['title'],
                        movement['amount'],
                        movement['status'],
                        movement['code'],
                        movement['date'],
                        movement['bgColor'],
                        movement['textColor'],
                      );
                    }).toList(),
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

  // Método para construir las tarjetas de movimientos
   Widget _buildMovementCard(
      String? title,
    String? amount,
    String? status,
    String? code,
    String? date,
    Color? statusBackgroundColor,
    Color? statusTextColor) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: AppColors.primaryShadow.color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título y Código
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 title ?? "Sin título",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.ColorPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Código: ${code ?? 'N/A'}", 
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

             Text(
            amount ?? "S/. 0.00", // Valor por defecto
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
            // Monto y Estado
            // Fecha y Estado en la misma línea
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Fecha
              Text(
                date ?? "Fecha no disponible", // Valor por defecto
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              // Estado
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBackgroundColor ?? Colors.grey, // Color por defecto
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status ?? "Desconocido", // Valor por defecto
                  style: TextStyle(
                    color: statusTextColor ?? AppColors.Colorblanco, // Color por defecto
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }

  // Método para crear los botones del menú
  Widget _buildMenuButton(String title, int index, String filter) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index; // Actualiza el índice seleccionado
          selectedFilter = filter; // Actualiza el filtro seleccionado
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedIndex == index ? AppColors.ColorPrimary : AppColors.Colorblanco,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? AppColors.Colorblanco : AppColors.ColorPrimary,
          ),
        ),
      ),
    );
  }
}
