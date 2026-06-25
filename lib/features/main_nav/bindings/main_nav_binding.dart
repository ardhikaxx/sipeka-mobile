import 'package:get/get.dart';
import '../controllers/main_nav_controller.dart';
import '../../patient_dashboard/controllers/dashboard_controller.dart';
import '../../health_data/controllers/health_data_controller.dart';
import '../../schedule/controllers/schedule_controller.dart';
import '../../education/controllers/education_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HealthDataController>(() => HealthDataController());
    Get.lazyPut<ScheduleController>(() => ScheduleController());
    Get.lazyPut<EducationController>(() => EducationController());
  }
}
