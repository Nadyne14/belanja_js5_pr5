import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: const [
          Divider(thickness: 1),
          SizedBox(height: 10),
          Text(
            '© Nadyne Rosalia Noer Azizah',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          Text(
            'NIM: 2341760142',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
