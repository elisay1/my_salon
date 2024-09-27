import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/app_routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
     return BottomNavigationBar(
      backgroundColor: AppColors.Colorblanco, // Background color of the navbar
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.orange, // Orange for selected item
      unselectedItemColor: Colors.grey, // Grey for unselected items
      type: BottomNavigationBarType.fixed, // Fixed style for navbar
      onTap: widget.onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore), // Using an explore icon
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long), // Using a receipt icon for My Booking
          label: 'Mis Reservas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline), // Using chat icon for Inbox
          label: 'Bandeja',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // Profile icon for Mi cuenta
          label: 'Perfil',
        ),
      ],
    );
  }
}
