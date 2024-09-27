import 'package:flutter/material.dart';
import 'package:solbank_app/src/routes/routes.dart';
import 'package:solbank_app/src/utils/app_colors.dart';
import 'package:solbank_app/src/widgets/CustomBottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.ColorPrimary,
            child: Text(
              "C", // Placeholder for logo
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: const Text(
          'SPC',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notification tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              // Handle bookmark tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Hola, ELISAY 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Add spacing
            const SizedBox(height: 20),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune),
                    onPressed: () {
                      // Handle filter button
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Special offer card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 150, // Set the height of the card
                child: Card(
                  color: Colors.orange[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Align content vertically
                          children: [
                            const Text(
                              "30% DE DESCUENTO",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const Text(
                            //   "DE DESCUENTO",
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            const SizedBox(height: 5),
                            Container(
                              width: 180, // Set the desired width for the text
                              child: const Text(
                                "¡Obtén un descuento en cada servicio pedido! Solo válido por hoy.",
                                style: TextStyle(color: Colors.white),
                                softWrap: true, // Ensure that the text wraps within the container
                                overflow: TextOverflow.visible, // Handle overflow
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "30%",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Category buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryButton(Icons.cut, 'Cortes'),
                      _buildCategoryButton(Icons.brush, 'Maquillaje'),
                      _buildCategoryButton(Icons.spa, 'Manicura'),
                      _buildCategoryButton(Icons.message_outlined, 'Mensaje'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Nearby locations
                  const Text(
                    "Cerca de tu ubicación",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Add multiple nearby salon cards (wrapped inside a scrollable view)
                  for (int i = 0; i < 10; i++) _buildNearbySalonCard(
                    imageUrl: 'https://via.placeholder.com/150', 
                    salonName: 'Chillia Pataz La Libertad',
                    address: '0993 chilia',
                    distance: '1.2 km',
                    rating: '4.8',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }

  // Helper to create category buttons
  Widget _buildCategoryButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.ColorPrimary,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Helper to create nearby salon card
  Widget _buildNearbySalonCard(
      {required String imageUrl,
      required String salonName,
      required String address,
      required String distance,
      required String rating}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 30,
        ),
        title: Text(salonName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(distance, style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 10),
                const Icon(Icons.star, size: 16, color: Colors.orange),
                const SizedBox(width: 5),
                Text(rating,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }

  // Método que construye un Card para las opciones "Quiero invertir" y "Aprender de inversiones"
  Widget _buildOptionCard({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2, // Sombra del Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 160, // Ajusta el tamaño de cada tarjeta
          height: 109,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: AppColors.ColorPrimary),
              //const SizedBox(height: 12),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Método para construir las tarjetas de movimientos
Widget _buildMovementCard(String title, String amount, String status,
    Color statusBackgroundColor, Color statusTextColor) {
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
          //Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.ColorPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),

          //const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Amount
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusTextColor,
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

Widget _buildSeeMoreCard() {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    shadowColor: AppColors.primaryShadow.color,
    child: InkWell(
      onTap: () {
        // Acción que quieras al pulsar "Ver más"
        print("Ver más clickeado");
      },
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            "Ver más",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.ColorPrimary,
            ),
          ),
        ),
      ),
    ),
  );
}
