import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/shimmer_image.dart';
import 'package:news/features/news/domain/entities/article.dart';

class ArticleImageWidget extends StatelessWidget {
  final Article article;

  const ArticleImageWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerImage(
      imageUrl: article.imageUrl,
      height: 350,
      width: double.infinity,
    );
  }
}
