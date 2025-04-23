import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/presention/widgets/featured_news_card.dart';

class FeaturedNewsSection extends StatelessWidget {
  const FeaturedNewsSection({super.key});

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
            Text(AppStrings.featuredNews,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.featuredNews);
              },
              child: const Text(AppStrings.seeAll),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Featured News Cards
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.newsDetail);
                    },
                    child: const FeaturedNewsCard()),
              );
            },
          ),
        ),
      ],
    );
  }
}
