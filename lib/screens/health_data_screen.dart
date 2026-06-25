import 'package:flutter/material.dart';

class HealthDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Data Kesehatan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildDataTile('Tekanan Darah', '120/80 mmHg', Icons.monitor_heart, Colors.red),
          _buildDataTile('Berat Badan', '65 kg', Icons.monitor_weight, Colors.blue),
          _buildDataTile('Tinggi Fundus', '22 cm', Icons.straighten, Colors.green),
          _buildDataTile('Detak Jantung Janin', '140 dpm', Icons.favorite, Colors.pink),
          _buildDataTile('Keluhan Terakhir', 'Mual pagi hari', Icons.note, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildDataTile(String title, String value, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
