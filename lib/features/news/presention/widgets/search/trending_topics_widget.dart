import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/presention/widgets/search/build_topic_item.dart';

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
              .map((topic) => BuildTopicItem(
                    title: topic['title']!,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
