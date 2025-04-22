import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/custom_app_bar.dart';
import 'package:news/features/news/presention/widgets/featured_news_section.dart';
import 'package:news/features/news/presention/widgets/latest_news_section.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Featured News Section
                    FeaturedNewsSection(),

                    SizedBox(height: 24),

                    // Latest News Section
                    LatestNewsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
