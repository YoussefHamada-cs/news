import 'package:hive_flutter/hive_flutter.dart';

class OnboardingService {
  final String _onboardingKey = 'onboardingCompleted';
  bool _onboardingCompleted = false;

  bool get onboardingCompleted => _onboardingCompleted;

  static final OnboardingService _instance = OnboardingService._internal();
  factory OnboardingService() => _instance;
  OnboardingService._internal();

  Future<void> initialize() async {
    final box = Hive.box('appBox');
    _onboardingCompleted = box.get(_onboardingKey, defaultValue: false);
  }

  Future<void> completeOnboarding() async {
    final box = Hive.box('appBox');
    await box.put(_onboardingKey, true);
    _onboardingCompleted = true;
  }
}
