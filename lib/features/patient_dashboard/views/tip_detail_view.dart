import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';

class TipDetailView extends StatelessWidget {
  final Map<String, dynamic> tipData;

  const TipDetailView({Key? key, required this.tipData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = tipData['color'] as Color;

    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                pinned: false,
                stretch: true,
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.zoomBackground],
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        tipData['image'] as String,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.8)],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 24,
                        right: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(color: primaryColor.withOpacity(0.9), shape: BoxShape.circle, boxShadow: [BoxShadow(color: primaryColor.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 8))]),
                              child: Icon(tipData['icon'] as IconData, color: Colors.white, size: 36),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              tipData['title'] as String,
                              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1, letterSpacing: -0.5),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              tipData['subtitle'] as String,
                              style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9), height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -24),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    decoration: const BoxDecoration(
                      color: AppColors.bgApp,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 12))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.format_quote_rounded, color: primaryColor.withOpacity(0.3), size: 40),
                                  const SizedBox(width: 12),
                                  Expanded(child: Text('Catatan Penting Hari Ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor))),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                tipData['content'] as String,
                                style: const TextStyle(fontSize: 16, color: AppColors.gray700, height: 1.8, letterSpacing: 0.2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 8,
                              shadowColor: primaryColor.withOpacity(0.5),
                            ),
                            child: const Text('Kembali ke Beranda', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 40),
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
                      const Expanded(child: Text('Detail Tips Kehamilan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), shape: BoxShape.circle),
                        child: Icon(tipData['icon'] as IconData, color: primaryColor, size: 20),
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
