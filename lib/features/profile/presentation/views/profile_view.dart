import 'package:flutter/material.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/profile/presentation/widgets/connect_us_section.dart';
import 'package:news/features/profile/presentation/widgets/codes_section_widget.dart';
import 'package:news/features/profile/presentation/widgets/log_out_button.dart';
import 'package:news/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:news/features/profile/presentation/widgets/settings_section_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.profile,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            ProfileCardWidget(),
            SizedBox(height: 24),

            // Settings Section
            SettingsSectionWidget(),

            SizedBox(height: 24),

            // Codes Section
            CodesSectionWidget(),

            SizedBox(height: 24),

            ConnectUsSection(),

            SizedBox(height: 20),
            LogOutButton(),
          ],
        ),
      ),
    );
  }
}
