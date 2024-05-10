import 'package:flutter/material.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading'),
      ),
      body: SingleChildScrollView( // Wrap the content with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                'https://cdn.hxmanga.com/file/majekayoo/solo-leveling/Vol.2-Chapter-142/1.jpg',
                fit: BoxFit.fill, // Adjust image size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
