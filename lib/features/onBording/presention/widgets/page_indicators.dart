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
    return Positioned(
      bottom: 130,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pageCount,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: currentPage == index ? 24 : 8,
            height: 8,
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
      ),
    );
  }
}
