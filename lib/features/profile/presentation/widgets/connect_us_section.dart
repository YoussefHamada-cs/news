import 'package:flutter/material.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/profile/presentation/widgets/settings_item.dart';

class ConnectUsSection extends StatelessWidget {
  const ConnectUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.about,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 16),
          SettingsItem(
            icon: Icons.mail,
            title: AppStrings.connectUs,
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(height: 12),
          SettingsItem(
            icon: Icons.call,
            title: AppStrings.contactUs,
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(height: 12),
          SettingsItem(
            icon: Icons.chat,
            title: AppStrings.frequentlyAskedQuestions,
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
