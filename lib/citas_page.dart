import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CitasPage extends StatelessWidget {
  const CitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mis citas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Citas Programadas para esta Semana',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            _buildCita('Miércoles', '05/06/24', '3:45pm', Colors.red),
            _buildCita('Viernes', '07/06/24', '5:30pm', Colors.orange),
            const SizedBox(height: 20),
            const Text(
              'Próximas Citas',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            _buildCita('Viernes', '13/06/24', '9:45am', Colors.green),
            _buildCita('Sábado', '15/06/24', '2:00pm', Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Calendario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildLegend(),
            const SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              calendarStyle: const CalendarStyle(
                markerDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) {
                // Define selected days here
                return false;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCita(String day, String date, String time, Color color) {
    return Row(
      children: [
        Text(
          '$day',
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Text(
          '$date',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 10),
        Text(
          '$time',
          style: TextStyle(fontSize: 16, color: color),
        ),
      ],
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _buildLegendItem(Colors.red, 'Citas Programadas'),
        const SizedBox(width: 20),
        _buildLegendItem(Colors.blue, 'Citas Próximas'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}