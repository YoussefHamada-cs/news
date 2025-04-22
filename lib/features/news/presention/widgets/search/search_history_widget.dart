import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

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
              .map((item) => _buildHistoryItem(context, item))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 36,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.iconDisabledDark),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.history,
              size: 16, color: AppColors.iconDisabledDark),
          const SizedBox(width: 4),
          Text(
            text,
            // style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              // Remove item functionality
            },
            child: const Icon(Icons.close,
                size: 16, color: AppColors.iconDisabledDark),
          ),
        ],
      ),
    );
  }
}
