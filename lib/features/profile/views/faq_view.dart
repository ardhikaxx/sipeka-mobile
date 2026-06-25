import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';

class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'question': 'Bagaimana cara mengubah data profil?',
        'answer': 'Untuk saat ini, pengubahan data profil harus dilakukan melalui bidan atau petugas puskesmas agar data rekam medis tetap tervalidasi secara resmi.'
      },
      {
        'question': 'Apa yang harus dilakukan jika terjadi kondisi darurat?',
        'answer': 'Gunakan tombol darurat (SOS) berwarna merah di beranda untuk memanggil ambulans atau bidan terdekat yang telah didaftarkan pada sistem.'
      },
      {
        'question': 'Seberapa sering saya harus memeriksakan kandungan?',
        'answer': 'Standar minimal pemeriksaan kehamilan (ANC) adalah 6 kali selama masa kehamilan. 1 kali di trimester pertama, 2 kali di trimester kedua, dan 3 kali di trimester ketiga.'
      },
      {
        'question': 'Apakah data rekam medis saya aman?',
        'answer': 'Data rekam medis Anda dienkripsi dan hanya dapat diakses oleh Anda dan tenaga kesehatan (dokter/bidan) yang menangani Anda secara langsung.'
      },
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
              const Text('Bantuan & FAQ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 8),
              Text('Temukan jawaban untuk pertanyaan yang sering diajukan mengenai aplikasi SIPEKA.', style: TextStyle(fontSize: 15, color: AppColors.gray600, height: 1.5)),
              const SizedBox(height: 32),
              
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))],
                    ),
                    child: ExpansionTile(
                      shape: const Border(),
                      iconColor: AppColors.primary,
                      collapsedIconColor: AppColors.gray400,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      title: Text(faqs[index]['question']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      children: [
                        Text(faqs[index]['answer']!, style: const TextStyle(fontSize: 14, color: AppColors.gray600, height: 1.6)),
                      ],
                    ),
                  );
                },
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
                      const Expanded(child: Text('Pusat Bantuan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900))),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.help_outline_rounded, color: AppColors.primary, size: 20),
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
