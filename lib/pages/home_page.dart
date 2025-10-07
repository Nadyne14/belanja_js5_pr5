import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Apel', price: 5000, image: 'images/apel.png', stock: 10, rating: 4.3),
    Item(name: 'Jeruk', price: 7000, image: 'images/jeruk.png', stock: 8, rating: 4.0),
    Item(name: 'Pisang', price: 4000, image: 'images/pisang.png', stock: 15, rating: 4.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA), // 🌸 background lembut
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E7AB5), // 💜 ungu pastel
        elevation: 4,
        title: const Text(
          'Daftar Buah',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: Colors.white,
            elevation: 5,
            shadowColor: Colors.deepPurple.shade100,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.purple.shade100,
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Hero(
                      tag: item.name,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item.image,
                          height: 90,
                          width: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF4A3F69), // 💜 teks ungu gelap
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Rp ${item.price}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple.shade400,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded,
                        color: Color(0xFF8E7AB5), size: 28),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
