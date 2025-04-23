import 'package:flutter/material.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/news_details/build_paragraph.dart';
import 'package:news/features/news/presention/widgets/news_details/build_qoute.dart';

class ArticleContentWidget extends StatelessWidget {
  final Article article;

  const ArticleContentWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Paragraphs
        ...article.paragraphs.map((paragraph) {
          return Column(
            children: [
              BuildParagraph(
                text: paragraph,
              ),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),

        // Quote (if available)
        if (article.quote.isNotEmpty)
          BuildQoute(
            text: article.quote,
          ),
      ],
    );
  }
}
