// Settings Item Widget
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        trailing,
      ],
    );
  }
}
