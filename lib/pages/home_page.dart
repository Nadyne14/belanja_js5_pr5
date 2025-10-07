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
      appBar: AppBar(title: Text('Daftar Buah')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Row(
                children: [
                  Hero(
                    tag: item.name,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                      child: Image.asset(
                        item.image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Rp ${item.price}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
