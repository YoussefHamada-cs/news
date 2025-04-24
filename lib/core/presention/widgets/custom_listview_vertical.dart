import 'package:flutter/material.dart';

class CustomListviewVertical extends StatelessWidget {
  const CustomListviewVertical(
      {super.key, required this.itemCount, required this.itemBuilder});
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: itemBuilder);
  }
}
