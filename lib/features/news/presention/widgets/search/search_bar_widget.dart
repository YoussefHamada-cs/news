import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.inputBackgroundDark, // const Color(0xFF303030),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        // style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: AppStrings.searchNews,
          hintStyle: TextStyle(color: AppColors.hintText),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.iconDisabledDark,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          // Handle search input changes
        },
      ),
    );
  }
}
