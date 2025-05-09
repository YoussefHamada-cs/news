import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/featured_news_card.dart';

class FeaturedNewsSection extends StatelessWidget {
  final List<Article> featuredNews;

  const FeaturedNewsSection({
    super.key,
    required this.featuredNews,
  });

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
            itemCount: featuredNews.length,
            itemBuilder: (context, index) {
              final article = featuredNews[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: FeaturedNewsCard(
                  imageUrl: article.imageUrl,
                  title: article.title,
                  category: article.category,
                  time: article.readTime,
                  onTap: () {
                    context.pushNamed(AppRoutes.newsDetail, extra: article);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
