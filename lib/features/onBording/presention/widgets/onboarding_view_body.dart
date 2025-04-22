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
    return Scaffold(
      body: SafeArea(
        // إضافة SafeArea
        child: Stack(
          // تغيير الـ fit
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

            // Skip button with IgnorePointer for debugging
            Positioned(
                top: 20,
                right: 20,
                child: SkipButton(
                  currentPage: _currentPage,
                )),

            // Page indicators
            PageIndicators(
              currentPage: _currentPage,
              pageCount: _items.length,
            ),

            // Navigation buttons
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
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
        ),
      ),
    );
  }
}
