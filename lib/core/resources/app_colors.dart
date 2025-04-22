import 'package:flutter/material.dart';

class AppColors {
  // ==================== Theme Colors ====================
  /// Primary theme color used for main UI elements
  static const Color primary = Color(0xff9b87f5);

  /// Secondary theme color for dark mode
  static const Color secondaryDark = Color(0xff3c384e);

  /// Secondary theme color for light mode
  static const Color secondaryLight = Color(0xfff5f3fe);

  // ==================== Background Colors ====================
  /// Main background color for dark mode
  static const Color backgroundDark = Color(0xff121212);

  /// Main background color for light mode
  static const Color backgroundLight = Color(0xffffffff);

  /// Secondary background color for cards and elevated surfaces in dark mode
  static const Color secondaryBackgroundDark = Color(0xff242424);

  /// Secondary background color for cards and elevated surfaces in light mode
  static const Color secondaryBackgroundLight = Color(0xfff9fafb);

  /// Tertiary background color for special sections
  static const Color tertiaryBackground = Color(0xff020817);

  /// Background color for text fields in dark mode
  static const Color inputBackgroundDark = Color(0xff1f2937);

  /// Background color for text fields in light mode
  static const Color inputBackgroundLight = Color(0xfff3f4f6);

  // ==================== Text Colors ====================
  /// Primary text color for dark mode
  static const Color textPrimaryDark = Color(0xffffffff);

  /// Primary text color for light mode
  static const Color textPrimaryLight = Color(0xff000000);

  /// Secondary text color for dark mode
  static const Color textSecondaryDark = Color(0xffd1d5db);

  /// Secondary text color for light mode
  static const Color textSecondaryLight = Color(0xff374151);

  /// Color for hint text and placeholder content
  static const Color hintText = Color(0xff9ca3af);

  // ==================== Icon Colors ====================
  /// Primary color for icons
  static const Color iconPrimary = Color(0xffffffff);

  /// Color for enabled/active icons
  static const Color iconEnabled = primary;

  /// Color for disabled icons in dark mode
  static const Color iconDisabledDark = Color(0xff6b7280);

  /// Color for disabled icons in light mode
  static const Color iconDisabledLight = Color(0xff9ca3af);

  /// Background color for circular icon containers
  static const Color iconCircleBackground = Colors.transparent;

  // ==================== UI Element Colors ====================
  /// Color for publisher avatars in dark mode
  static const Color publisherAvatarDark = Color(0xff374151);

  /// Color for publisher avatars in light mode
  static const Color publisherAvatarLight = Color(0xffe5e7eb);

  /// Color for error states and danger alerts
  static const Color error = Color(0xffef4444);

  // ==================== Category Colors ====================
  /// List of colors used for different categories
  static const List<Color> categoryColors = [
    primary,
    Color(0xff0ea5e9), // Science
    Color(0xffd946ef), // Entertainment
    Color(0xfff97418), // Sports
  ];
  static Color grey700 = Colors.grey[700]!;
  static Color grey850 = Colors.grey[850]!;
  static Color grey900 = Colors.grey[900]!;
  static const Color purple = Color(0xff8b80c7);
  static const Color darkPurple = Color(0xff2d2a3f);
}
