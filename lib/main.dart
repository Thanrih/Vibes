import 'package:flutter/material.dart';
import 'assets/navbar.dart';
import 'pages/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  await Supabase.initialize(
    url: 'https://xyewkeuvgrephjahsjds.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5ZXdrZXV2Z3JlcGhqYWhzamRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQxMzYyNTQsImV4cCI6MjAyOTcxMjI1NH0.nPl6lx6KEUKtScJGPBanQBui5MmZtLHtdYJbJRyY2Fo',
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
        title: 'Sakugaa Captors',
        home: MyHomePage(title: 'Sakugaa Captors')
    );
  }
}