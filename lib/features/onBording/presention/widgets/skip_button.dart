import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:news/core/resources/app_routes.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/onBording/data/on_bording_service.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.currentPage,
  });
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == 2) return const SizedBox.shrink();

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

    return TextButton(
      onPressed: () async {
        // حفظ حالة مشاهدة الـ Onboarding
        await OnboardingService().completeOnboarding();
        // الانتقال للرئيسية
        context.pushReplacementNamed(AppRoutes.home);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen
              ? 8.0
              : isTablet
                  ? 16.0
                  : 12.0,
          vertical: isSmallScreen
              ? 4.0
              : isTablet
                  ? 10.0
                  : 8.0,
        ),
      ),
      child: Text(AppStrings.skip,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: fontSize,
                fontWeight: isTablet ? FontWeight.bold : FontWeight.normal,
              )),
    );
  }
}
