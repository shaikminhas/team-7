import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategory(context, title: 'Proteins', products: [
                Product('Muscle Whey', 'assets/protein1.jpg', 1799),
                Product('Atom', 'assets/protein2.jpg', 1632),
                Product('Impact', 'assets/protein3.jpg', 2599),
                Product('Whey Max', 'assets/protein4.jpg', 2099),
                Product('Alpha Whey', 'assets/protein5.jpg', 1333),
              ]),
              buildCategory(context, title: 'Fit Foods', products: [
                Product('Oats', 'assets/fitfood1.jpg', 276),
                Product('Muesli', 'assets/fitfood2.jpg', 679),
                Product('Peanut Butter', 'assets/fitfood3.jpg', 659),
                Product('Max Protein', 'assets/fitfood4.jpg', 171),
                Product('Rolled Oats', 'assets/fitfood5.jpg', 439),
              ]),
              buildCategory(context, title: 'Accessories', products: [
                Product('Bags', 'assets/A1.jpg', 1500),
                Product('Shaker', 'assets/A2.jpg', 289),
                Product('Waist Band', 'assets/A3.jpg', 250),
                Product('Bottle', 'assets/A4.jpg', 795),
                Product('Outfit', 'assets/A5.jpg', 1300),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(BuildContext context, {required String title, required List<Product> products}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 190, // Increased height for better visibility
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(), // Smooth scrolling effect
            itemCount: products.length,
            itemBuilder: (context, index) => buildProductCard(context, products[index]),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 4, // Add shadow for better UI
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 140, // Adjusted width for proper spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    product.imageUrl,
                    height: 120,
                    width: 140,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported, size: 100),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product(this.name, this.imageUrl, this.price);
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              product.imageUrl,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 200),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '₹${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add to cart logic
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Buy now logic
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Buy Now', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
