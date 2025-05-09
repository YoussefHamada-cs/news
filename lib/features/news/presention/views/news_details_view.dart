import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/news_details/article_content_widget.dart';
import 'package:news/features/news/presention/widgets/news_details/article_header_widget.dart';
import 'package:news/features/news/presention/widgets/news_details/article_image_widget.dart';
import 'package:news/features/news/presention/widgets/news_details/article_interaction_bar.dart';
import 'package:news/features/news/presention/widgets/news_details/article_publisher_widget.dart';

class NewsDetailsView extends StatelessWidget {
  final Article? article;

  const NewsDetailsView({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    // Get article from route parameters or use sample as fallback
    final displayArticle = article ??
        GoRouterState.of(context).extra as Article? ??
        Article.sample;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: null, // No app bar
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Background image at the top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ArticleImageWidget(article: displayArticle),
              ),

              // Custom app bar buttons (back, share, bookmark)
              Positioned(
                top: statusBarHeight + 10,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () => context.pop(),
                      ),
                    ),

                    // Action buttons
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {
                              // Share functionality
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              displayArticle.isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {
                              // Bookmark functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Content layout
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Space for the image
                  const SizedBox(height: 300),

                  // Content card that overlaps with the image
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ArticleHeaderWidget(article: displayArticle),
                            const SizedBox(height: 16),
                            ArticlePublisherWidget(article: displayArticle),
                            const SizedBox(height: 24),
                            ArticleContentWidget(article: displayArticle),
                            const SizedBox(height: 16),
                            ArticleInteractionBar(article: displayArticle),
                            const SizedBox(height: 40), // Extra bottom padding
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
