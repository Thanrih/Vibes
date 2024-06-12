import 'package:flutter/material.dart';


class ConfigPage extends StatelessWidget {

  const ConfigPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.transparent,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_2_rounded, color: Colors.white),
            ],
          )
        ],
      ),
    );

  }
}