import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/item_card.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Apel', price: 5000, image: 'images/apel.png', stock: 10, rating: 4.3),
    Item(name: 'Jeruk', price: 7000, image: 'images/jeruk.png', stock: 8, rating: 4.0),
    Item(name: 'Pisang', price: 4000, image: 'images/pisang.png', stock: 15, rating: 4.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA8E6CF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF388E3C),
        elevation: 3,
        title: const Text(
          'Daftar Buah Segar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ...items.map(
            (item) => ItemCard(
              item: item,
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
            ),
          ),
          const Footer(), // ✅ Tambahkan footer di bawah daftar buah
        ],
      ),
    );
  }
}
