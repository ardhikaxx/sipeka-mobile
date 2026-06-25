import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_nav_controller.dart';
import '../../patient_dashboard/views/dashboard_view.dart';
import '../../health_data/views/health_data_view.dart';
import '../../schedule/views/schedule_view.dart';
import '../../education/views/education_view.dart';
import '../../../core/theme/app_colors.dart';

class MainNavView extends GetView<MainNavController> {
  final List<Widget> _pages = [
    const DashboardView(),
    const HealthDataView(),
    const ScheduleView(),
    const EducationView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(index: controller.currentIndex.value, children: _pages)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.gray400,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), activeIcon: Icon(Icons.favorite), label: 'Kesehatan'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), activeIcon: Icon(Icons.calendar_month), label: 'Jadwal'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), activeIcon: Icon(Icons.menu_book), label: 'Edukasi'),
          ],
        ),
      ),
    );
  }
}
