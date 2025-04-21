import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

class PreviousButton extends StatelessWidget {
  final int currentPage;
  final Function() onPressed;

  const PreviousButton({
    super.key,
    required this.currentPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (currentPage > 0) ? onPressed : null,
        child: Row(
          children: [
            Icon(Icons.arrow_back,
                color: (currentPage > 0)
                    ? AppColors.textPrimaryDark
                    : AppColors.hintText),
            const SizedBox(width: 8),
            Text(
              AppStrings.previous,
              style: TextStyle(
                color: (currentPage > 0)
                    ? AppColors.textPrimaryDark
                    : AppColors.hintText,
                fontSize: 16,
              ),
            ),
          ],
        ));
  }
}
