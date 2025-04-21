import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.currentPage,
  });
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    if (currentPage == 2) return const SizedBox.shrink();
    return TextButton(
      onPressed: () {
        // Navigate to home screen
        context.pushReplacementNamed(AppRoutes.home);
      },
      child: const Text(
        AppStrings.skip,
        style: TextStyle(
          color: AppColors.textPrimaryDark,
          fontSize: 16,
        ),
      ),
    );
  }
}
