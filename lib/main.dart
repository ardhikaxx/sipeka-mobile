import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SipekaApp());
}

class SipekaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPEKA Ibu Hamil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE84393), // peka-secondary: Magenta rose (identitas maternal)
          primary: Color(0xFF1A6B6B), // peka-primary: Teal gelap
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
