import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Map<String, String> product;
  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product['image']!, height: 200),
            SizedBox(height: 20),
            Text(product['name']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('\$29.99', style: TextStyle(fontSize: 20, color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Add to Cart')),
          ],
        ),
      ),
    );
  }
}
