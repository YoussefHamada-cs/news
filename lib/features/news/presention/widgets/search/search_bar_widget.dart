import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_strings.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onSearch;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.inputBackgroundDark, // const Color(0xFF303030),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: AppStrings.searchNews,
          hintStyle: const TextStyle(color: AppColors.hintText),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.iconDisabledDark,
          ),
          suffixIcon: controller != null && controller!.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.iconDisabledDark,
                  ),
                  onPressed: () {
                    controller!.clear();
                    if (onSearch != null) {
                      onSearch!('');
                    }
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
        ),
        textAlignVertical: TextAlignVertical.center,
        onChanged: onSearch,
        onSubmitted: onSearch,
      ),
    );
  }
}
