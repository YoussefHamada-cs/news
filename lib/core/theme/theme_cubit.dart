import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    var box = await Hive.openBox('settings');
    final isDark = box.get('isDarkMode', defaultValue: true) as bool;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme(bool isDark) async {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
    var box = await Hive.openBox('settings');
    await box.put('isDarkMode', isDark);
  }
}
