import 'package:flutter/material.dart';
import 'NameCard.dart';

void main() {
  runApp(const MyApp());           
}

class MyApp extends StatelessWidget {   
  const MyApp({super.key});             
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kartu Nama Digital',
      home: NameCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}