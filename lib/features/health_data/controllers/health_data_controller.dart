import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class HealthDataController extends GetxController {
  final bpSistolik = 135.obs;
  final bpDiastolik = 85.obs;
  final weight = 68.5.obs;
  final djj = 142.obs;
  final tfu = 30.obs;

  // Data for chart
  final List<FlSpot> sistolikSpots = [
    const FlSpot(1, 120),
    const FlSpot(2, 125),
    const FlSpot(3, 122),
    const FlSpot(4, 130),
    const FlSpot(5, 135),
  ];

  final List<FlSpot> diastolikSpots = [
    const FlSpot(1, 80),
    const FlSpot(2, 82),
    const FlSpot(3, 80),
    const FlSpot(4, 85),
    const FlSpot(5, 85),
  ];
}
