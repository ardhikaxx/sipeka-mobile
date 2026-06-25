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
                expandedHeight: 380,
                pinned: false,
                automaticallyImplyLeading: false,
                backgroundColor: categoryColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Image
                      imagePath.startsWith('assets') 
                          ? Image.asset(imagePath, fit: BoxFit.cover)
                          : Container(color: categoryColor.withOpacity(0.5)),
                      
                      // Gradients for smooth transition
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ],
                            stops: const [0.0, 0.2, 0.6, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.bgApp,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Small handle indicator
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 20),
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Badges row
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: categoryColor.withOpacity(0.1), 
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Text(category, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: categoryColor)),
                                  ),
                                  const SizedBox(width: 12),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_rounded, size: 14, color: AppColors.gray500),
                                      const SizedBox(width: 4),
                                      const Text('5 menit baca', style: TextStyle(fontSize: 12, color: AppColors.gray600, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              
                              // Title
                              Text(
                                title,
                                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.gray900, height: 1.3, letterSpacing: -0.5),
                              ),
                              const SizedBox(height: 24),
                              
                              // Author Card
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.gray200),
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 22, 
                                      backgroundColor: AppColors.primaryLight, 
                                      child: Icon(Icons.medical_services_rounded, color: AppColors.primary, size: 24)
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('dr. Spesialis Kandungan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                                          Text('Ditinjau oleh Tim Medis SIPEKA', style: TextStyle(fontSize: 12, color: AppColors.gray500)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: AppColors.riskGreen.withOpacity(0.1), shape: BoxShape.circle),
                                      child: const Icon(Icons.verified_rounded, color: AppColors.riskGreen, size: 18),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              
                              // Highlight / Quote Box
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPale,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(color: AppColors.primary.withOpacity(0.2)),
                                    right: BorderSide(color: AppColors.primary.withOpacity(0.2)),
                                    bottom: BorderSide(color: AppColors.primary.withOpacity(0.2)),
                                    left: const BorderSide(color: AppColors.primary, width: 4),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.lightbulb_rounded, color: AppColors.primary, size: 24),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Penting: Artikel ini disusun berdasarkan panduan medis terkini untuk memastikan kesehatan ibu dan janin selama masa kehamilan.',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.primary, height: 1.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Content
                              const Text(
                                'Ini adalah contoh isi artikel edukasi lengkap. Dalam versi rilis penuh, teks ini akan diambil secara dinamis dari database terpusat yang berisi artikel-artikel yang telah diverifikasi secara medis.',
                                style: TextStyle(fontSize: 16, color: AppColors.gray800, height: 1.8),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Setiap paragraf dirancang dengan ukuran huruf dan spasi (line-height) yang optimal agar mata Anda tidak mudah lelah ketika membaca layar smartphone dalam waktu lama. Kami memprioritaskan kenyamanan (readability) ibu hamil.',
                                style: TextStyle(fontSize: 16, color: AppColors.gray800, height: 1.8),
                              ),
                              const SizedBox(height: 24),
                              
                              // Bullet points
                              const Text('Tips Utama:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                              const SizedBox(height: 12),
                              _buildBulletPoint('Konsumsi makanan bergizi seimbang.'),
                              _buildBulletPoint('Rutin memeriksakan kandungan sesuai jadwal.'),
                              _buildBulletPoint('Istirahat yang cukup dan kelola stres.'),
                              
                              const SizedBox(height: 120), // Space for bottom action bar
                            ],
                          ),
                        ),
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
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle),
                        child: const Icon(Icons.ios_share_rounded, color: AppColors.gray700, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Bottom Action Bar
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: MediaQuery.of(context).padding.bottom + 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_outlined, color: AppColors.primary),
                      label: const Text('Bermanfaat', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPale,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.gray100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(16),
                      icon: const Icon(Icons.bookmark_border_rounded, color: AppColors.gray700),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 8, height: 8,
            decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          ),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16, color: AppColors.gray800, height: 1.5))),
        ],
      ),
    );
  }
}
