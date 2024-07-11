import 'package:flutter/material.dart';

class InformacionMedPage extends StatelessWidget {
  const InformacionMedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Doctor.jpg'), // Asegúrate de tener esta imagen en tu carpeta assets
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Garcia Rodriguez Juan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.yellow)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Áreas de Especialización',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Dentista, Urólogo'),
            const SizedBox(height: 20),
            const Text(
              'Experiencia: 5 años',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Edad: 29 años',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Horario:',
              style: TextStyle(fontSize: 16),
            ),
            const Text('Lunes a Viernes: 9:00 AM - 6:00 PM'),
            const Text('Sábados: 9:00 AM - 2:00 PM'),
            const SizedBox(height: 20),
            const Text(
              'Educación:',
              style: TextStyle(fontSize: 16),
            ),
            const Text('Universidad Nacional Autónoma de México (UNAM)'),
            const SizedBox(height: 10),
            const Text(
              'Ubicación:',
              style: TextStyle(fontSize: 16),
            ),
            const Text('Clínica de Especialidades Médicas, Ciudad de México'),
            const SizedBox(height: 20),
            const Text(
              'Descripción:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'El Dr. Juan Garcia Rodriguez es un especialista en gastroenterología con más de 5 años de experiencia en el diagnóstico y tratamiento de enfermedades del sistema digestivo. Se dedica a brindar una atención personalizada y de alta calidad a sus pacientes, utilizando las técnicas más avanzadas y basadas en evidencia.',
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para reservar cita
                },
                child: const Text('Reserva cita'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}