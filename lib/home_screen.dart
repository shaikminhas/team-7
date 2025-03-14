import 'package:flutter/material.dart';
import 'package:untitled1/product_card.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [

  ];

  final List<Map<String, String>> products = [

  ];

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) => CategoryCard(category)).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
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
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 100,
      child: Column(
        children: [
          Image.asset(category['image']!, height: 60),
          Text(category['name']!),
        ],
      ),
    );
  }
}
