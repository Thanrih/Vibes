import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../assets/manga_card.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    final List<String> urls = ['https://image.api.playstation.com/vulcan/ap/rnd/202008/0611/VdFDkKKhAXpyw5NLBgfQSaW9.jpg'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              ...List.generate(
                3,
                    (index) => Container(
                  child: MangaCard(
                    imageUrl: 'https://m.media-amazon.com/images/I/81sphDUj6aS._AC_UF1000,1000_QL80_.jpg',
                    title: 'Frieren',
                    subtitle: 'A maginha fofa',
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 300,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}