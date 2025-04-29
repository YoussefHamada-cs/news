import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/features/profile/presentation/widgets/settings_item.dart';
import 'package:news/core/theme/theme_cubit.dart';

class SettingsSectionWidget extends StatelessWidget {
  const SettingsSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return
        // Settings Section
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppStrings.settings,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 16),

                // Dark Mode
                SettingsItem(
                  icon: Icons.dark_mode,
                  title: AppStrings.darkMode,
                  trailing: Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                  ),
                ),

                const Divider(),

                // Notifications
                SettingsItem(
                  icon: Icons.notifications,
                  title: AppStrings.notifications,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),

                const Divider(),

                // Notification Preferences
                const Text(
                  AppStrings.latestNotifications,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8),

                // Breaking News
                SettingsItem(
                  icon: Icons.newspaper,
                  title: AppStrings.latestNews,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),

                // Daily Summary
                SettingsItem(
                  icon: Icons.summarize,
                  title: AppStrings.dailySummary,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),

                // Saved Articles
                SettingsItem(
                  icon: Icons.bookmark,
                  title: AppStrings.protfolioArticales,
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),

                // App Updates
                SettingsItem(
                  icon: Icons.system_update,
                  title: AppStrings.updateApp,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Language
                const SettingsItem(
                    icon: Icons.language,
                    title: 'language',
                    trailing: Text('English')),
              ],
            ));
  }
}
