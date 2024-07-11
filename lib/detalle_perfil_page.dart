import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tu perfil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/perfil.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Regina López Zamora',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ProfileSection(
              icon: Icons.person,
              title: 'Datos Personales',
              subtitle: 'Nombre completo\nGénero\nFecha de nacimiento',
            ),
            ProfileSection(
              icon: Icons.health_and_safety,
              title: 'Identificación y seguro médico',
              subtitle: 'INE (Credencial de elector)\nSeguro',
            ),
            ProfileSection(
              icon: Icons.location_on,
              title: 'Dirección',
              subtitle: 'Calle y número\nInformación adicional\nCódigo postal',
            ),
            ProfileSection(
              icon: Icons.medical_services,
              title: 'Historial médico',
              subtitle: 'Información sobre historial medico\ny estado de salud',
            ),
            ProfileSection(
              icon: Icons.medication,
              title: 'Medicación',
              subtitle: 'Medicación que tomas de forma ocasional o\ndiaria',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileSection({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[900]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Implementar navegación a detalles específicos
        },
      ),
    );
  }
}