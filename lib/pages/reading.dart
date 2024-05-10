import 'package:flutter/material.dart';


class ReadingPage extends StatelessWidget {

  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Reading'),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Image.network('https://cdn.hxmanga.com/file/majekayoo/solo-leveling/Vol.2-Chapter-142/1.jpg')),
        ],
      ),
    );

  }
}