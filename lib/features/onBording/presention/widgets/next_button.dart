import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';

class NextButton extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function() onNextPage;

  const NextButton({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == totalPages - 1;

    return ElevatedButton(
      onPressed: () {
        if (currentPage < totalPages - 1) {
          onNextPage();
        } else {
          // Navigate to home screen
          context.pushReplacementNamed(AppRoutes.home);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isLastPage ? AppStrings.start : AppStrings.next,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
