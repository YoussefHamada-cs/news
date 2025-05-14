import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/presention/widgets/circular_loading_indicator.dart';
import 'package:news/core/presention/widgets/custom_listview_vertical.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/categories/domain/entities/category.dart';
import 'package:news/features/categories/domain/entities/category_articles.dart';
import 'package:news/features/news/domain/entities/article.dart';

class CategoryDetailsView extends StatefulWidget {
  final Category category;

  const CategoryDetailsView({
    super.key,
    required this.category,
  });

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late List<Article> articles;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 800));

    setState(() {
      articles = CategoryArticles.getArticlesForCategory(widget.category.name);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.categoryColors[widget.category.colorIndex],
        title: Row(
          children: [
            Icon(
              widget.category.icon,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              widget.category.name,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadArticles();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${AppStrings.latestIn} ${widget.category.name}",
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${widget.category.articlesCount} مقالة',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textSecondaryDark,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Articles list
          Expanded(
            child: _isLoading
                ? const Center(child: CircularLoadingIndicator())
                : articles.isEmpty
                    ? Center(
                        child: Text(
                          'لا توجد مقالات في هذه الفئة',
                          style: textTheme.titleMedium,
                        ),
                      )
                    : CustomListviewVertical(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final article = articles[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: LatestNewsCard(
                              imageurl: article.imageUrl,
                              time: article.readTime,
                              content: article.title,
                              type: article.publisherName,
                              onTap: () {
                                context.pushNamed(
                                  AppRoutes.newsDetail,
                                  extra: article,
                                );
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
