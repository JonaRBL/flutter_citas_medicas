import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mensaje_page.dart';
import 'perfil_page.dart';
import 'citas_page.dart';
import 'detalle_medico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const MessengerScreen(),
    const CitasPage(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/Logo1.png', height: 70),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Encuentra especialista o clínica',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.blue[800],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  suffixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 56, 55, 55)),
                ),
                style: const TextStyle(color: Color.fromARGB(255, 105, 20, 20)),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messenger'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Citas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 3, 3, 3),
        unselectedItemColor: const Color.fromARGB(255, 3, 3, 3),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ESPECIALISTAS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                _buildSpecialistChip('Ginecólogo'),
                _buildSpecialistChip('Oftalmólogo'),
                _buildSpecialistChip('Urólogo'),
                _buildSpecialistChip('Dermatólogo'),
                _buildSpecialistChip('Dentista'),
                _buildSpecialistChip('Pediatra'),
                _buildSpecialistChip('Nutricionista'),
                _buildSpecialistChip('Psicólogo'),
                _buildSpecialistChip('Médico General'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('SELECCIONE SU UBICACIÓN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-34.603684, -58.381559), // Coordenadas iniciales (ejemplo: Buenos Aires)
                  zoom: 14,
                ),
                onMapCreated: (GoogleMapController controller) {},
              ),
            ),
            const SizedBox(height: 20),
            const Text('MEDICOS RECOMENDADOS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildDoctorCard(context, 'Garcia Rodríguez Juan', 'Dentista'),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialistChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildDoctorCard(BuildContext context, String name, String specialty) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/Doctor.jpg'),
          radius: 25,
        ),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InformacionMedPage()), // Asegúrate de importar e implementar DetalleMedico
            );
        },

          child: const Text('Ver más'),
        ),
      ),
    );
  }
}