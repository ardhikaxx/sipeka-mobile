import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/main_nav/views/main_nav_view.dart';
import '../../features/main_nav/bindings/main_nav_binding.dart';
import '../../features/emergency/views/emergency_view.dart';
import '../../features/emergency/bindings/emergency_binding.dart';

import '../../features/onboarding/views/splash_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainNavView(),
      binding: MainNavBinding(),
    ),
    GetPage(
      name: Routes.EMERGENCY,
      page: () => const EmergencyView(),
      binding: EmergencyBinding(),
      fullscreenDialog: true,
      transition: Transition.downToUp,
    ),
  ];
}
