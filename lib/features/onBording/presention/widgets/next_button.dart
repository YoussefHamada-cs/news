import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/onBording/data/on_bording_service.dart';

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

    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // ضبط الأحجام بناءً على حجم الشاشة
    final double horizontalPadding = isSmallScreen
        ? 10.0
        : isTablet
            ? 20.0
            : 15.0;
    final double verticalPadding = isSmallScreen
        ? 8.0
        : isTablet
            ? 12.0
            : 10.0;
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

    return ElevatedButton(
      onPressed: () async {
        if (currentPage < totalPages - 1) {
          onNextPage();
        } else {
          // حفظ حالة مشاهدة الـ Onboarding
          await OnboardingService().completeOnboarding();
          // الانتقال للرئيسية
          context.pushReplacementNamed(AppRoutes.home);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
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
            style: TextStyle(fontSize: fontSize),
          ),
          SizedBox(width: spacingWidth),
          Icon(Icons.arrow_forward, color: Colors.white, size: iconSize),
        ],
      ),
    );
  }
}
