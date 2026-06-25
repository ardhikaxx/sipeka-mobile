import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../components/risk_badge.dart';
import 'health_data_screen.dart';
import 'schedule_screen.dart';
import 'education_screen.dart';
import 'emergency_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PekaColors.bgApp,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PekaColors.primary,
        title: const Text('Portal Pasien', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
              decoration: const BoxDecoration(
                color: PekaColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Selamat Datang,', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 5),
                  const Text('Ny. Siti Rahayu', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Usia Kehamilan', style: TextStyle(color: PekaColors.gray500, fontSize: 12)),
                            SizedBox(height: 4),
                            Text('32 Minggu', style: TextStyle(color: PekaColors.gray900, fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 12),
                            Text('Perkiraan Lahir', style: TextStyle(color: PekaColors.gray500, fontSize: 12)),
                            SizedBox(height: 4),
                            Text('15 Okt 2026', style: TextStyle(color: PekaColors.gray900, fontSize: 14, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const RiskBadge(level: RiskLevel.warning),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: PekaColors.secondaryLight,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.pregnant_woman, color: PekaColors.secondary, size: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Layanan SIPEKA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PekaColors.gray900)),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.05,
                    children: [
                      _buildMenuCard(context, 'Data Kesehatan', Icons.favorite, PekaColors.secondary, const HealthDataScreen()),
                      _buildMenuCard(context, 'Jadwal Periksa', Icons.calendar_month, PekaColors.primaryLight, const ScheduleScreen()),
                      _buildMenuCard(context, 'Modul Edukasi', Icons.menu_book, PekaColors.riskGreen, const EducationScreen()),
                      _buildMenuCard(context, 'Lapor Darurat', Icons.warning_amber_rounded, PekaColors.riskRed, const EmergencyScreen(), isEmergency: true),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget screen, {bool isEmergency = false}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isEmergency ? Border.all(color: PekaColors.riskRedBorder, width: 2) : Border.all(color: PekaColors.gray200),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEmergency ? PekaColors.riskRedBg : color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title, 
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontSize: 13, 
                fontWeight: FontWeight.bold, 
                color: isEmergency ? PekaColors.riskRed : PekaColors.gray900
              )
            ),
          ],
        ),
      ),
    );
  }
}
