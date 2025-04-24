import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/custom_listview_vertical.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_colors.dart';
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

  @override
  void initState() {
    super.initState();
    articles = CategoryArticles.getArticlesForCategory(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // extendBodyBehindAppBar: true,
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
      ),
      body: Column(
        children: [
          // Color header

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
          // Article count

          const SizedBox(height: 16),
          // Articles list
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomListviewVertical(
                  itemCount: articles.length,
                  itemBuilder: (context, index) => const LatestNewsCard(
                    imageurl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
                    time: '4 min',
                    content:
                        'Global Climate Summit Reaches Breakthrough Agreement',
                    type: 'Global News Network',
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
