import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_nav_controller.dart';
import '../../patient_dashboard/views/dashboard_view.dart';
import '../../health_data/views/health_data_view.dart';
import '../../schedule/views/schedule_view.dart';
import '../../education/views/education_view.dart';
import '../../profile/views/profile_view.dart';
import '../../../core/theme/app_colors.dart';

class MainNavView extends GetView<MainNavController> {
  final List<Widget> _pages = [
    const DashboardView(),
    const HealthDataView(),
    const ScheduleView(),
    const EducationView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => IndexedStack(index: controller.currentIndex.value, children: _pages)),
      bottomNavigationBar: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Container(
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.15),
                    blurRadius: 32,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(controller.currentIndex.value, 0, Icons.home_rounded, 'Beranda'),
                  _buildNavItem(controller.currentIndex.value, 1, Icons.favorite_rounded, 'Kesehatan'),
                  _buildNavItem(controller.currentIndex.value, 2, Icons.calendar_month_rounded, 'Jadwal'),
                  _buildNavItem(controller.currentIndex.value, 3, Icons.menu_book_rounded, 'Edukasi'),
                  _buildNavItem(controller.currentIndex.value, 4, Icons.person_rounded, 'Profil'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int currentIndex, int itemIndex, IconData icon, String label) {
    final isSelected = currentIndex == itemIndex;
    final MainNavController controller = Get.find<MainNavController>();
    return GestureDetector(
      onTap: () => controller.changePage(itemIndex),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? AppColors.primary : AppColors.gray400,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
