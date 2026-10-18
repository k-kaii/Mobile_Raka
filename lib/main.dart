
 import 'package:flutter/material.dart';
import 'LayarBMI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      home: LayarBMI(),
    );
  }
}
