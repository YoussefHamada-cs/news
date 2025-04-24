import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';
import '../../data/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final bool isLastPage;
  // final VoidCallback onNextPressed;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.isLastPage,
    // required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // تحديد الأحجام بناءً على حجم الشاشة
    final double imageHeight = isSmallScreen
        ? 60.0
        : isTablet
            ? 150.0
            : 100.0;

    final double titleFontSize = isSmallScreen
        ? 20.0
        : isTablet
            ? 30.0
            : 24.0;

    final double descriptionFontSize = isSmallScreen
        ? 14.0
        : isTablet
            ? 18.0
            : 16.0;

    final double verticalSpacing = isSmallScreen
        ? 20.0
        : isTablet
            ? 50.0
            : 40.0;

    final double bottomSpacing = isSmallScreen
        ? 60.0
        : isTablet
            ? 120.0
            : 100.0;

    // استخدام LayoutBuilder لجعل الواجهة متجاوبة
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 12.0 : 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    item.image,
                    height: imageHeight,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: verticalSpacing / 2),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: AppColors.hintText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: bottomSpacing),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
