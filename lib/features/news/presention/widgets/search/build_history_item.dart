import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';

class BuildHistoryItem extends StatelessWidget {
  const BuildHistoryItem({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 36,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.iconDisabledDark),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.history,
              size: 16, color: AppColors.iconDisabledDark),
          const SizedBox(width: 4),
          Text(
            text,
            // style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              // Remove item functionality
            },
            child: const Icon(Icons.close,
                size: 16, color: AppColors.iconDisabledDark),
          ),
        ],
      ),
    );
  }
}
