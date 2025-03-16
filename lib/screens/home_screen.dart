import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'product_screen.dart';
import 'product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContentScreen(),
    ProductScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FIT CART')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContentScreen extends StatelessWidget {
  HomeContentScreen({super.key});

  final List<Map<String, String>> categories = [
    {'name': 'Supplements', 'image': 'assets/supplement.png'},
    {'name': 'Equipment', 'image': 'assets/equipment.png'},
    {'name': 'Clothing', 'image': 'assets/clothing.png'},
  ];

  final List<Map<String, String>> products = [
    {'name': 'Whey Protein', 'image': 'assets/whey.png', 'price': '\₹3000'},
    {'name': 'Dumbbells', 'image': 'assets/dumbbells.png', 'price': '\₹5500'},
    {'name': 'Gym Gloves', 'image': 'assets/gloves.png', 'price': '\₹1110'},
    {'name': 'Pre-Workout', 'image': 'assets/preworkout.png', 'price': '\₹225'},
    {'name': 'Gym T-Shirt', 'image': 'assets/tshirt.png', 'price': '\₹415'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) => CategoryCard(category: category)).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductCard(product: products[index]),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Map<String, String> category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 130,
      child: Column(
        children: [
          Image.asset(
            category['image']!,
            height: 90,
            width: 90,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 90),
          ),
          const SizedBox(height: 5),
          Text(category['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            Image.asset(
              product['image']!,
              height: 140,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 140),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(product['name']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(product['price']!, style: const TextStyle(fontSize: 16, color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              product['image']!,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 200),
            ),
            const SizedBox(height: 20),
            Text(product['name']!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(product['price']!, style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {},
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
