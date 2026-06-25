import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/health_data_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/vital_card.dart';

class HealthDataView extends GetView<HealthDataController> {
  const HealthDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(title: const Text('Data Kesehatan Saya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: AppColors.primary),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.riskYellowBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.riskYellowBorder)),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.warning_amber, color: Color(0xFF92400E), size: 20)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Perhatian: Tekanan Darah Meningkat', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF92400E))), SizedBox(height: 4), Text('Tekanan darah mendekati batas hipertensi. Kurangi garam dan segera konsultasi pada kunjungan berikutnya.', style: TextStyle(fontSize: 13, color: Color(0xFF92400E)))])),
              ],
            ),
          ),
          const Text('Grafik & Vital Saat Ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 16),
          Obx(() => GridView.count(
            crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9,
            children: [
              VitalCard(title: 'Tekanan Darah', value: '\${controller.bpSistolik.value}/\${controller.bpDiastolik.value}', unit: 'mmHg', icon: Icons.monitor_heart, iconColor: AppColors.riskRed, isWarning: true, trendMessage: 'Naik dari 120/80'),
              VitalCard(title: 'Berat Badan', value: '\${controller.weight.value}', unit: 'kg', icon: Icons.monitor_weight, iconColor: AppColors.primaryLight, trendMessage: '+1.5kg dari lalu'),
              VitalCard(title: 'Detak Jantung', value: '\${controller.djj.value}', unit: 'dpm', icon: Icons.favorite, iconColor: AppColors.secondary),
              VitalCard(title: 'Tinggi Fundus', value: '\${controller.tfu.value}', unit: 'cm', icon: Icons.straighten, iconColor: AppColors.riskGreen),
            ],
          )),
          const SizedBox(height: 20),
          const Text('Hasil Lab Terakhir (12 Ags 2026)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.gray200)),
            child: Column(
              children: [
                _buildLabRow('Protein Urine', '+1', true),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Divider()),
                _buildLabRow('Hemoglobin (Hb)', '11.5 g/dL', false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: Divider()),
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
          Text(title, style: const TextStyle(color: AppColors.gray700, fontWeight: FontWeight.w500)),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: isWarning ? AppColors.riskYellowBg : AppColors.riskGreenBg, borderRadius: BorderRadius.circular(8)), child: Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isWarning ? const Color(0xFF92400E) : const Color(0xFF0D7A35))))
        ],
      ),
    );
  }
}
