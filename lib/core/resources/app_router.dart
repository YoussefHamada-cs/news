import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/layout/main_shell.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/features/onBording/presention/views/onbording_view.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: AppPaths.onboarding1,
    routes: [
      // ==================== Auth & Onboarding Routes ====================

      GoRoute(
          path: AppPaths.onboarding1,
          builder: (context, state) => const OnboardingView()),

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
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Home'))),
          ),
          GoRoute(
            path: AppPaths.featuredNews,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Featured News'))),
          ),
          GoRoute(
            path: AppPaths.newsDetail,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('News Detail'))),
          ),

          // ==================== Search Tab Routes ====================
          GoRoute(
            path: AppPaths.search,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Search'))),
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
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Profile'))),
          ),
          GoRoute(
            path: AppPaths.profileEdit,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Profile Edit'))),
          ),
        ],
      ),

      // ==================== Category Routes ====================
      GoRoute(
        path: AppPaths.categories,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Categories'))),
      ),
      GoRoute(
        path: AppPaths.newsByCategory,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('News By Category'))),
      ),

      // ==================== Bookmark Routes ====================
      GoRoute(
        path: AppPaths.bookmark,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Bookmark'))),
      ),
    ],
  );
}
