import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final patientName = 'Ny. Siti Rahayu'.obs;
  final gestationalAge = '32 Minggu'.obs;
  final currentWeek = 32.obs;
  final hpl = '15 Okt 2026'.obs;

  final waterConsumed = 3.obs;
  final waterTarget = 8.obs;

  void addWater() {
    if (waterConsumed.value < waterTarget.value) {
      waterConsumed.value++;
    } else {
      Get.snackbar(
        'Hebat!', 
        'Target minum air Anda hari ini sudah tercapai!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xE610B981), // 90% opacity
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 16,
      );
    }
  }

  void removeWater() {
    if (waterConsumed.value > 0) {
      waterConsumed.value--;
    }
  }
}
