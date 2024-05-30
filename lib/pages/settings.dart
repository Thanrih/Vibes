import 'package:flutter/material.dart';


class ConfigPage extends StatelessWidget {

  const ConfigPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Configurações'),
      backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(color: Colors.white),
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