import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/newsmarked/domain/cubit/newsmarked_cubit.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:go_router/go_router.dart';

class NewsMarkedView extends StatelessWidget {
  const NewsMarkedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bookmarks),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              _showClearConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<NewsmarkedCubit, List<Article>>(
        builder: (context, newsmarkedArticles) {
          if (newsmarkedArticles.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildNewsmarkedList(context, newsmarkedArticles);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bookmark_border,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.noBookmarksYet,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              AppStrings.noBookmarksYetDescription,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to home or news list
              context.pop();
            },
            child: const Text(AppStrings.browseArticles),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsmarkedList(BuildContext context, List<Article> articles) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final article = articles[index];
        return LatestNewsCard(
          imageurl: article.imageUrl,
          time: article.readTime,
          content: article.title,
          type: article.category,
          id: article.id,
          onTap: () {
            // Navigate to article details
            context.push('/news-detail', extra: article);
          },
        );
      },
    );
  }

  void _showClearConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Clear All Bookmarks?'),
        content: const Text(
            'Are you sure you want to remove all bookmarked articles? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<NewsmarkedCubit>().clearAllNewsmarked();
              Navigator.of(dialogContext).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All bookmarks cleared'),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}
