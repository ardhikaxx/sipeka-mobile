import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/fetal_detail_controller.dart';
import '../../../core/theme/app_colors.dart';

class FetalDetailView extends GetView<FetalDetailController> {
  const FetalDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          // Background Gradient
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, Color(0xFF07484B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Emoji Visualizer
                  Center(
                    child: Container(
                      width: 140, height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                      ),
                      child: Center(
                        child: Obx(() => Text(controller.fruitEmoji.value, style: const TextStyle(fontSize: 70))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Title
                  Obx(() => Text('Minggu ke-${controller.currentWeek.value}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white))),
                  const SizedBox(height: 8),
                  Obx(() => Text('Sebesar ${controller.fruitName.value}', style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.9)))),
                  const SizedBox(height: 32),
                  
                  // Content Cards
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 10))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Stats Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatColumn('Panjang', controller.length.value, Icons.straighten_rounded),
                            Container(height: 40, width: 1, color: AppColors.gray200),
                            _buildStatColumn('Berat', controller.weight.value, Icons.monitor_weight_rounded),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Divider(color: AppColors.gray200),
                        ),
                        
                        // Development Section
                        _buildSectionTitle('Perkembangan Janin', Icons.child_care_rounded),
                        const SizedBox(height: 12),
                        Obx(() => Text(controller.development.value, style: const TextStyle(fontSize: 14, color: AppColors.gray700, height: 1.6))),
                        
                        const SizedBox(height: 24),
                        
                        // Mother Symptoms Section
                        _buildSectionTitle('Yang Dirasakan Ibu', Icons.pregnant_woman_rounded),
                        const SizedBox(height: 12),
                        Obx(() => Text(controller.motherSymptoms.value, style: const TextStyle(fontSize: 14, color: AppColors.gray700, height: 1.6))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Floating Header
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
                        width: 40, height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryPale,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.primary, size: 20),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text('Detail Ukuran Janin', style: TextStyle(color: AppColors.gray900, fontSize: 16, fontWeight: FontWeight.bold)),
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

  Widget _buildStatColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.primaryPale,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.gray500, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, color: AppColors.gray900, fontWeight: FontWeight.w900)),
      ],
    );
  }
  
  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primaryLight.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primaryLight, size: 18),
        ),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
      ],
    );
  }
}
