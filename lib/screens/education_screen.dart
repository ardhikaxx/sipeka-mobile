import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Modul Edukasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildEduCard('Nutrisi Penting Selama Kehamilan', 'Mengenal makanan bergizi untuk pertumbuhan janin yang optimal.', Icons.restaurant),
          _buildEduCard('Tanda-tanda Bahaya Kehamilan', 'Kenali gejala-gejala yang membutuhkan penanganan medis segera.', Icons.warning_amber),
          _buildEduCard('Senam Hamil', 'Panduan gerakan ringan untuk menjaga kebugaran ibu hamil.', Icons.accessibility_new),
          _buildEduCard('Persiapan Persalinan', 'Hal-hal yang perlu disiapkan menjelang hari H kelahiran.', Icons.shopping_bag),
        ],
      ),
    );
  }

  Widget _buildEduCard(String title, String desc, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Colors.pinkAccent),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(desc),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Dummy tap
        },
      ),
    );
  }
}
