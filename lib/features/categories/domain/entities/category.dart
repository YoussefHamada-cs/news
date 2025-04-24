import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final int articlesCount;
  final int colorIndex;

  const Category({
    required this.name,
    required this.icon,
    required this.articlesCount,
    required this.colorIndex,
  });

  // Sample categories for testing purposes
  static List<Category> get samples => [
        const Category(
          name: 'Technology',
          icon: Icons.computer,
          articlesCount: 21,
          colorIndex: 0,
        ),
        const Category(
          name: 'Sports',
          icon: Icons.sports_soccer,
          articlesCount: 30,
          colorIndex: 3,
        ),
        const Category(
          name: 'Health',
          icon: Icons.favorite,
          articlesCount: 19,
          colorIndex: 2,
        ),
        const Category(
          name: 'Politics',
          icon: Icons.account_balance,
          articlesCount: 47,
          colorIndex: 1,
        ),
        const Category(
          name: 'Business',
          icon: Icons.business_center,
          articlesCount: 7,
          colorIndex: 0,
        ),
        const Category(
          name: 'Science',
          icon: Icons.science,
          articlesCount: 46,
          colorIndex: 1,
        ),
        const Category(
          name: 'Entertainment',
          icon: Icons.movie,
          articlesCount: 30,
          colorIndex: 2,
        ),
        const Category(
          name: 'Food',
          icon: Icons.restaurant,
          articlesCount: 29,
          colorIndex: 2,
        ),
      ];
}
