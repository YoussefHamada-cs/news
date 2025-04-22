import 'package:flutter/material.dart';
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
              onPressed: () {},
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
              return const Padding(
                padding: EdgeInsets.only(right: 12),
                child: FeaturedNewsCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
