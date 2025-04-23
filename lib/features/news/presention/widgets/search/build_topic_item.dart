import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';

class BuildTopicItem extends StatelessWidget {
  const BuildTopicItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.darkPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: AppColors.purple),
      ),
    );
  }
}
