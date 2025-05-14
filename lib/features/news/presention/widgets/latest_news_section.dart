import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/custom_list_view.dart';

class LatestNewsSection extends StatelessWidget {
  final List<Article> latestNews;

  const LatestNewsSection({
    super.key,
    required this.latestNews,
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
        CustomListView(
          itemCount: latestNews.length,
          itemBuilder: (context, index) {
            final article = latestNews[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: LatestNewsCard(
                imageurl: article.imageUrl,
                time: article.readTime,
                content: article.title,
                type: article.publisherName,
                id: article.id,
                onTap: () {
                  context.pushNamed(AppRoutes.newsDetail, extra: article);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
