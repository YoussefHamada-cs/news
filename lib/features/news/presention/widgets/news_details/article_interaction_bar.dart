import 'package:flutter/material.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/news_details/custom_item_buttom.dart';

class ArticleInteractionBar extends StatelessWidget {
  final Article article;

  const ArticleInteractionBar({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomItemButtom(
                  icon: Icons.favorite_outline,
                  label: article.likesCount.toString(),
                ),
                const SizedBox(width: 16),
                CustomItemButtom(
                  icon: Icons.chat_bubble_outline,
                  label: article.commentsCount.toString(),
                ),
                const SizedBox(width: 16),
                CustomItemButtom(
                  icon: Icons.remove_red_eye_outlined,
                  label: article.viewsCount.toString(),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              article.isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              size: 28,
            ),
            onPressed: () {
              // Bookmark functionality
            },
          ),
        ],
      ),
    );
  }
}
