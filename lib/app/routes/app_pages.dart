import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/main_nav/views/main_nav_view.dart';
import '../../features/main_nav/bindings/main_nav_binding.dart';
import '../../features/emergency/views/emergency_view.dart';
import '../../features/emergency/bindings/emergency_binding.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
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
