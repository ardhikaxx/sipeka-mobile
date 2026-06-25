import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/schedule_controller.dart';
import '../../../core/theme/app_colors.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        children: [
          Positioned(
            top: -150, right: -50,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColors.primary.withOpacity(0.15), Colors.transparent])),
            ),
          ),
          Positioned(top: 0, left: 0, right: 0, child: Container(height: 220, decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, Color(0xFF0A585B)], begin: Alignment.topCenter, end: Alignment.bottomCenter)))),
          
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top + 90, bottom: 120),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))]),
                child: Obx(() {
                  final focused = controller.focusedDate.value;
                  final selected = controller.selectedDate.value;
                  return TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1), lastDay: DateTime.utc(2030, 12, 31), focusedDay: focused,
                    selectedDayPredicate: (day) => isSameDay(selected, day),
                    onDaySelected: (selectedDay, focusedDay) { controller.selectedDate.value = selectedDay; controller.focusedDate.value = focusedDay; },
                    calendarStyle: const CalendarStyle(todayDecoration: BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle), selectedDecoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                    headerStyle: const HeaderStyle(formatButtonVisible: false, titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  );
                }),
              ),
              const SizedBox(height: 32),
              const Text('Jadwal Mendatang', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 16),
              _buildScheduleCard('Pemeriksaan ANC Trimester 3', '20 Agustus 2026', '09:00 WIB', 'Puskesmas Kaliwates', 'Bidan Sri Mulyani', true),
              const SizedBox(height: 24),
              const Text('Riwayat Kunjungan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.gray900)),
              const SizedBox(height: 16),
              _buildScheduleCard('USG Kehamilan 28 Minggu', '15 Juli 2026', '10:30 WIB', 'RSUD Dr. Soebandi', 'dr. Andi, Sp.OG', false),
              _buildScheduleCard('Pemeriksaan Rutin ANC', '10 Juni 2026', '08:00 WIB', 'Poskesdes Kaliwates', 'Bidan Sri Mulyani', false),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.primaryPale,
                          child: Icon(Icons.calendar_month_rounded, color: AppColors.primary, size: 20),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Jadwal Periksa', style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('Kalender kunjungan Anda', style: TextStyle(color: AppColors.gray500, fontSize: 10, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.bgApp,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.gray200),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(Icons.add_rounded, color: AppColors.gray700, size: 16),
                        ),
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

  Widget _buildScheduleCard(String title, String date, String time, String location, String doctor, bool isUpcoming) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: isUpcoming ? Border.all(color: AppColors.primary, width: 1.5) : Border.all(color: AppColors.gray200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(color: isUpcoming ? AppColors.primary.withOpacity(0.1) : AppColors.gray50, borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [Icon(Icons.calendar_month, color: isUpcoming ? AppColors.primary : AppColors.gray500, size: 18), const SizedBox(width: 8), Text(date, style: TextStyle(color: isUpcoming ? AppColors.primary : AppColors.gray700, fontWeight: FontWeight.bold))]),
                Row(children: [Icon(Icons.access_time_filled, color: isUpcoming ? AppColors.secondary : AppColors.gray500, size: 18), const SizedBox(width: 8), Text(time, style: TextStyle(color: isUpcoming ? AppColors.secondary : AppColors.gray700, fontWeight: FontWeight.bold))]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                const SizedBox(height: 16),
                Row(children: [Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(color: AppColors.bgApp, shape: BoxShape.circle), child: const Icon(Icons.location_on, color: AppColors.primary, size: 16)), const SizedBox(width: 12), Expanded(child: Text(location, style: const TextStyle(color: AppColors.gray700, fontSize: 14)))]),
                const SizedBox(height: 12),
                Row(children: [Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(color: AppColors.bgApp, shape: BoxShape.circle), child: const Icon(Icons.medical_services, color: AppColors.primary, size: 16)), const SizedBox(width: 12), Expanded(child: Text(doctor, style: const TextStyle(color: AppColors.gray700, fontSize: 14)))]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
