import 'package:flutter/material.dart';
import '../theme/colors.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PekaColors.bgApp,
      appBar: AppBar(
        title: const Text('Modul Edukasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PekaColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Direkomendasikan untuk Anda', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900)),
          const SizedBox(height: 16),
          _buildEduCard('Mengenali Gejala Preeklampsia', 'Pahami tanda bahaya seperti sakit kepala hebat dan pandangan kabur pada trimester 3.', Icons.warning_rounded, PekaColors.riskRed),
          _buildEduCard('Nutrisi Trimester Ketiga', 'Makanan bergizi untuk mengoptimalkan berat badan janin menjelang kelahiran.', Icons.restaurant, PekaColors.primaryLight),
          _buildEduCard('Persiapan Persalinan', 'Daftar barang yang perlu disiapkan di dalam tas bersalin Anda.', Icons.shopping_bag, PekaColors.secondary),
          _buildEduCard('Senam Hamil Dasar', 'Gerakan ringan untuk meredakan nyeri punggung dan melatih otot panggul.', Icons.accessibility_new, PekaColors.riskGreen),
        ],
      ),
    );
  }

  Widget _buildEduCard(String title, String desc, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: PekaColors.gray200),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 28, color: iconColor),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: PekaColors.gray900)),
                      const SizedBox(height: 6),
                      Text(desc, style: const TextStyle(fontSize: 13, color: PekaColors.gray500, height: 1.4)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.arrow_forward_ios, size: 14, color: PekaColors.gray400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
