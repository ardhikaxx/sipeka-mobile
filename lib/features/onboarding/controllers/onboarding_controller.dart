import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Pantau Kehamilan Anda',
      'description': 'Lacak perkembangan janin dan kesehatan Anda setiap minggu dengan antarmuka yang sangat elegan dan mudah dipahami.',
      'icon': 'pregnant_woman',
    },
    {
      'title': 'Bidan Selalu Siaga',
      'description': 'Konsultasikan setiap keluhan atau pertanyaan Anda secara langsung dengan bidan melalui fitur chat pintar.',
      'icon': 'medical_services',
    },
    {
      'title': 'Rekam Medis Digital',
      'description': 'Semua data lab, tekanan darah, dan riwayat jadwal periksa tersimpan rapi dan aman di saku Anda.',
      'icon': 'folder_special',
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (currentPage.value == onboardingData.length - 1) {
      Get.offAllNamed(Routes.MAIN);
    } else {
      pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void skip() {
    Get.offAllNamed(Routes.MAIN);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
