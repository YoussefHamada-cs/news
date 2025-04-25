import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/custom_listview_vertical.dart';
import 'package:news/core/presention/widgets/latest_news_card.dart';

class BodyBookMark extends StatelessWidget {
  const BodyBookMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListviewVertical(
      itemCount: 5,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(top: 8.0, right: 16, left: 16, bottom: 8),
        child: LatestNewsCard(
          imageurl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
          time: '4 min',
          content: 'Global Climate Summit Reaches Breakthrough Agreement',
          type: 'Global News Network',
        ),
      ),
    );
  }
}
