import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Jadwal Periksa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildScheduleCard('Pemeriksaan Rutin ANC', '10 Juli 2026', '09:00 - 10:00', 'Puskesmas Melati', true),
          _buildScheduleCard('USG Trimester 3', '15 Agustus 2026', '10:00 - 11:30', 'Klinik Sehat Bunda', false),
          _buildScheduleCard('Konsultasi Gizi', '10 September 2026', '13:00 - 14:00', 'Puskesmas Melati', false),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String title, String date, String time, String location, bool isUpcoming) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: isUpcoming ? Colors.pinkAccent : Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                if (isUpcoming) 
                  Chip(label: Text('Mendatang', style: TextStyle(color: Colors.white, fontSize: 10)), backgroundColor: Colors.pinkAccent)
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(date),
                SizedBox(width: 16),
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(time),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
