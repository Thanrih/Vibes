import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../assets/card.dart';

class HistoryPage extends StatelessWidget {
  final int pagina = 2;

  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('history'),
      ),
      body: const Column(
        children: [
          Row(
            children: [
              Card(
              )
            ],
          )
        ],
      ),
    );

  }
}