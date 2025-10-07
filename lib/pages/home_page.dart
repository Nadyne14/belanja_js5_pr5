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
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Column(
                children: [
                  Hero(
                    tag: item.name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        item.image,
                        height: 100,          // 👈 kecilin ukuran gambar di sini
                        width: 100,
                        fit: BoxFit.contain,  // biar gambar nggak kepotong
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('Rp ${item.price}'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
