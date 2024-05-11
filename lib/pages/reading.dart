import 'package:flutter/material.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading'),
      ),
      body: SingleChildScrollView( // Wrap the content with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://lercdn1.azmanga.net/manga_65c68219dbf02/capitulo-01/3.jpg',
              fit: BoxFit.fill,loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator()); // Exibe um indicador circular enquanto a imagem carrega
              },),

            Image.network('https://lercdn1.azmanga.net/manga_65c68219dbf02/capitulo-01/4.jpg',
              fit: BoxFit.fill,loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator()); // Exibe um indicador circular enquanto a imagem carrega
              },),
            Image.network('https://lercdn1.azmanga.net/manga_65c68219dbf02/capitulo-01/5.jpg',
              fit: BoxFit.fill,loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator()); // Exibe um indicador circular enquanto a imagem carrega
              },),
            Image.network('https://lercdn1.azmanga.net/manga_65c68219dbf02/capitulo-01/6.jpg',
              fit: BoxFit.fill,loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator()); // Exibe um indicador circular enquanto a imagem carrega
              },),
            Image.network('https://lercdn1.azmanga.net/manga_65c68219dbf02/capitulo-01/7.jpg',
                fit: BoxFit.fill,loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return const CircularProgressIndicator(); // Exibe um indicador circular enquanto a imagem carrega
    },),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black,
       unselectedIconTheme: const IconThemeData(color: Colors.white),
       selectedIconTheme: const IconThemeData(color: Colors.white),
       landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
       showSelectedLabels: false,
       showUnselectedLabels: false,
       items: const [
         BottomNavigationBarItem(icon: Icon(Icons.arrow_back),label: ''),
         BottomNavigationBarItem(icon: Icon(Icons.arrow_forward),label: ''),
       ],

      ),
    );
  }
}
