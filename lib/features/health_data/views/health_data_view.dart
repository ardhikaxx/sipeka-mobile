import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/health_data_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/vital_card.dart';

class HealthDataView extends GetView<HealthDataController> {
  const HealthDataView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.primary, Color(0xFF0A585B)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      const Text('Data Kesehatan', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.history, color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 120),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildAlertBanner(),
                      const SizedBox(height: 24),
                      const Text('Grafik Tekanan Darah', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      const SizedBox(height: 16),
                      _buildChart(),
                      const SizedBox(height: 24),
                      const Text('Vital Saat Ini', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9,
                        children: [
                          Obx(() => VitalCard(title: 'Tekanan Darah', value: '${controller.bpSistolik.value}/${controller.bpDiastolik.value}', unit: 'mmHg', icon: Icons.monitor_heart, iconColor: AppColors.riskRed, isWarning: true, trendMessage: 'Naik dari 120/80')),
                          Obx(() => VitalCard(title: 'Berat Badan', value: '${controller.weight.value}', unit: 'kg', icon: Icons.monitor_weight, iconColor: AppColors.primaryLight, trendMessage: '+1.5kg dari lalu')),
                          Obx(() => VitalCard(title: 'Detak Jantung', value: '${controller.djj.value}', unit: 'dpm', icon: Icons.favorite, iconColor: AppColors.secondary)),
                          Obx(() => VitalCard(title: 'Tinggi Fundus', value: '${controller.tfu.value}', unit: 'cm', icon: Icons.straighten, iconColor: AppColors.riskGreen)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text('Hasil Lab Terakhir (12 Ags 2026)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))]),
                        child: Column(
                          children: [
                            _buildLabRow('Protein Urine', '+1', true, Icons.water_drop),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider()),
                            _buildLabRow('Hemoglobin (Hb)', '11.5 g/dL', false, Icons.bloodtype),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider()),
                            _buildLabRow('Gula Darah (GDS)', '98 mg/dL', false, Icons.science),
                          ],
                        ),
                      )
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

  Widget _buildAlertBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.riskYellowBg, shape: BoxShape.circle), child: const Icon(Icons.warning_amber_rounded, color: AppColors.riskYellow, size: 28)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Perhatian: Tekanan Darah Meningkat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.gray900)), SizedBox(height: 6), Text('Tekanan darah mendekati batas hipertensi. Kurangi konsumsi garam.', style: TextStyle(fontSize: 13, color: AppColors.gray500, height: 1.5))])),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 8))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildLegend(AppColors.riskRed, 'Sistolik'),
              const SizedBox(width: 16),
              _buildLegend(AppColors.primary, 'Diastolik'),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 20, getDrawingHorizontalLine: (value) => FlLine(color: AppColors.gray200, strokeWidth: 1)),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(color: AppColors.gray500, fontWeight: FontWeight.bold, fontSize: 12);
                        return Padding(padding: const EdgeInsets.only(top: 8.0), child: Text('Bln ${value.toInt()}', style: style));
                      },
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 1, maxX: 5, minY: 60, maxY: 160,
                lineBarsData: [
                  LineChartBarData(
                    spots: controller.sistolikSpots,
                    isCurved: true, color: AppColors.riskRed, barWidth: 4, isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: true, color: AppColors.riskRed.withOpacity(0.1)),
                  ),
                  LineChartBarData(
                    spots: controller.diastolikSpots,
                    isCurved: true, color: AppColors.primary, barWidth: 4, isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: true, color: AppColors.primary.withOpacity(0.1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(children: [Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)), const SizedBox(width: 6), Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.gray700))]);
  }

  Widget _buildLabRow(String title, String value, bool isWarning, IconData icon) {
    return Row(
      children: [
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.bgApp, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: AppColors.primary, size: 20)),
        const SizedBox(width: 16),
        Expanded(child: Text(title, style: const TextStyle(color: AppColors.gray900, fontWeight: FontWeight.w600, fontSize: 15))),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: isWarning ? AppColors.riskYellowBg : AppColors.riskGreenBg, borderRadius: BorderRadius.circular(10)), child: Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isWarning ? const Color(0xFF92400E) : const Color(0xFF0D7A35))))
      ],
    );
  }
}
