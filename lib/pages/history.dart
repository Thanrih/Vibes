import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sakugaacaptors/assets/navbar.dart';
import '../assets/card.dart';

class HistoryPage extends StatelessWidget {
  final String title;

  const HistoryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0, onTap: (index) {}),
    );
  }
}