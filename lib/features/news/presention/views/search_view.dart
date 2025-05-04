import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/presention/widgets/custom_list_view.dart';
import 'package:news/features/news/presention/widgets/search/search_app_bar.dart';
import 'package:news/features/news/presention/widgets/search/search_bar_widget.dart';
import 'package:news/features/news/presention/widgets/search/search_history_widget.dart';

import 'package:news/features/news/presention/widgets/search/trending_topics_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBarWidget(),
                const SizedBox(height: 16.0),
                const SearchHistoryWidget(),
                const SizedBox(height: 24.0),
                const TrendingTopicsWidget(),
                const SizedBox(height: 24.0),
                Center(
                  child: Text(
                    AppStrings.startTypingToSearch,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
                CustomListView(
                  itemCount: 15,
                  itemBuilder: (context, inDEX) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoutes.newsDetail);
                        },
                        child: const LatestNewsCard(
                          imageurl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
                          time: '4 min',
                          content:
                              'Global Climate Summit Reaches Breakthrough Agreement',
                          type: 'Global News Network',
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
