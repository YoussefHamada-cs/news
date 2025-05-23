import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/core/di/service_locator.dart';
import 'package:news/core/resources/app_router.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/core/theme/theme_cubit.dart';
import 'package:news/features/newsmarked/domain/cubit/newsmarked_cubit.dart';
import 'package:news/features/news/domain/adapters/article_adapter.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/onBording/data/on_bording_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة محدد الخدمات
  setupServiceLocator();

  // تهيئة Hive
  await Hive.initFlutter();
  await Hive.openBox('appBox');

  // تهيئة خدمة المفضلة

  // تهيئة خدمة الشاشة التعريفية
  await OnboardingService().initialize();

  var box = await Hive.openBox('settings');

  final isDark = box.get('isDarkMode', defaultValue: true) as bool;

  // Register Article adapter for Hive
  Hive.registerAdapter(ArticleAdapter());
  // Open the newsmarked box
  await Hive.openBox<Article>(AppStrings.newsmarkedBox);

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..toggleTheme(isDark)),
        BlocProvider(
          create: (context) => NewsmarkedCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter(
                    onboardingSeen: OnboardingService().onboardingCompleted)
                .router,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
