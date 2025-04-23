import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/presention/widgets/search/build_history_item.dart';

class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // Sample search history data

    final List<String> searchHistoryItems = [
      'technology',
      'politics',
      'sports',
      'fashion',
      'health',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.searchHistory,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Clear history functionality
              },
              child: const Text(
                AppStrings.clearHistory, // Clear history in Arabic
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: searchHistoryItems
              .map((item) => BuildHistoryItem(
                    text: item,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
