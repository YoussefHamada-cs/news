import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../resources/app_routes.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const MainShell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(state),
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'bookmark',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Helper method to calculate the selected index for bottom navigation
  static int _calculateSelectedIndex(GoRouterState state) {
    final String path = state.uri.path;
    if (path.startsWith(AppPaths.home) ||
        path.startsWith(AppPaths.featuredNews) ||
        path.startsWith(AppPaths.newsDetail)) {
      return 0;
    } else if (path.startsWith(AppPaths.categories)) {
      return 1;
    } else if (path.startsWith(AppPaths.bookmark)) {
      return 2;
    } else if (path.startsWith(AppPaths.profile) ||
        path.startsWith(AppPaths.profileEdit)) {
      return 3;
    }
    return 0;
  }

  // Helper method to handle bottom navigation item taps
  static void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppPaths.home);
        break;
      case 1:
        context.go(AppPaths.categories);
        break;
      case 2:
        context.go(AppPaths.bookmark);
        break;
      case 3:
        context.go(AppPaths.profile);
        break;
    }
  }
}
