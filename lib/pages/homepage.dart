import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../assets/card.dart';

//defino statefull
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  //defino a estate
  _MyHomePageState createState() => _MyHomePageState();
}
 //incremento os estados
class _MyHomePageState extends State<MyHomePage> {
  int pagina = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              height: 300,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
                  (index) => Container(
                width: 100,
                height: 100,
                child: Center(
                  child: MangaCard(imageUrl: '', title: '',),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}