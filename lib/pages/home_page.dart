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
        childAspectRatio: 3 / 4,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.name,
                      child: Image.asset(item.image, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rp ${item.price}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
