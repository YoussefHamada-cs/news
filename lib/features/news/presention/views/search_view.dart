import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/presention/widgets/circular_loading_indicator.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presention/widgets/custom_list_view.dart';
import 'package:news/features/news/presention/widgets/search/search_app_bar.dart';
import 'package:news/features/news/presention/widgets/search/search_bar_widget.dart';
import 'package:news/features/news/presention/widgets/search/search_history_widget.dart';
import 'package:news/features/news/presention/widgets/search/trending_topics_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _isLoading = false;
  String _searchQuery = '';
  List<Article> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _isSearching = _searchQuery.isNotEmpty;
    });

    if (_isSearching) {
      _performSearch();
    }
  }

  Future<void> _performSearch() async {
    if (_searchQuery.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // This would normally be a real API call
    setState(() {
      _isLoading = false;
      _searchResults = Article.samples
          .where((article) =>
              article.title
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              article.content
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              article.publisherName
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = query.isNotEmpty;
    });
    _performSearch();
  }

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
                SearchBarWidget(
                  controller: _searchController,
                  onSearch: _onSearch,
                ),
                const SizedBox(height: 16.0),
                if (!_isSearching) ...[
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
                ] else if (_isLoading) ...[
                  const SizedBox(height: 100),
                  const CircularLoadingIndicator(),
                ] else if (_searchResults.isEmpty) ...[
                  const SizedBox(height: 100),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.search_off,
                            size: 48, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No results found for "$_searchQuery"',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Results for "$_searchQuery"',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomListView(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final article = _searchResults[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: LatestNewsCard(
                          imageurl: article.imageUrl,
                          time: article.readTime,
                          content: article.title,
                          type: article.publisherName,
                          onTap: () {
                            context.pushNamed(AppRoutes.newsDetail,
                                extra: article);
                          },
                        ),
                      );
                    },
                  )
                ]
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
