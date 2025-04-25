import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

class NoBookMark extends StatelessWidget {
  const NoBookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Icon(Icons.bookmark_border_outlined,
              size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            AppStrings.noBookmarksYet,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            AppStrings.noBookmarksYetDescription,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          // ignore: prefer_const_constructors
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              AppStrings.browseArticles,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
