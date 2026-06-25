import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tip_detail_view.dart';
import '../../schedule/views/appointment_detail_view.dart';
import '../controllers/dashboard_controller.dart';
import '../../main_nav/controllers/main_nav_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widgets/risk_badge.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          // Elegant abstract top background
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: 320,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, Color(0xFF07484B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: -100, right: -100,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            top: 50, left: -50,
            child: Container(
              width: 150, height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),

          // Main Scrollable Content
          RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: Colors.white,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 90, // space for header
                bottom: 120, // space for floating bottom nav
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Digital Pregnancy Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildDigitalPregnancyCard(),
                  ),
                  const SizedBox(height: 24),
                  
                  // Main Menus
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.bgApp,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Layanan SIPEKA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMenuIcon('Data\nKesehatan', Icons.favorite, AppColors.secondary, () => Get.find<MainNavController>().changePage(1)),
                            _buildMenuIcon('Jadwal\nPeriksa', Icons.calendar_month, AppColors.primaryLight, () => Get.find<MainNavController>().changePage(2)),
                            _buildMenuIcon('Modul\nEdukasi', Icons.menu_book, AppColors.riskGreen, () => Get.find<MainNavController>().changePage(3)),
                            _buildMenuIcon('Lapor\nDarurat', Icons.warning_amber_rounded, AppColors.riskRed, () => Get.toNamed(Routes.EMERGENCY), isEmergency: true),
                          ],
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Next Appointment Ticket
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Jadwal Terdekat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                            GestureDetector(onTap: () => Get.find<MainNavController>().changePage(2), child: Text('Lihat Semua', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary))),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildNextAppointmentTicket(),
                        
                        const SizedBox(height: 16),
                        
                        // Tips Carousel
                        const Text('Tips Kehamilan Hari Ini', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                        const SizedBox(height: 16),
                        _buildTipsCarousel(),
                      ],
                    ),
                  ),
                ],
              ),
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
                          child: Icon(Icons.pregnant_woman_rounded, color: AppColors.primary, size: 20),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('SIPEKA', style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('Sistem Pemantauan Kehamilan', style: TextStyle(color: AppColors.gray500, fontSize: 10, fontWeight: FontWeight.w600)),
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

  Widget _buildDigitalPregnancyCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 12),
          )
        ],
      ),
      child: Column(
        children: [
          // Top Colored Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFE8F5F5), Color(0xFFF3FAF6)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Ibu Hamil', style: TextStyle(color: AppColors.gray500, fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Obx(() => Text(controller.patientName.value, style: const TextStyle(color: AppColors.gray900, fontSize: 20, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                const RiskBadge(level: RiskLevel.warning),
              ],
            ),
          ),
          // Bottom Stats Section
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => _buildStatItem('Usia Kehamilan', controller.gestationalAge.value, Icons.child_care_rounded)),
                Container(height: 40, width: 1, color: AppColors.gray200),
                Obx(() => _buildStatItem('Perkiraan Lahir', controller.hpl.value, Icons.calendar_today_rounded)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: AppColors.gray500, fontSize: 11)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: AppColors.gray900, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildMenuIcon(String title, IconData icon, Color color, VoidCallback onTap, {bool isEmergency = false}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              color: isEmergency ? color : color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isEmergency ? color : color.withOpacity(0.2)),
              boxShadow: isEmergency ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 8))] : [],
            ),
            child: Icon(icon, color: isEmergency ? Colors.white : color, size: 30),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.gray700, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildNextAppointmentTicket() {
    return GestureDetector(
      onTap: () => Get.to(() => const AppointmentDetailView()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10)),
          ],
          border: Border.all(color: AppColors.gray100),
        ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.primaryLight.withOpacity(0.2), shape: BoxShape.circle),
                  child: const Icon(Icons.medical_information_rounded, color: AppColors.primaryLight),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Pemeriksaan ANC', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: const Text('Bidan', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold))),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text('Bidan Sri Mulyani', style: TextStyle(fontSize: 13, color: AppColors.gray500)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded, size: 14, color: AppColors.gray400),
                          const SizedBox(width: 4),
                          const Text('Puskesmas Kaliwates', style: TextStyle(fontSize: 12, color: AppColors.gray500, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Dashed Divider
          Row(
            children: [
              SizedBox(height: 20, width: 10, child: DecoratedBox(decoration: BoxDecoration(color: AppColors.bgApp, borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))))),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate((constraints.constrainWidth() / 8).floor(), (index) => SizedBox(width: 4, height: 1.5, child: DecoratedBox(decoration: BoxDecoration(color: AppColors.gray200)))),
                    );
                  },
                ),
              ),
              SizedBox(height: 20, width: 10, child: DecoratedBox(decoration: BoxDecoration(color: AppColors.bgApp, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))))),
            ],
          ),
          
          // Bottom Time
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tanggal', style: TextStyle(fontSize: 11, color: AppColors.gray400)),
                    const SizedBox(height: 4),
                    const Text('20 Ags 2026', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Waktu', style: TextStyle(fontSize: 11, color: AppColors.gray400)),
                    const SizedBox(height: 4),
                    const Text('09:00 WIB', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => Get.to(() => const AppointmentDetailView()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 0,
                  ),
                  child: const Text('Detail'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsCarousel() {
    final List<Map<String, dynamic>> tips = [
      {
        'title': 'Olahraga Ringan',
        'subtitle': 'Jalan kaki 15 menit setiap pagi untuk sirkulasi darah.',
        'content': 'Olahraga ringan seperti jalan kaki selama 15-30 menit sangat direkomendasikan untuk ibu hamil. Ini membantu meningkatkan sirkulasi darah, mengurangi pembengkakan pada kaki, dan menjaga kebugaran tubuh menjelang persalinan. Pastikan untuk menggunakan sepatu yang nyaman dan berhenti jika merasa lelah atau pusing.',
        'image': 'assets/images/tips_olahraga.jpg',
        'color': const Color(0xFF3B82F6),
        'icon': Icons.directions_walk_rounded,
      },
      {
        'title': 'Kebutuhan Cairan',
        'subtitle': 'Pastikan minum 8-10 gelas air putih sehari.',
        'content': 'Selama kehamilan, kebutuhan cairan tubuh meningkat secara signifikan untuk mendukung pembentukan air ketuban, peningkatan volume darah, dan pertumbuhan janin. Kurang minum dapat menyebabkan dehidrasi, yang memicu kontraksi dini atau infeksi saluran kemih. Selalu siapkan botol air di dekat Anda dan minumlah secara berkala.',
        'image': 'assets/images/tips_minum.jpg',
        'color': const Color(0xFF10B981),
        'icon': Icons.water_drop_rounded,
      },
      {
        'title': 'Istirahat Cukup',
        'subtitle': 'Tidur 7-9 jam sehari dan posisikan tubuh miring ke kiri.',
        'content': 'Tidur yang cukup sangat penting bagi ibu hamil untuk mengembalikan energi. Posisi tidur terbaik adalah miring ke kiri, karena posisi ini mengoptimalkan aliran darah dan nutrisi ke plasenta serta janin. Gunakan bantal kehamilan atau letakkan bantal di antara kedua lutut untuk mengurangi tekanan pada punggung bawah.',
        'image': 'assets/images/tips_istirahat.jpg',
        'color': const Color(0xFF8B5CF6),
        'icon': Icons.bedtime_rounded,
      },
      {
        'title': 'Pemeriksaan Rutin',
        'subtitle': 'Jangan lewatkan jadwal kontrol kandungan ke dokter.',
        'content': 'Pemeriksaan Antenatal Care (ANC) secara rutin sangat vital untuk memantau kesehatan ibu dan perkembangan janin. Jangan ragu untuk bertanya kepada dokter mengenai keluhan sekecil apa pun yang Anda rasakan. Catat setiap pertanyaan Anda di rumah agar tidak lupa saat berkonsultasi.',
        'image': 'assets/images/tips_periksa.jpg',
        'color': const Color(0xFFF59E0B),
        'icon': Icons.medical_services_rounded,
      },
    ];

    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: tips.length,
        controller: PageController(viewportFraction: 0.92),
        itemBuilder: (context, index) {
          final tip = tips[index];
          return GestureDetector(
            onTap: () => Get.to(() => TipDetailView(tipData: tip)),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tip['image'] as String),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(color: (tip['color'] as Color).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: (tip['color'] as Color).withOpacity(0.8), shape: BoxShape.circle),
                  child: Icon(tip['icon'] as IconData, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tip['title'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 6),
                      Text(tip['subtitle'] as String, style: const TextStyle(fontSize: 13, color: Colors.white, height: 1.3), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(tip['icon'] as IconData, size: 60, color: Colors.white.withOpacity(0.2)),
              ],
            ),
            ),
          );
        },
      ),
    );
  }
}
