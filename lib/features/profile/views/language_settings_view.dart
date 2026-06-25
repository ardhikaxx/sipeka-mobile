import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../../core/theme/app_colors.dart';

class LanguageSettingsView extends StatelessWidget {
  const LanguageSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    
    final List<Map<String, String>> languages = [
      {'name': 'Bahasa Indonesia', 'code': 'ID'},
      {'name': 'English (US)', 'code': 'EN'},
      {'name': 'Basa Sunda', 'code': 'SU'},
      {'name': 'Basa Jawa', 'code': 'JV'},
    ];

    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          // Background Elements
          Positioned(
            top: -100, right: -100,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColors.primary.withOpacity(0.1), Colors.transparent])),
            ),
          ),
          
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top + 100, bottom: 40),
            physics: const BouncingScrollPhysics(),
            children: [
              const Text('Pilih Bahasa', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 8),
              Text('Pilih bahasa yang Anda inginkan untuk antarmuka aplikasi SIPEKA.', style: TextStyle(fontSize: 15, color: AppColors.gray600, height: 1.5)),
              const SizedBox(height: 32),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 12))],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: languages.length,
                  separatorBuilder: (context, index) => const Divider(height: 1, indent: 24, endIndent: 24),
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return Obx(() {
                      final isSelected = controller.selectedLanguage.value == lang['name'];
                      return InkWell(
                        onTap: () {
                          controller.changeLanguage(lang['name']!);
                          Get.snackbar('Berhasil', 'Bahasa diubah ke ${lang["name"]}', 
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColors.primary,
                            colorText: Colors.white,
                            margin: const EdgeInsets.all(20),
                            borderRadius: 16
                          );
                        },
                        borderRadius: BorderRadius.vertical(
                          top: index == 0 ? const Radius.circular(24) : Radius.zero,
                          bottom: index == languages.length - 1 ? const Radius.circular(24) : Radius.zero,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 40, height: 40,
                                decoration: BoxDecoration(color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.gray100, shape: BoxShape.circle),
                                child: Center(child: Text(lang['code']!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isSelected ? AppColors.primary : AppColors.gray500))),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(lang['name']!, style: TextStyle(fontSize: 16, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? AppColors.primary : AppColors.gray900)),
                              ),
                              if (isSelected)
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                  child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                                ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
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
                      const Expanded(child: Text('Bahasa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.language_rounded, color: AppColors.primary, size: 20),
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
}
