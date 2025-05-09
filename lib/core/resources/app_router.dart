import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/layout/main_shell.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/features/bookmark/presrntation/views/book_mark_view.dart';
import 'package:news/features/categories/presentation/views/categories_view.dart';
import 'package:news/features/categories/presentation/views/category_details_view.dart';
import 'package:news/features/news/presention/views/news_details_view.dart';
import 'package:news/features/news/presention/views/featured_news_view.dart';
import 'package:news/features/news/presention/views/news_view.dart';
import 'package:news/features/news/presention/views/search_view.dart';
import 'package:news/features/onBording/data/on_bording_service.dart';
import 'package:news/features/onBording/presention/views/onbording_view.dart';
import 'package:news/features/profile/presentation/views/profile_view.dart';
import 'package:news/features/categories/domain/entities/category.dart';
import 'package:news/features/news/domain/entities/article.dart';

class AppRouter {
  final bool onboardingSeen;

  AppRouter({required this.onboardingSeen});

  late final GoRouter router = GoRouter(
    initialLocation: onboardingSeen ? AppPaths.home : AppPaths.onboarding1,
    redirect: (context, state) {
      final onboardingCompleted = OnboardingService().onboardingCompleted;
      if (!onboardingCompleted &&
          state.matchedLocation != AppPaths.onboarding1) {
        return AppPaths.onboarding1;
      }
      return null;
    },
    routes: [
      // ==================== Auth & Onboarding Routes ====================
      GoRoute(
        path: AppPaths.onboarding1,
        builder: (context, state) => const OnboardingView(),
      ),

      // ==================== Main Shell Route (Bottom Navigation) ====================
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(state: state, child: child);
        },
        routes: [
          // ==================== Home Tab Routes ====================
          GoRoute(
            path: AppPaths.home,
            name: AppRoutes.home,
            builder: (context, state) => const NewsView(),
          ),
          GoRoute(
            path: AppPaths.featuredNews,
            name: AppRoutes.featuredNews,
            builder: (context, state) => const FeaturedNewsView(),
          ),
          GoRoute(
            path: AppPaths.newsDetail,
            name: AppRoutes.newsDetail,
            builder: (context, state) {
              final article = state.extra as Article?;
              return NewsDetailsView(article: article);
            },
          ),

          // ==================== Search Tab Routes ====================
          GoRoute(
            path: AppPaths.search,
            name: AppRoutes.search,
            builder: (context, state) => const SearchView(),
          ),

          // ==================== Notification Tab Routes ====================
          GoRoute(
            path: AppPaths.notification,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Notification'))),
          ),

          // ==================== Profile Tab Routes ====================
          GoRoute(
            path: AppPaths.profile,
            builder: (context, state) => const ProfileView(),
          ),
          GoRoute(
            path: AppPaths.profileEdit,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Profile Edit'))),
          ),

          // ==================== Category Routes ====================
          GoRoute(
            path: AppPaths.categories,
            builder: (context, state) => const CategoriesView(),
          ),
          GoRoute(
            path: AppPaths.newsByCategory,
            name: AppRoutes.newsByCategory,
            builder: (context, state) {
              final category = state.extra as Category;
              return CategoryDetailsView(category: category);
            },
          ),
          GoRoute(
            path: AppPaths.categoryDetails,
            name: AppRoutes.categoryDetails,
            builder: (context, state) {
              final category = state.extra as Category;
              return CategoryDetailsView(category: category);
            },
          ),

          // ==================== Bookmark Routes ====================
          GoRoute(
            path: AppPaths.bookmark,
            builder: (context, state) => const BookMarkView(),
          ),
        ],
      ),
    ],
  );
}
