import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widgets/risk_badge.dart';
import '../../main_nav/controllers/main_nav_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          // Dynamic Background Element
          Positioned(
            top: -150,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 90, // space for header
              bottom: 120, // space for floating bottom nav
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.primary, Color(0xFF0A585B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 24, offset: const Offset(0, 12))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Selamat Datang,', style: TextStyle(color: Colors.white70, fontSize: 16)),
                      const SizedBox(height: 5),
                      Obx(() => Text(controller.patientName.value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Usia Kehamilan', style: TextStyle(color: AppColors.gray500, fontSize: 12)),
                                const SizedBox(height: 4),
                                Obx(() => Text(controller.gestationalAge.value, style: const TextStyle(color: AppColors.gray900, fontSize: 16, fontWeight: FontWeight.bold))),
                                const SizedBox(height: 12),
                                const Text('Perkiraan Lahir', style: TextStyle(color: AppColors.gray500, fontSize: 12)),
                                const SizedBox(height: 4),
                                Obx(() => Text(controller.hpl.value, style: const TextStyle(color: AppColors.gray900, fontSize: 14, fontWeight: FontWeight.w600))),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const RiskBadge(level: RiskLevel.warning),
                                const SizedBox(height: 12),
                                Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.secondaryLight, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.pregnant_woman, color: AppColors.secondary, size: 30)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Layanan SIPEKA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.05,
                        children: [
                          _buildMenuCard('Data Kesehatan', Icons.favorite, AppColors.secondary, () => Get.find<MainNavController>().changePage(1)),
                          _buildMenuCard('Jadwal Periksa', Icons.calendar_month, AppColors.primaryLight, () => Get.find<MainNavController>().changePage(2)),
                          _buildMenuCard('Modul Edukasi', Icons.menu_book, AppColors.riskGreen, () => Get.find<MainNavController>().changePage(3)),
                          _buildMenuCard('Lapor Darurat', Icons.warning_amber_rounded, AppColors.riskRed, () => Get.toNamed(Routes.EMERGENCY), isEmergency: true),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          
          // Floating Pill Header
          Positioned(
            top: 0, left: 0, right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.primaryPale,
                          child: Icon(Icons.person, color: AppColors.primary, size: 20),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('SIPEKA', style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('Portal Pasien', style: TextStyle(color: AppColors.gray500, fontSize: 10, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.bgApp,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.gray200),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined, color: AppColors.gray700, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(String title, IconData icon, Color color, VoidCallback onTap, {bool isEmergency = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: isEmergency ? Border.all(color: AppColors.riskRedBorder, width: 2) : Border.all(color: AppColors.gray200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: isEmergency ? AppColors.riskRedBg : color.withOpacity(0.1), shape: BoxShape.circle), child: Icon(icon, size: 32, color: color)),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: isEmergency ? AppColors.riskRed : AppColors.gray900)),
          ],
        ),
      ),
    );
  }
}
