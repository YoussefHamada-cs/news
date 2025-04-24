import 'package:flutter/material.dart';
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
                const CustomListView()
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
