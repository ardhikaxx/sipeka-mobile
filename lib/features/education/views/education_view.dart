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
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, right: 0, child: Container(height: 220, decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, Color(0xFF0A585B)], begin: Alignment.topCenter, end: Alignment.bottomCenter)))),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      const Text('Pusat Edukasi', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.search, color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 120),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildFeaturedArticle(),
                      const SizedBox(height: 32),
                      const Text('Kategori', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategoryBadge('Trimester 1', AppColors.primary),
                          _buildCategoryBadge('Nutrisi', AppColors.secondary),
                          _buildCategoryBadge('Persalinan', AppColors.riskGreen),
                          _buildCategoryBadge('Semua', AppColors.gray500),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Text('Artikel Terbaru', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      const SizedBox(height: 16),
                      _buildArticleCard('Mengenali Gejala Preeklampsia', 'Pahami tanda bahaya seperti sakit kepala hebat dan pandangan kabur.', '12 Ags 2026', Icons.warning_rounded, AppColors.riskRed),
                      _buildArticleCard('Nutrisi Trimester Ketiga', 'Makanan bergizi untuk mengoptimalkan berat badan janin.', '05 Ags 2026', Icons.restaurant, AppColors.primaryLight),
                      _buildArticleCard('Persiapan Persalinan', 'Daftar barang yang perlu disiapkan di tas bersalin.', '01 Ags 2026', Icons.shopping_bag, AppColors.secondary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedArticle() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1531983412531-1f49a365ffed?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.riskRed, borderRadius: BorderRadius.circular(8)), child: const Text('PENTING', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
            const SizedBox(height: 12),
            const Text('Tanda Bahaya Kehamilan yang Harus Segera Diperiksakan', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1.3)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withOpacity(0.3))),
      child: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _buildArticleCard(String title, String desc, String date, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(16)), child: Icon(icon, size: 32, color: iconColor)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.gray900)),
                  const SizedBox(height: 6),
                  Text(desc, style: const TextStyle(fontSize: 13, color: AppColors.gray500, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 12),
                  Text(date, style: const TextStyle(fontSize: 11, color: AppColors.gray400, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
