import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';

class SymptomLogView extends StatelessWidget {
  const SymptomLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_rounded, color: AppColors.gray900), onPressed: () => Get.back()),
        title: const Text('Log Keluhan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))]),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle), child: const Icon(Icons.note_alt_rounded, color: Colors.white, size: 32)),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Catat Keluhan Anda', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 4),
                      Text('Bidan akan memantau keluhan yang Anda catat.', style: TextStyle(fontSize: 13, color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text('Riwayat Keluhan Terakhir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 16),
          _buildSymptomCard('Mual di pagi hari', 'Skala Nyeri: Ringan', '24 Jun 2026', AppColors.riskYellow),
          const SizedBox(height: 12),
          _buildSymptomCard('Pusing ringan', 'Skala Nyeri: Sedang', '20 Jun 2026', AppColors.riskYellow),
          const SizedBox(height: 12),
          _buildSymptomCard('Kram perut bawah', 'Skala Nyeri: Berat', '15 Jun 2026', AppColors.riskRed),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.snackbar('Fitur', 'Catat keluhan baru sedang dalam pengembangan', snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.primary, colorText: Colors.white, margin: const EdgeInsets.all(20), borderRadius: 16);
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text('Catat Baru', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSymptomCard(String symptom, String scale, String date, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.gray100), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5))]),
      child: Row(
        children: [
          Container(width: 4, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symptom, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                const SizedBox(height: 4),
                Text(scale, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Text(date, style: const TextStyle(fontSize: 12, color: AppColors.gray500, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
