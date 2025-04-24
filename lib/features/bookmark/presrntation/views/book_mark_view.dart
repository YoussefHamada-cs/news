import 'package:flutter/material.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/bookmark/presrntation/widgets/body_book_mark.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppStrings.bookmarks,
        style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      )),
      body: const BodyBookMark(),
    );
  }
}
