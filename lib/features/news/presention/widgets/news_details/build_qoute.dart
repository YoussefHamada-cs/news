import 'package:flutter/material.dart';

class BuildQoute extends StatelessWidget {
  const BuildQoute({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            text,
            style: textTheme.bodyMedium,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
