import 'package:get/get.dart';

class ProfileController extends GetxController {
  final name = 'Siti Aisyah'.obs;
  final age = '28 Tahun'.obs;
  final gestationalAge = '24 Minggu'.obs;
  final hpl = '15 Nov 2026'.obs;
  
  final bloodType = 'O+'.obs;
  final height = '158 cm'.obs;
  final allergies = 'Tidak ada'.obs;
  final medicalHistory = 'Asma ringan'.obs;
  
  final notificationsEnabled = true.obs;
  final selectedLanguage = 'Bahasa Indonesia'.obs;
  
  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }

  void changeLanguage(String lang) {
    selectedLanguage.value = lang;
  }
}
