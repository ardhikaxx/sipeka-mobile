import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class AppointmentDetailView extends StatelessWidget {
  const AppointmentDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          // Background Map Pattern (Placeholder)
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                image: DecorationImage(
                  image: AssetImage('assets/images/map_placeholder.png'), // Will fallback if missing
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(AppColors.primaryLight, BlendMode.screen),
                ),
              ),
              child: Stack(
                children: [
                  Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, AppColors.bgApp]))),
                  Center(
                    child: Container(
                      width: 60, height: 60,
                      decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4), boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10))]),
                      child: const Icon(Icons.location_on_rounded, color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top + 280, bottom: 40),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 24, offset: const Offset(0, 12))],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: const Text('KONSULTASI KANDUNGAN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ),
                    const SizedBox(height: 16),
                    const Text('Dr. Budi Santoso, Sp.OG', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                    const SizedBox(height: 4),
                    const Text('Dokter Kandungan (Obgyn)', style: TextStyle(fontSize: 14, color: AppColors.gray500)),
                    
                    const SizedBox(height: 24),
                    const Divider(height: 1),
                    const SizedBox(height: 24),
                    
                    Row(
                      children: [
                        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle), child: const Icon(Icons.calendar_month_rounded, color: AppColors.primary, size: 24)),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tanggal & Waktu', style: TextStyle(fontSize: 12, color: AppColors.gray500)),
                              SizedBox(height: 4),
                              Text('20 Ags 2026, 09:00 WIB', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle), child: const Icon(Icons.location_city_rounded, color: AppColors.primary, size: 24)),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lokasi', style: TextStyle(fontSize: 12, color: AppColors.gray500)),
                              SizedBox(height: 4),
                              Text('Puskesmas Kaliwates\nJl. Sultan Agung No.1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                    const Text('Catatan Tambahan:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                    const SizedBox(height: 8),
                    const Text('Harap datang 15 menit lebih awal dari jadwal untuk proses administrasi. Bawa buku KIA Anda.', style: TextStyle(fontSize: 14, color: AppColors.gray600, height: 1.5)),
                    
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              side: const BorderSide(color: AppColors.primary),
                            ),
                            child: const Text('Reschedule', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              elevation: 0,
                            ),
                            child: const Text('Navigasi Lokasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.primary, size: 22),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Detail Jadwal Periksa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
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
}
