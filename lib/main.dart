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
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        scaffoldBackgroundColor: Colors.grey[50],
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
