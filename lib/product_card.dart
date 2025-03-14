import 'package:flutter/material.dart';
import 'product_screen.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
      child: Card(
        child: Column(
          children: [
            Image.asset(product['image']!, height: 80),
            Text(product['name']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
