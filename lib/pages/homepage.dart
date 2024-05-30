import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sakugaacaptors/pages/login.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.darken,
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3)
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(

              items: [
                ...List.generate(
                  3,
                      (index) => const MangaCard(
                    imageUrl: "",
                    title: '',
                    textSize: 0, desc: '',
                  ),
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                height: 450,
                viewportFraction: 0.8,
                initialPage: 0,

                enableInfiniteScroll: true,
                reverse: false,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Column(
              children: [
                const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                        child: Row(
                          children: [
                            Text('Mais lidos',textAlign: TextAlign.start,style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                        (index) => Container(
                      width: 100,
                      height: 160,
                      child: const Center(
                        child: MangaCard(imageUrl: '', title: 'titulo hype',textSize: 11,desc: '',textPadding: 3),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20,top: 8,bottom: 8),
                      child: Row(
                        children: [
                          Text('Mais lidos',textAlign: TextAlign.start,style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                            (index) => Container(
                          width: 100,
                          height: 160,
                          child: const Center(
                            child: MangaCard(imageUrl: '', title: 'titulo hype',textSize: 11,desc: '',textPadding: 3,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}