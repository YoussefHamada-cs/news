import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/features/news/domain/entities/article.dart';

class ArticleHeaderWidget extends StatelessWidget {
  final Article article;

  const ArticleHeaderWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(article.category,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimaryDark,
              )),
        ),
        const SizedBox(height: 12),
        Text(
          article.title,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: Colors.white,
          ),
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ],
    );
  }
}
