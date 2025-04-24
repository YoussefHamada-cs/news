import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle logout action here
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.error,
              width: 1.5,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: AppColors.error,
              ),
              SizedBox(width: 8),
              Text(
                AppStrings.logout,
                style: TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
