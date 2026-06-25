import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PekaColors.bgApp,
      appBar: AppBar(
        title: const Text('Jadwal Periksa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: PekaColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Akan Datang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900)),
          const SizedBox(height: 12),
          _buildScheduleCard('Pemeriksaan ANC Trimester 3', '20 Agustus 2026', '09:00 WIB', 'Puskesmas Kaliwates', 'Bidan Sri Mulyani', true),
          
          const SizedBox(height: 24),
          const Text('Riwayat Kunjungan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900)),
          const SizedBox(height: 12),
          _buildScheduleCard('USG Kehamilan 28 Minggu', '15 Juli 2026', '10:30 WIB', 'RSUD Dr. Soebandi', 'dr. Andi, Sp.OG', false),
          _buildScheduleCard('Pemeriksaan Rutin ANC', '10 Juni 2026', '08:00 WIB', 'Poskesdes Kaliwates', 'Bidan Sri Mulyani', false),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String title, String date, String time, String location, String doctor, bool isUpcoming) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isUpcoming ? PekaColors.primaryLight : PekaColors.gray200, width: isUpcoming ? 2 : 1),
        boxShadow: isUpcoming ? [BoxShadow(color: PekaColors.primary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))] : [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900))),
                if (isUpcoming) 
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: PekaColors.primaryPale, borderRadius: BorderRadius.circular(12)),
                    child: const Text('Segera', style: TextStyle(color: PekaColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
                  )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: PekaColors.gray500),
                const SizedBox(width: 8),
                Text(date, style: const TextStyle(color: PekaColors.gray700, fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(width: 16),
                const Icon(Icons.access_time, size: 14, color: PekaColors.gray500),
                const SizedBox(width: 8),
                Text(time, style: const TextStyle(color: PekaColors.gray700, fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: PekaColors.gray500),
                const SizedBox(width: 8),
                Text(location, style: const TextStyle(color: PekaColors.gray700, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.person, size: 14, color: PekaColors.gray500),
                const SizedBox(width: 8),
                Text(doctor, style: const TextStyle(color: PekaColors.gray700, fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
