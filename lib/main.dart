import 'package:flutter/material.dart';
import 'package:sakugaacaptors/pages/history.dart';
import 'package:sakugaacaptors/pages/homepage.dart';
import 'package:sakugaacaptors/pages/obradesc.dart';
import 'package:sakugaacaptors/pages/saved.dart';
import 'package:sakugaacaptors/pages/settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sakugaacaptors/pages/reading.dart';

void main() async {
  //Estou fazendo a conexão com o supabase por aqui
  await Supabase.initialize(
    url: 'https://xyewkeuvgrephjahsjds.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5ZXdrZXV2Z3JlcGhqYWhzamRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQxMzYyNTQsImV4cCI6MjAyOTcxMjI1NH0.nPl6lx6KEUKtScJGPBanQBui5MmZtLHtdYJbJRyY2Fo',
  );

  runApp(const MyApp());
}
//classe principal do app
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  //cria o estado do app
  _MyAppState createState() => _MyAppState();
}
//classe que contem o estado do app
class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  //lista de páginas mapeadas pela navbar
  final List<Widget> _pages = [
    const MyHomePage(),
    const HistoryPage(),
    const SavedPage(),
    const ConfigPage()
  ];

//altera o estado da navbar quando um item for selecionado
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakugaa Captors',
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3 theme
      ),
      home: Scaffold(//cria a navbar
        body: _pages[_currentIndex],

        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle:MaterialStateProperty.all(
              const TextStyle(color: Colors.white),
            )),
          child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: _onItemTapped,
              indicatorColor: Colors.white,
              backgroundColor: Colors.black,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',

                ),
                NavigationDestination(
                  icon: Icon(Icons.history_edu_outlined),
                  label: 'Histórico',
                ),
                NavigationDestination(
                  icon: Icon(Icons.save),
                  label: 'Salvos',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: 'Configurações',
                ),
              ],
            ),
        ),
      ),
      routes: {
        'pages/home': (context) => const MyHomePage(),
        'pages/history': (context) => const HistoryPage(),
        'pages/saved': (context) => const SavedPage(),
        'pages/config': (context) => const ConfigPage(),
        'pages/desc': (context) => const ObraDescPage(),
        'pages/obra': (context) => const ReadingPage(),
      }
    );
  }
}