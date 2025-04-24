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
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // ضبط الأحجام بناءً على حجم الشاشة
    final double fontSize = isSmallScreen
        ? 14.0
        : isTablet
            ? 18.0
            : 16.0;
    final double iconSize = isSmallScreen
        ? 18.0
        : isTablet
            ? 24.0
            : 20.0;
    final double spacingWidth = isSmallScreen
        ? 6.0
        : isTablet
            ? 10.0
            : 8.0;

    // تحديد الألوان
    final Color activeColor =
        (currentPage > 0) ? AppColors.textPrimaryDark : AppColors.hintText;

    return TextButton(
      onPressed: (currentPage > 0) ? onPressed : null,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen
              ? 8.0
              : isTablet
                  ? 16.0
                  : 12.0,
          vertical: isSmallScreen
              ? 6.0
              : isTablet
                  ? 10.0
                  : 8.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: activeColor,
            size: iconSize,
          ),
          SizedBox(width: spacingWidth),
          Text(
            AppStrings.previous,
            style: TextStyle(
              color: activeColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
