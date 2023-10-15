import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text('Item'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
