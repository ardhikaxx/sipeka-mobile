import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top + 90, bottom: 20),
            physics: const BouncingScrollPhysics(),
            children: [
              _buildNotificationCard(
                'Jadwal Periksa Mendatang',
                'Halo Bu Siti, jangan lupa besok ada jadwal konsultasi rutin di Puskesmas Kaliwates jam 09:00 WIB.',
                '2 jam yang lalu',
                Icons.calendar_month_rounded,
                AppColors.primary,
                true,
              ),
              const SizedBox(height: 12),
              _buildNotificationCard(
                'Peringatan Kesehatan',
                'Tekanan darah Anda minggu ini sedikit meningkat. Perbanyak istirahat dan kurangi konsumsi garam.',
                'Kemarin',
                Icons.warning_amber_rounded,
                AppColors.riskRed,
                true,
              ),
              const SizedBox(height: 12),
              _buildNotificationCard(
                'Artikel Baru SIPEKA',
                'Baca tips terbaru: "Makanan Bergizi untuk Trimester 2" sekarang tersedia di modul edukasi.',
                '20 Jun 2026',
                Icons.menu_book_rounded,
                AppColors.riskGreen,
                false,
              ),
              const SizedBox(height: 12),
              _buildNotificationCard(
                'Selamat Datang!',
                'Terima kasih telah menggunakan SIPEKA. Sistem informasi pemantauan kesehatan ibu hamil siap mendampingi Anda.',
                '1 Jun 2026',
                Icons.celebration_rounded,
                AppColors.secondary,
                false,
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
                      const Expanded(child: Text('Notifikasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
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

  Widget _buildNotificationCard(String title, String message, String time, IconData icon, Color color, bool isUnread) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isUnread ? Colors.white : AppColors.gray100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isUnread ? color.withOpacity(0.3) : AppColors.gray200),
        boxShadow: isUnread ? [BoxShadow(color: color.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))] : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: isUnread ? color.withOpacity(0.1) : AppColors.gray200, shape: BoxShape.circle),
            child: Icon(icon, color: isUnread ? color : AppColors.gray500, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: TextStyle(fontSize: 15, fontWeight: isUnread ? FontWeight.bold : FontWeight.w600, color: AppColors.gray900))),
                    if (isUnread) Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.riskRed, shape: BoxShape.circle)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(message, style: const TextStyle(fontSize: 13, color: AppColors.gray600, height: 1.4)),
                const SizedBox(height: 12),
                Text(time, style: const TextStyle(fontSize: 11, color: AppColors.gray400, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
