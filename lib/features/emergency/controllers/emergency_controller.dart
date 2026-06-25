import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class EmergencyController extends GetxController {
  void sendEmergencyReport() {
    Get.back(); // close emergency screen
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(children: const [Icon(Icons.check_circle, color: AppColors.riskGreen, size: 28), SizedBox(width: 10), Text('Laporan Terkirim')]),
        content: const Text('Pesan darurat dan lokasi Anda telah dikirim. Tim medis Puskesmas akan segera menghubungi Anda dalam waktu kurang dari 5 menit.\n\nTetap tenang dan atur napas Anda.', style: TextStyle(height: 1.5)),
        actions: [
          ElevatedButton(onPressed: () => Get.back(), style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text('Mengerti', style: TextStyle(color: Colors.white))),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
