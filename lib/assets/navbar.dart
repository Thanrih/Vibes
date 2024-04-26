import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      //labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    destinations: const [
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
      selectedIndex: currentIndex,
      onDestinationSelected: (int index){},
    );
  }
}