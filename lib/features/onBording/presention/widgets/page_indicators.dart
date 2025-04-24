import 'package:flutter/material.dart';

class PageIndicators extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicators({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // حساب الأحجام بناءً على حجم الشاشة
    final double activeDotWidth = isSmallScreen
        ? 20.0
        : isTablet
            ? 32.0
            : 24.0;
    final double dotHeight = isSmallScreen
        ? 6.0
        : isTablet
            ? 10.0
            : 8.0;
    final double inactiveDotWidth = isSmallScreen
        ? 6.0
        : isTablet
            ? 10.0
            : 8.0;
    final double horizontalMargin = isSmallScreen
        ? 2.0
        : isTablet
            ? 6.0
            : 4.0;

    // إزالة Positioned لتجنب التعارض في الـ Widget tree
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          width: currentPage == index ? activeDotWidth : inactiveDotWidth,
          height: dotHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
              right: Radius.circular(16),
            ),
            color: currentPage == index
                ? Colors.blue
                : Colors.blue.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
