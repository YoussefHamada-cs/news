import 'package:flutter/material.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/presention/widgets/custom_list_view.dart';

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.latestNews,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.refresh, size: 16),
                  SizedBox(width: 4),
                  Text(AppStrings.refresh),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Latest News List
        const CustomListView(),
      ],
    );
  }
}
