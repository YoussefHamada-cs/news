import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/di/service_locator.dart';
import 'package:news/core/presention/widgets/circular_loading_indicator.dart';
import 'package:news/core/presention/widgets/error_view.dart';
import 'package:news/features/news/presention/cubit/news_cubit.dart';
import 'package:news/features/news/presention/widgets/custom_app_bar.dart';
import 'package:news/features/news/presention/widgets/featured_news_section.dart';
import 'package:news/features/news/presention/widgets/latest_news_section.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubit>()..loadNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Scaffold(
              appBar: CustomAppBar(),
              body: Center(
                child: CircularLoadingIndicator(),
              ),
            );
          } else if (state is NewsError) {
            return Scaffold(
              appBar: const CustomAppBar(),
              body: ErrorView(
                message: state.message,
                onRetry: () => context.read<NewsCubit>().loadNews(),
              ),
            );
          } else if (state is NewsLoaded) {
            return Scaffold(
              appBar: const CustomAppBar(),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    // Content
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Featured News Section
                            FeaturedNewsSection(
                              featuredNews: state.featuredNews,
                            ),

                            const SizedBox(height: 24),

                            // Latest News Section
                            LatestNewsSection(
                              latestNews: state.latestNews,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Default loading state
          return const Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: CircularLoadingIndicator(),
            ),
          );
        },
      ),
    );
  }
}
