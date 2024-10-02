import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImagePath; // Add image path

  const ProductDetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImagePath, // Add image path to constructor
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center( // Center the content on the page
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Product image
              Image.asset(
                widget.productImagePath,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // Product details
              Text(
                widget.productName,
                style: const TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.productDescription,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 10),
              Text(
                '\$${widget.productPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, color: Colors.green),
              ),
              const SizedBox(height: 30),
              // Buy button
              ElevatedButton(
                onPressed: () {
                  // Show snackbar on buy button click
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Purchase successful!'),
                    ),
                  );
                },
                child: const Text('Buy'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40, 
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
