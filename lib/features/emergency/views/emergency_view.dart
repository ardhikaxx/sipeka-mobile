import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/emergency_controller.dart';
import '../../../core/theme/app_colors.dart';

class EmergencyView extends StatefulWidget {
  const EmergencyView({Key? key}) : super(key: key);
  @override
  _EmergencyViewState createState() => _EmergencyViewState();
}

class _EmergencyViewState extends State<EmergencyView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final EmergencyController emergencyController = Get.find<EmergencyController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppColors.riskRed.withOpacity(0.3 * _controller.value), blurRadius: 40 * _controller.value, spreadRadius: 20 * _controller.value)]),
                        child: child,
                      );
                    },
                    child: const Icon(Icons.warning_rounded, size: 120, color: AppColors.riskCritical),
                  ),
                  const SizedBox(height: 32),
                  const Text('KONDISI DARURAT?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.riskCritical, letterSpacing: 1.5)),
                  const SizedBox(height: 16),
                  const Text('Tekan tombol di bawah untuk segera mengirim sinyal SOS dan lokasi Anda ke Bidan & Puskesmas terdekat.', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: AppColors.gray700, height: 1.5)),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity, height: 60,
                    child: ElevatedButton(
                      onPressed: emergencyController.sendEmergencyReport,
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.riskCritical, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), elevation: 8),
                      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.sos, color: Colors.white), SizedBox(width: 10), Text('KIRIM LAPORAN DARURAT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2))]),
                    ),
                  ),
                ],
              ),
            ),
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
                          icon: const Icon(Icons.close_rounded, color: AppColors.riskCritical, size: 22),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Lapor Darurat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.riskCritical))),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: AppColors.riskCritical.withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.warning_amber_rounded, color: AppColors.riskCritical, size: 20),
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
