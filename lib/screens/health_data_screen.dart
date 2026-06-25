import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../components/vital_card.dart';

class HealthDataScreen extends StatelessWidget {
  const HealthDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PekaColors.bgApp,
      appBar: AppBar(
        title: const Text('Data Kesehatan Saya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PekaColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Alert Warning (from design-peka.md)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PekaColors.riskYellowBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: PekaColors.riskYellowBorder),
            ),
            margin: const EdgeInsets.bottom(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.warning_amber, color: Color(0xFF92400E), size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Perhatian: Tekanan Darah Meningkat', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF92400E))),
                      SizedBox(height: 4),
                      Text('Tekanan darah mendekati batas hipertensi. Kurangi garam dan segera konsultasi pada kunjungan berikutnya.', style: TextStyle(fontSize: 13, color: Color(0xFF92400E))),
                    ],
                  ),
                )
              ],
            ),
          ),

          const Text('Grafik & Vital Saat Ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900)),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
            children: const [
              VitalCard(
                title: 'Tekanan Darah', 
                value: '135/85', 
                unit: 'mmHg', 
                icon: Icons.monitor_heart, 
                iconColor: PekaColors.riskRed,
                isWarning: true,
                trendMessage: 'Naik dari 120/80',
              ),
              VitalCard(
                title: 'Berat Badan', 
                value: '68.5', 
                unit: 'kg', 
                icon: Icons.monitor_weight, 
                iconColor: PekaColors.primaryLight,
                trendMessage: '+1.5kg dari lalu',
              ),
              VitalCard(
                title: 'Detak Jantung', 
                value: '142', 
                unit: 'dpm', 
                icon: Icons.favorite, 
                iconColor: PekaColors.secondary,
              ),
              VitalCard(
                title: 'Tinggi Fundus', 
                value: '30', 
                unit: 'cm', 
                icon: Icons.straighten, 
                iconColor: PekaColors.riskGreen,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Hasil Lab Terakhir (12 Ags 2026)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: PekaColors.gray200),
            ),
            child: Column(
              children: [
                _buildLabRow('Protein Urine', '+1', true),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Divider(),
                ),
                _buildLabRow('Hemoglobin (Hb)', '11.5 g/dL', false),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Divider(),
                ),
                _buildLabRow('Gula Darah (GDS)', '98 mg/dL', false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLabRow(String title, String value, bool isWarning) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: PekaColors.gray700, fontWeight: FontWeight.w500)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isWarning ? PekaColors.riskYellowBg : PekaColors.riskGreenBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: isWarning ? const Color(0xFF92400E) : const Color(0xFF0D7A35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
