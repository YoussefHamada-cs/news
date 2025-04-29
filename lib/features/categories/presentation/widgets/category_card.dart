import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/features/categories/domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function(Category) onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(category),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            top: BorderSide(
              color: AppColors.categoryColors[category.colorIndex],
              width: 4,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.categoryColors[category.colorIndex]
                    .withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  category.icon,
                  size: 30,
                  color: AppColors.categoryColors[category.colorIndex],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              category.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text('${category.articlesCount} مقالة',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
