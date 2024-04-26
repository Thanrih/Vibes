import 'package:flutter/material.dart';
import 'package:sakugaacaptors/assets/navbar.dart';
import '../assets/card.dart';

class ObraDescPage extends StatelessWidget {
  final String title;

  const ObraDescPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Column(
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0, onTap: (index) {}),
    );
  }
}