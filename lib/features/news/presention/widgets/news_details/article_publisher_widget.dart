import 'package:flutter/material.dart';
import 'package:news/features/news/domain/entities/article.dart';

class ArticlePublisherWidget extends StatelessWidget {
  final Article article;

  const ArticlePublisherWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        // Publisher avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFF3A3A47),
          child: Text(
            article.publisherImage,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Publisher info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.publisherName,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(article.publisherType, style: textTheme.bodyMedium),
            ],
          ),
        ),
        // Date and time info
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Reading time
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.access_time,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(article.readTime, style: textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            // Date
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(article.date, style: textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
