import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class ArticleDetailView extends StatelessWidget {
  final String title;
  final String imagePath;
  final String category;
  final Color categoryColor;

  const ArticleDetailView({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.category,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: false,
                automaticallyImplyLeading: false,
                backgroundColor: categoryColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                  // Check if imagePath is an asset or network or placeholder
                  imagePath.startsWith('assets') 
                      ? Image.asset(imagePath, fit: BoxFit.cover)
                      : Container(color: categoryColor.withOpacity(0.5)),
                  
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -32),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.bgApp,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: categoryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Text(category, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: categoryColor)),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.gray900, height: 1.3),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const CircleAvatar(radius: 16, backgroundColor: AppColors.gray200, child: Icon(Icons.person, color: AppColors.gray400, size: 20)),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ditulis oleh Tim Medis SIPEKA', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                            Text('Dipublikasikan hari ini', style: TextStyle(fontSize: 12, color: AppColors.gray500)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Ini adalah contoh isi artikel edukasi lengkap. Dalam versi rilis penuh, teks ini akan diambil dari server (database) yang berisi artikel terverifikasi dokter kandungan. Untuk saat ini, Anda dapat melihat desain premium yang kami sajikan untuk memastikan kenyamanan membaca (readability).',
                      style: TextStyle(fontSize: 16, color: AppColors.gray700, height: 1.8),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Kami menggunakan ukuran huruf dan spasi (line-height) yang optimal agar mata Anda tidak mudah lelah ketika membaca layar smartphone dalam waktu lama.',
                      style: TextStyle(fontSize: 16, color: AppColors.gray700, height: 1.8),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
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
                      const Expanded(child: Text('Artikel Edukasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: categoryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                        child: Text(category, style: TextStyle(color: categoryColor, fontSize: 12, fontWeight: FontWeight.bold)),
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
