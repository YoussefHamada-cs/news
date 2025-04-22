import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

class TrendingTopicsWidget extends StatelessWidget {
  const TrendingTopicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // Sample trending topics data
    final List<Map<String, String>> trendingTopics = [
      {'title': 'Artificial Intelligence'},
      {'title': 'Climate Change'},
      {'title': 'Space Exploration'},
      {'title': 'Cryptocurrency'},
      {'title': 'Remote Work'},
      {'title': 'Electric Vehicles'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: AppColors.primary,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              AppStrings.trendingTopics, // Trending topics in Arabic
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          children: trendingTopics
              .map((topic) => _buildTopicButton(topic['title']!))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildTopicButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.darkPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: AppColors.purple),
      ),
    );
  }
}
