import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../../core/theme/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register controller if not already registered
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          // Background Gradient
          Positioned(
            top: -150, right: -50,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColors.primary.withOpacity(0.15), Colors.transparent])),
            ),
          ),
          
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top + 90, bottom: 120),
            physics: const BouncingScrollPhysics(),
            children: [
              // Profile Header Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primary, Color(0xFF0A585B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
                      ),
                      child: const Icon(Icons.person_rounded, size: 40, color: AppColors.primary),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Text(controller.name.value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))),
                          const SizedBox(height: 4),
                          Obx(() => Text('${controller.age.value} • Usia Kandungan: ${controller.gestationalAge.value}', style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.9)))),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                            child: Obx(() => Text('HPL: ${controller.hpl.value}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              const Text('Rekam Medis Dasar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))]),
                child: Column(
                  children: [
                    Obx(() => _buildInfoRow(Icons.bloodtype, 'Golongan Darah', controller.bloodType.value, AppColors.riskRed)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1)),
                    Obx(() => _buildInfoRow(Icons.height, 'Tinggi Badan', controller.height.value, AppColors.primaryLight)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1)),
                    Obx(() => _buildInfoRow(Icons.coronavirus_rounded, 'Alergi Obat/Makanan', controller.allergies.value, AppColors.secondary)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1)),
                    Obx(() => _buildInfoRow(Icons.medical_information_rounded, 'Riwayat Penyakit', controller.medicalHistory.value, AppColors.riskGreen)),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              
              const Text('Pengaturan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle), child: const Icon(Icons.notifications_active_rounded, color: AppColors.primary, size: 20)),
                        const SizedBox(width: 16),
                        const Expanded(child: Text('Notifikasi Pengingat', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.gray900))),
                        Obx(() => Switch(value: controller.notificationsEnabled.value, onChanged: controller.toggleNotifications, activeColor: AppColors.primary)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 1)),
                    _buildSettingsAction(Icons.language_rounded, 'Bahasa (Language)'),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 1)),
                    _buildSettingsAction(Icons.help_outline_rounded, 'Bantuan & FAQ'),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 1)),
                    _buildSettingsAction(Icons.logout_rounded, 'Keluar Akun', isDestructive: true),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8))],
                  ),
                  child: Row(
                    children: [
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle), child: const Icon(Icons.person_rounded, color: AppColors.primary, size: 20)),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Akun & Rekam Medis', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
                      IconButton(icon: const Icon(Icons.edit_rounded, color: AppColors.primary, size: 22), onPressed: () {}),
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

  Widget _buildInfoRow(IconData icon, String label, String value, Color iconColor) {
    return Row(
      children: [
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 20)),
        const SizedBox(width: 16),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 14, color: AppColors.gray500))),
        Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.gray900)),
      ],
    );
  }

  Widget _buildSettingsAction(IconData icon, String label, {bool isDestructive = false}) {
    final color = isDestructive ? AppColors.riskRed : AppColors.gray900;
    final iconColor = isDestructive ? AppColors.riskRed : AppColors.primary;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 20)),
            const SizedBox(width: 16),
            Expanded(child: Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: color))),
            Icon(Icons.chevron_right_rounded, color: AppColors.gray400),
          ],
        ),
      ),
    );
  }
}
