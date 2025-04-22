import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';
import 'package:news/core/resources/app_strings.dart';

class FeaturedNewsView extends StatelessWidget {
  const FeaturedNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppStrings.featuredNews,
        style: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      )),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: LatestNewsCard(
            imageurl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
            time: '4 min',
            content: 'Global Climate Summit Reaches Breakthrough Agreement',
            type: 'Global News Network',
          ),
        ),
      ),
    );
  }
}
