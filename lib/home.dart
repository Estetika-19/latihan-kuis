import 'package:flutter/material.dart';
import 'package:flutter_latihan_kuis/productdetail.dart';
import 'package:flutter_latihan_kuis/profile.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome, ${widget.username}',
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage(
                    username: widget.username, // Pass the actual username here
                  );
                }));
              },
            ),
          ],
          backgroundColor: Colors.pinkAccent,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPoster(
                      'assets/Peach New Arrival Cosmetic Modern Geometric Banner.png',
                      'Promo 1'),
                  _buildPoster(
                      'assets/Pink Make Up Cosmetic Promo Instagram Post.png',
                      'Promo 2'),
                  _buildPoster(
                      'assets/Pink Pastel Promo Product Cosmetic Poster.png',
                      'Promo 3'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Center the product in GridView with one item
            Expanded(
              child: Center(
                child: GridView.count(
                  crossAxisCount: 1, // One column
                  childAspectRatio: 1 / 1.5, // Adjust the aspect ratio
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildProductItem(context), // Single product
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(String imagePath, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      child: Column(
        children: [
          Image.asset(imagePath,
              height: 120, width: 200, fit: BoxFit.cover), // Load local image
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/high-angle-pink-shades-lipstick.jpg",
          height: 150, // Adjust the height for better visibility
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        const Text('Dior Lipstick', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ProductDetailPage(
                productName: 'Lipstick',
                productDescription: 'A smooth, long-lasting lipstick.',
                productPrice: 19.99,
                productImagePath: 'assets/high-angle-pink-shades-lipstick.jpg',
              );
            }));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            fixedSize: const Size(120, 35),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: const Text('Buy', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
