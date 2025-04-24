import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/features/categories/domain/entities/category.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  final Function(Category) onTap;

  const CategoryListItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(category),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(
              color: AppColors.categoryColors[category.colorIndex],
              width: 4,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.categoryColors[category.colorIndex]
                            .withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          category.icon,
                          size: 24,
                          color: AppColors.categoryColors[category.colorIndex],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      '${category.articlesCount} articles',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondaryDark,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
