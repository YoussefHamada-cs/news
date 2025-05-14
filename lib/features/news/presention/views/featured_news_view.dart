import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/presention/widgets/circular_loading_indicator.dart';
import 'package:news/core/presention/widgets/custom_listview_vertical.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/domain/entities/article.dart';

class FeaturedNewsView extends StatefulWidget {
  const FeaturedNewsView({super.key});

  @override
  State<FeaturedNewsView> createState() => _FeaturedNewsViewState();
}

class _FeaturedNewsViewState extends State<FeaturedNewsView> {
  bool _isLoading = true;
  late List<Article> _featuredArticles;

  @override
  void initState() {
    super.initState();
    _loadFeaturedArticles();
  }

  Future<void> _loadFeaturedArticles() async {
    // Simulate loading delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would fetch data from an API or database
    setState(() {
      _featuredArticles = Article.samples;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.featuredNews,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadFeaturedArticles();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularLoadingIndicator())
          : CustomListviewVertical(
              itemCount: _featuredArticles.length,
              itemBuilder: (context, index) {
                final article = _featuredArticles[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, right: 16, left: 16, bottom: 8),
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
    );
  }
}
