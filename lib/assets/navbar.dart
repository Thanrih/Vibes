import 'package:flutter/material.dart';
import 'package:sakugaacaptors/pages/homepage.dart';
import 'package:sakugaacaptors/pages/history.dart';
import 'package:sakugaacaptors/pages/saved.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int pagina = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Colors.black,
      backgroundColor: Colors.white,
            destinations: const <Widget>[
            NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Início'),
            NavigationDestination(
            icon: Icon(Icons.save),
            label: 'Salvos',
            ),
            NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Histórico',)
            ],
      selectedIndex: pagina,
      onDestinationSelected: (int index) {
        setState(() {
          pagina = index;
        });
      },
    );
  }
}