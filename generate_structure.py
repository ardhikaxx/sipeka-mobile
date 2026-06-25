import os

base_dir = "lib"

dirs = [
    "app/routes",
    "core/theme",
    "data/models",
    "features/main_nav/controllers",
    "features/main_nav/views",
    "features/main_nav/bindings",
    "features/patient_dashboard/controllers",
    "features/patient_dashboard/views",
    "features/health_data/controllers",
    "features/health_data/views",
    "features/schedule/controllers",
    "features/schedule/views",
    "features/education/controllers",
    "features/education/views",
    "features/emergency/controllers",
    "features/emergency/views",
    "features/emergency/bindings",
    "shared/widgets",
]

for d in dirs:
    os.makedirs(os.path.join(base_dir, d), exist_ok=True)

files = {
    "app/routes/app_pages.dart": """import 'package:get/get.dart';
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
""",
    "app/routes/app_routes.dart": """abstract class Routes {
  static const MAIN = '/main';
  static const EMERGENCY = '/emergency';
}
""",
    "core/theme/app_colors.dart": """import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1A6B6B);
  static const Color primaryLight = Color(0xFF2A8F8F);
  static const Color primaryPale = Color(0xFFE8F5F5);
  
  static const Color secondary = Color(0xFFE84393);
  static const Color secondaryLight = Color(0xFFFDEEF6);
  
  static const Color accent = Color(0xFFF6A623);
  
  static const Color riskGreen = Color(0xFF1DB954);
  static const Color riskGreenBg = Color(0xFFE8F8EE);
  static const Color riskGreenBorder = Color(0xFFA3E4B8);
  
  static const Color riskYellow = Color(0xFFF59E0B);
  static const Color riskYellowBg = Color(0xFFFFFBEB);
  static const Color riskYellowBorder = Color(0xFFFDE68A);
  
  static const Color riskRed = Color(0xFFEF4444);
  static const Color riskRedBg = Color(0xFFFEF2F2);
  static const Color riskRedBorder = Color(0xFFFECACA);
  
  static const Color riskCritical = Color(0xFF7C0000);
  static const Color riskCriticalBg = Color(0xFFFFF0F0);
  static const Color riskCriticalBorder = Color(0xFFFF9090);

  static const Color gray50 = Color(0xFFF8FAFC);
  static const Color gray100 = Color(0xFFF1F5F9);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color gray300 = Color(0xFFCBD5E1);
  static const Color gray400 = Color(0xFF94A3B8);
  static const Color gray500 = Color(0xFF64748B);
  static const Color gray600 = Color(0xFF475569);
  static const Color gray700 = Color(0xFF334155);
  static const Color gray800 = Color(0xFF1E293B);
  static const Color gray900 = Color(0xFF0F172A);
  
  static const Color bgApp = Color(0xFFF0F4F8);
}
""",
    "shared/widgets/risk_badge.dart": """import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

enum RiskLevel { low, warning, high, critical }

class RiskBadge extends StatelessWidget {
  final RiskLevel level;

  const RiskBadge({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor; Color bgColor; Color borderColor; String label;

    switch (level) {
      case RiskLevel.low:
        textColor = const Color(0xFF0D7A35); bgColor = AppColors.riskGreenBg; borderColor = AppColors.riskGreenBorder; label = "Risiko Rendah"; break;
      case RiskLevel.warning:
        textColor = const Color(0xFF9A6202); bgColor = AppColors.riskYellowBg; borderColor = AppColors.riskYellowBorder; label = "Waspada"; break;
      case RiskLevel.high:
        textColor = const Color(0xFFC41212); bgColor = AppColors.riskRedBg; borderColor = AppColors.riskRedBorder; label = "Preeklampsia"; break;
      case RiskLevel.critical:
        textColor = AppColors.riskCritical; bgColor = AppColors.riskCriticalBg; borderColor = AppColors.riskCriticalBorder; label = "Eklampsia"; break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: borderColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 7, height: 7, decoration: BoxDecoration(color: textColor, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
""",
    "shared/widgets/vital_card.dart": """import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class VitalCard extends StatelessWidget {
  final String title; final String value; final String unit; final IconData icon; final Color iconColor; final bool isWarning; final String trendMessage;

  const VitalCard({
    Key? key, required this.title, required this.value, required this.unit, required this.icon, required this.iconColor, this.isWarning = false, this.trendMessage = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.gray200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 6, offset: const Offset(0, 3))]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 6),
              Text(title.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.gray500, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.gray900)),
              const SizedBox(width: 4),
              Text(unit, style: const TextStyle(fontSize: 12, color: AppColors.gray500)),
            ],
          ),
          if (trendMessage.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isWarning ? Icons.arrow_upward : Icons.arrow_downward, size: 14, color: isWarning ? AppColors.riskYellow : AppColors.riskGreen),
                const SizedBox(width: 4),
                Expanded(child: Text(trendMessage, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: isWarning ? const Color(0xFF92400E) : AppColors.gray500))),
              ],
            ),
          ]
        ],
      ),
    );
  }
}
""",
    "features/main_nav/bindings/main_nav_binding.dart": """import 'package:get/get.dart';
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
""",
    "features/main_nav/controllers/main_nav_controller.dart": """import 'package:get/get.dart';

class MainNavController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int index) { currentIndex.value = index; }
}
""",
    "features/main_nav/views/main_nav_view.dart": """import 'package:flutter/material.dart';
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
""",
    "features/patient_dashboard/controllers/dashboard_controller.dart": """import 'package:get/get.dart';

class DashboardController extends GetxController {
  final patientName = 'Ny. Siti Rahayu'.obs;
  final gestationalAge = '32 Minggu'.obs;
  final hpl = '15 Okt 2026'.obs;
}
""",
    "features/patient_dashboard/views/dashboard_view.dart": """import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text('Portal Pasien', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.notifications_outlined, color: Colors.white), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
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
""",
    "features/health_data/controllers/health_data_controller.dart": """import 'package:get/get.dart';

class HealthDataController extends GetxController {
  final bpSistolik = 135.obs;
  final bpDiastolik = 85.obs;
  final weight = 68.5.obs;
  final djj = 142.obs;
  final tfu = 30.obs;
}
""",
    "features/health_data/views/health_data_view.dart": """import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/health_data_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/vital_card.dart';

class HealthDataView extends GetView<HealthDataController> {
  const HealthDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(title: const Text('Data Kesehatan Saya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: AppColors.primary),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.riskYellowBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.riskYellowBorder)),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.warning_amber, color: Color(0xFF92400E), size: 20)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Perhatian: Tekanan Darah Meningkat', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF92400E))), SizedBox(height: 4), Text('Tekanan darah mendekati batas hipertensi. Kurangi garam dan segera konsultasi pada kunjungan berikutnya.', style: TextStyle(fontSize: 13, color: Color(0xFF92400E)))])),
              ],
            ),
          ),
          const Text('Grafik & Vital Saat Ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 16),
          Obx(() => GridView.count(
            crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9,
            children: [
              VitalCard(title: 'Tekanan Darah', value: '\${controller.bpSistolik.value}/\${controller.bpDiastolik.value}', unit: 'mmHg', icon: Icons.monitor_heart, iconColor: AppColors.riskRed, isWarning: true, trendMessage: 'Naik dari 120/80'),
              VitalCard(title: 'Berat Badan', value: '\${controller.weight.value}', unit: 'kg', icon: Icons.monitor_weight, iconColor: AppColors.primaryLight, trendMessage: '+1.5kg dari lalu'),
              VitalCard(title: 'Detak Jantung', value: '\${controller.djj.value}', unit: 'dpm', icon: Icons.favorite, iconColor: AppColors.secondary),
              VitalCard(title: 'Tinggi Fundus', value: '\${controller.tfu.value}', unit: 'cm', icon: Icons.straighten, iconColor: AppColors.riskGreen),
            ],
          )),
          const SizedBox(height: 20),
          const Text('Hasil Lab Terakhir (12 Ags 2026)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.gray200)),
            child: Column(
              children: [
                _buildLabRow('Protein Urine', '+1', true),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Divider()),
                _buildLabRow('Hemoglobin (Hb)', '11.5 g/dL', false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Divider()),
                _buildLabRow('Gula Darah (GDS)', '98 mg/dL', false),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildLabRow(String title, String value, bool isWarning) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: AppColors.gray700, fontWeight: FontWeight.w500)),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: isWarning ? AppColors.riskYellowBg : AppColors.riskGreenBg, borderRadius: BorderRadius.circular(8)), child: Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isWarning ? const Color(0xFF92400E) : const Color(0xFF0D7A35))))
        ],
      ),
    );
  }
}
""",
    "features/schedule/controllers/schedule_controller.dart": """import 'package:get/get.dart';

class ScheduleController extends GetxController {}
""",
    "features/schedule/views/schedule_view.dart": """import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/schedule_controller.dart';
import '../../../core/theme/app_colors.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(title: const Text('Jadwal Periksa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: AppColors.primary),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Akan Datang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 12),
          _buildScheduleCard('Pemeriksaan ANC Trimester 3', '20 Agustus 2026', '09:00 WIB', 'Puskesmas Kaliwates', 'Bidan Sri Mulyani', true),
          const SizedBox(height: 24),
          const Text('Riwayat Kunjungan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 12),
          _buildScheduleCard('USG Kehamilan 28 Minggu', '15 Juli 2026', '10:30 WIB', 'RSUD Dr. Soebandi', 'dr. Andi, Sp.OG', false),
          _buildScheduleCard('Pemeriksaan Rutin ANC', '10 Juni 2026', '08:00 WIB', 'Poskesdes Kaliwates', 'Bidan Sri Mulyani', false),
        ],
      ),
    );
  }
  Widget _buildScheduleCard(String title, String date, String time, String location, String doctor, bool isUpcoming) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isUpcoming ? AppColors.primaryLight : AppColors.gray200, width: isUpcoming ? 2 : 1), boxShadow: isUpcoming ? [BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))] : []),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
                if (isUpcoming) Container(margin: const EdgeInsets.only(left: 8), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.primaryPale, borderRadius: BorderRadius.circular(12)), child: const Text('Segera', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold)))
              ],
            ),
            const SizedBox(height: 16),
            Row(children: [const Icon(Icons.calendar_today, size: 14, color: AppColors.gray500), const SizedBox(width: 8), Text(date, style: const TextStyle(color: AppColors.gray700, fontSize: 13, fontWeight: FontWeight.w500)), const SizedBox(width: 16), const Icon(Icons.access_time, size: 14, color: AppColors.gray500), const SizedBox(width: 8), Text(time, style: const TextStyle(color: AppColors.gray700, fontSize: 13, fontWeight: FontWeight.w500))]),
            const SizedBox(height: 10),
            Row(children: [const Icon(Icons.location_on, size: 14, color: AppColors.gray500), const SizedBox(width: 8), Text(location, style: const TextStyle(color: AppColors.gray700, fontSize: 13))]),
            const SizedBox(height: 10),
            Row(children: [const Icon(Icons.person, size: 14, color: AppColors.gray500), const SizedBox(width: 8), Text(doctor, style: const TextStyle(color: AppColors.gray700, fontSize: 13))]),
          ],
        ),
      ),
    );
  }
}
""",
    "features/education/controllers/education_controller.dart": """import 'package:get/get.dart';

class EducationController extends GetxController {}
""",
    "features/education/views/education_view.dart": """import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/education_controller.dart';
import '../../../core/theme/app_colors.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(title: const Text('Modul Edukasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: AppColors.primary),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Direkomendasikan untuk Anda', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 16),
          _buildEduCard('Mengenali Gejala Preeklampsia', 'Pahami tanda bahaya seperti sakit kepala hebat dan pandangan kabur.', Icons.warning_rounded, AppColors.riskRed),
          _buildEduCard('Nutrisi Trimester Ketiga', 'Makanan bergizi untuk mengoptimalkan berat badan janin.', Icons.restaurant, AppColors.primaryLight),
          _buildEduCard('Persiapan Persalinan', 'Daftar barang yang perlu disiapkan di tas bersalin.', Icons.shopping_bag, AppColors.secondary),
          _buildEduCard('Senam Hamil Dasar', 'Gerakan ringan meredakan nyeri punggung.', Icons.accessibility_new, AppColors.riskGreen),
        ],
      ),
    );
  }
  Widget _buildEduCard(String title, String desc, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.gray200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4))]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16), onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, size: 28, color: iconColor)),
                const SizedBox(width: 16),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.gray900)), const SizedBox(height: 6), Text(desc, style: const TextStyle(fontSize: 13, color: AppColors.gray500, height: 1.4))])),
                const SizedBox(width: 12),
                const Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.only(top: 10.0), child: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.gray400))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
""",
    "features/emergency/bindings/emergency_binding.dart": """import 'package:get/get.dart';
import '../controllers/emergency_controller.dart';

class EmergencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyController>(() => EmergencyController());
  }
}
""",
    "features/emergency/controllers/emergency_controller.dart": """import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class EmergencyController extends GetxController {
  void sendEmergencyReport() {
    Get.back(); // close emergency screen
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(children: const [Icon(Icons.check_circle, color: AppColors.riskGreen, size: 28), SizedBox(width: 10), Text('Laporan Terkirim')]),
        content: const Text('Pesan darurat dan lokasi Anda telah dikirim. Tim medis Puskesmas akan segera menghubungi Anda dalam waktu kurang dari 5 menit.\\n\\nTetap tenang dan atur napas Anda.', style: TextStyle(height: 1.5)),
        actions: [
          ElevatedButton(onPressed: () => Get.back(), style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text('Mengerti', style: TextStyle(color: Colors.white))),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
""",
    "features/emergency/views/emergency_view.dart": """import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/emergency_controller.dart';
import '../../../core/theme/app_colors.dart';

class EmergencyView extends StatefulWidget {
  const EmergencyView({Key? key}) : super(key: key);
  @override
  _EmergencyViewState createState() => _EmergencyViewState();
}

class _EmergencyViewState extends State<EmergencyView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final EmergencyController emergencyController = Get.find<EmergencyController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lapor Darurat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.riskCritical, iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back()),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppColors.riskRed.withOpacity(0.3 * _controller.value), blurRadius: 40 * _controller.value, spreadRadius: 20 * _controller.value)]),
                    child: child,
                  );
                },
                child: const Icon(Icons.warning_rounded, size: 120, color: AppColors.riskCritical),
              ),
              const SizedBox(height: 32),
              const Text('KONDISI DARURAT?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.riskCritical, letterSpacing: 1.5)),
              const SizedBox(height: 16),
              const Text('Tekan tombol di bawah untuk segera mengirim sinyal SOS dan lokasi Anda ke Bidan & Puskesmas terdekat.', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: AppColors.gray700, height: 1.5)),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity, height: 60,
                child: ElevatedButton(
                  onPressed: emergencyController.sendEmergencyReport,
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.riskCritical, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 8),
                  child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.sos, color: Colors.white), SizedBox(width: 10), Text('KIRIM LAPORAN DARURAT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2))]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
""",
    "main.dart": """import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/app_colors.dart';

void main() {
  runApp(const SipekaApp());
}

class SipekaApp extends StatelessWidget {
  const SipekaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SIPEKA Ibu Hamil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.secondary,
          primary: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.bgApp,
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
"""
}

for filepath, content in files.items():
    with open(os.path.join(base_dir, filepath), 'w') as f:
        f.write(content)

print("Scaffolding complete!")
