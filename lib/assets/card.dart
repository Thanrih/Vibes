import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String badge;
  final String desc;
  final double textPadding;
  final double textSize;
  final int id;

  const MangaCard({
    Key? key,
    required this.id,
    this.textPadding = 0,
    required this.imageUrl,
    this.title = '',
    this.textSize = 0,
    this.badge = '',
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'pages/desc', arguments: id);
        // Use route name string
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            Flexible(
              child: Image.network(
                imageUrl.isNotEmpty
                    ? imageUrl
                    : 'https://lermangas.me/wp-content/uploads/2024/02/nossa-alianca-secreta.jpg',
                fit: BoxFit.cover,
                height: 500,
              ),
            ),
            Text(
              title,
                style: TextStyle(fontSize: textSize, color: Colors.white),
                maxLines: 1, // Limita a uma linha

                overflow: TextOverflow.ellipsis, // Adiciona "..." se o texto for muito longo
              ),
          ],
        ),
      ),
    );
  }
}
