import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/news_details/custom_item_buttom.dart';
import 'package:news/features/newsmarked/domain/cubit/newsmarked_cubit.dart';

class ArticleInteractionBar extends StatefulWidget {
  final Article article;

  const ArticleInteractionBar({
    super.key,
    required this.article,
  });

  @override
  State<ArticleInteractionBar> createState() => _ArticleInteractionBarState();
}

class _ArticleInteractionBarState extends State<ArticleInteractionBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleNewsmarked() {
    final newsmarkedCubit = context.read<NewsmarkedCubit>();
    final isMarked = newsmarkedCubit.isNewsmarked(widget.article);

    _animationController.forward(from: 0.0);

    if (isMarked) {
      newsmarkedCubit.removeFromNewsmarked(widget.article);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('The article has been removed from Bookmark'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      newsmarkedCubit.addToNewsmarked(widget.article);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('The article has been added to Bookmark'),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
                  label: widget.article.likesCount.toString(),
                ),
                const SizedBox(width: 16),
                CustomItemButtom(
                  icon: Icons.chat_bubble_outline,
                  label: widget.article.commentsCount.toString(),
                ),
                const SizedBox(width: 16),
                CustomItemButtom(
                  icon: Icons.remove_red_eye_outlined,
                  label: widget.article.viewsCount.toString(),
                ),
              ],
            ),
          ),
          BlocBuilder<NewsmarkedCubit, List<Article>>(
            builder: (context, state) {
              final isMarked =
                  context.read<NewsmarkedCubit>().isNewsmarked(widget.article);
              return ScaleTransition(
                scale: _scaleAnimation,
                child: IconButton(
                  icon: Icon(
                    isMarked ? Icons.bookmark : Icons.bookmark_outline,
                    size: 28,
                    color: isMarked ? AppColors.primary : null,
                  ),
                  onPressed: _toggleNewsmarked,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
