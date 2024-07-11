import 'package:flutter/material.dart';
import 'chat_page.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'CHATS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ChatListItem(
                  name: 'Garcia Rodriguez Juan',
                  message: 'Hola Buenas tardes',
                  time: '11:23 pm',
                  imagePath: 'assets/images/Doctor.jpg',
                ),
                ChatListItem(
                  name: 'Alvarez González Graciela',
                  message: 'Por supuesto',
                  time: '10:11 pm',
                  imagePath: 'assets/images/Doctor2.jpg',
                ),
                ChatListItem(
                  name: 'González Granados Susana',
                  message: 'De inmediato',
                  time: '9:15 pm',
                  imagePath: 'assets/images/Doctor3.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Handle new chat action
        },
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imagePath;

  const ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(name: name),
          ),
        );
      }
    );
  }
}