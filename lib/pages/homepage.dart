import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../assets/card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//defino statefull
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  //defino a estate
  _MyHomePageState createState() => _MyHomePageState();
}
 //incremento os estados
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar:AppBar(
          forceMaterialTransparency:true,
          clipBehavior: Clip.antiAlias,
          actions: [IconButton(icon: const Icon(Icons.person),color: Colors.white, onPressed: () {})],),
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
                    textSize: 10,
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
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Column(
            children: [
              const Text('Recentes'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                      (index) => Container(
                    width: 100,
                    height: 100,
                    child: const Center(
                      child: MangaCard(imageUrl: '', title: 'asas',textSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}