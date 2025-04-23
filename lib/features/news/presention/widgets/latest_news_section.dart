import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';

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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoutes.newsDetail);
                },
                child: const LatestNewsCard(
                  imageurl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
                  time: '4 min',
                  content:
                      'Global Climate Summit Reaches Breakthrough Agreement',
                  type: 'Global News Network',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
