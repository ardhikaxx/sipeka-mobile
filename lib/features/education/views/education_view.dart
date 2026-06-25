import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/education_controller.dart';
import '../../../core/theme/app_colors.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(title: const Text('Modul Edukasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: AppColors.primary),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Direkomendasikan untuk Anda', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 16),
          _buildEduCard('Mengenali Gejala Preeklampsia', 'Pahami tanda bahaya seperti sakit kepala hebat dan pandangan kabur.', Icons.warning_rounded, AppColors.riskRed),
          _buildEduCard('Nutrisi Trimester Ketiga', 'Makanan bergizi untuk mengoptimalkan berat badan janin.', Icons.restaurant, AppColors.primaryLight),
          _buildEduCard('Persiapan Persalinan', 'Daftar barang yang perlu disiapkan di tas bersalin.', Icons.shopping_bag, AppColors.secondary),
          _buildEduCard('Senam Hamil Dasar', 'Gerakan ringan meredakan nyeri punggung.', Icons.accessibility_new, AppColors.riskGreen),
        ],
      ),
    );
  }
  Widget _buildEduCard(String title, String desc, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.gray200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4))]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16), onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, size: 28, color: iconColor)),
                const SizedBox(width: 16),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.gray900)), const SizedBox(height: 6), Text(desc, style: const TextStyle(fontSize: 13, color: AppColors.gray500, height: 1.4))])),
                const SizedBox(width: 12),
                const Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.only(top: 10.0), child: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.gray400))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
