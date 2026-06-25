import 'package:flutter/material.dart';
import '../theme/colors.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lapor Darurat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PekaColors.riskCritical,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: PekaColors.riskRed.withOpacity(0.3 * _controller.value),
                          blurRadius: 40 * _controller.value,
                          spreadRadius: 20 * _controller.value,
                        )
                      ]
                    ),
                    child: child,
                  );
                },
                child: const Icon(Icons.warning_rounded, size: 120, color: PekaColors.riskCritical),
              ),
              const SizedBox(height: 32),
              const Text(
                'KONDISI DARURAT?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: PekaColors.riskCritical, letterSpacing: 1.5),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tekan tombol di bawah untuk segera mengirim sinyal SOS dan lokasi Anda ke Bidan & Puskesmas terdekat.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: PekaColors.gray700, height: 1.5),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _showEmergencyDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PekaColors.riskCritical,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 8,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sos, color: Colors.white),
                      SizedBox(width: 10),
                      Text('KIRIM LAPORAN DARURAT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: PekaColors.riskGreen, size: 28),
              SizedBox(width: 10),
              Text('Laporan Terkirim'),
            ],
          ),
          content: const Text('Pesan darurat dan lokasi Anda telah dikirim. Tim medis Puskesmas akan segera menghubungi Anda dalam waktu kurang dari 5 menit.\n\nTetap tenang dan atur napas Anda.', style: TextStyle(height: 1.5)),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: PekaColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: const Text('Mengerti', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
