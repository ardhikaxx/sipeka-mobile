import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class LabResultView extends StatelessWidget {
  const LabResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          Positioned(
            top: -100, right: -50,
            child: Container(
              width: 250, height: 250,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColors.primary.withOpacity(0.1), Colors.transparent])),
            ),
          ),
          
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top + 100, bottom: 40),
            physics: const BouncingScrollPhysics(),
            children: [
              const Text('Dokumen Hasil Laboratorium', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 8),
              const Text('Riwayat lengkap hasil pemeriksaan lab Anda selama kehamilan.', style: TextStyle(fontSize: 15, color: AppColors.gray600, height: 1.5)),
              const SizedBox(height: 32),
              
              _buildDocumentCard(
                'Hasil Lab Trimester 3',
                '12 Ags 2026 • RSUD dr. Soebandi',
                Icons.picture_as_pdf_rounded,
                AppColors.riskRed,
              ),
              const SizedBox(height: 16),
              _buildDocumentCard(
                'Hasil Lab Trimester 2',
                '15 Mei 2026 • Puskesmas Kaliwates',
                Icons.picture_as_pdf_rounded,
                AppColors.primary,
              ),
              const SizedBox(height: 16),
              _buildDocumentCard(
                'Hasil Lab Awal (Trimester 1)',
                '10 Feb 2026 • Klinik Pratama',
                Icons.picture_as_pdf_rounded,
                AppColors.primary,
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
                      const Expanded(child: Text('Hasil Lab', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
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

  Widget _buildDocumentCard(String title, String subtitle, IconData icon, Color iconColor) {
    return GestureDetector(
      onTap: () {
        Get.snackbar('Mengunduh...', 'Fitur unduh dokumen PDF sedang dalam pengembangan', snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(20), borderRadius: 16);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 13, color: AppColors.gray500)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle),
              child: const Icon(Icons.download_rounded, color: AppColors.primary, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
