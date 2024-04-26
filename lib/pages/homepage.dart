import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sakugaacaptors/assets/navbar.dart';
import '../assets/card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pagina = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              ...List.generate(
                3,
                    (index) => Container(
                  child: const MangaCard(
                    imageUrl: "",
                    title: '',
                    subtitle: '',
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              height: 300,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}