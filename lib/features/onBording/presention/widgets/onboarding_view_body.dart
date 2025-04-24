import 'package:flutter/material.dart';
import 'package:news/features/onBording/presention/widgets/skip_button.dart';
import '../../data/onboarding_data.dart';
import '../../data/onboarding_item.dart';
import 'onboarding_page.dart';
import 'page_indicators.dart';
import 'previous_button.dart';
import 'next_button.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingItem> _items = OnboardingData.items;

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // تحديد المسافات بناءً على حجم الشاشة
    final double topPadding = isSmallScreen
        ? 10.0
        : isTablet
            ? 30.0
            : 20.0;
    final double bottomPadding = isSmallScreen
        ? 20.0
        : isTablet
            ? 40.0
            : 30.0;
    final double sidePadding = isSmallScreen
        ? 10.0
        : isTablet
            ? 30.0
            : 20.0;

    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            // تعديل الواجهة بناءً على اتجاه الشاشة
            final bool isPortrait = orientation == Orientation.portrait;

            return LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    // PageView في الخلفية
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return OnboardingPage(
                          item: _items[index],
                          isLastPage: index == _items.length - 1,
                        );
                      },
                    ),

                    // Skip button
                    Positioned(
                      top: topPadding,
                      right: sidePadding,
                      child: SkipButton(
                        currentPage: _currentPage,
                      ),
                    ),

                    // Page indicators
                    Positioned(
                      bottom:
                          isPortrait ? bottomPadding + 60 : bottomPadding + 10,
                      left: 0,
                      right: 0,
                      child: PageIndicators(
                        currentPage: _currentPage,
                        pageCount: _items.length,
                      ),
                    ),

                    // Navigation buttons
                    Positioned(
                      bottom: bottomPadding,
                      left: sidePadding,
                      right: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PreviousButton(
                            currentPage: _currentPage,
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                          ),
                          NextButton(
                            currentPage: _currentPage,
                            totalPages: _items.length,
                            onNextPage: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
