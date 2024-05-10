import 'package:flutter/material.dart';
import 'package:sakugaacaptors/assets/my_button.dart';

class ObraDescPage extends StatelessWidget {
  const ObraDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MyButton(
              onTap: () => Navigator.pushNamed(context, 'pages/obra'), // Replace with target page
              buttonText: 'Ler',
              width: 200.0,
              height: 100.0,

            ),
          ),
        ],
      ),
    );
  }
}
