import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: ListView(
        children: [
          Hero(
            tag: item.name,
            child: Image.asset(item.image, width: double.infinity, height: 300, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Harga: Rp ${item.price}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Stok: ${item.stock}'),
                SizedBox(height: 8),
                Text('Rating: ${item.rating}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
