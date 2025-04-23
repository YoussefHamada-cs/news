import 'package:flutter/material.dart';

class BuildParagraph extends StatelessWidget {
  const BuildParagraph({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.bodyMedium,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}
