import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kkaii Mobile'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Halo, nama saya Raka',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown), 
            ),
            const Text('Gini we da belajar'),
          ],
        ),
      ),
    );
  }
}