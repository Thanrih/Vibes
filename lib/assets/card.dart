import 'dart:ui';

import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String badge;
  final String desc;
  final double textPadding;
  final double textSize;

  const MangaCard({
    super.key,
    this.textPadding=0,
    required this.imageUrl,
    this.title='',
    this.textSize=0,
    this.badge = '',
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'pages/desc'); // Use route name string
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Image.network(
                imageUrl.isNotEmpty ? imageUrl : 'https://lermangas.me/wp-content/uploads/2024/02/nossa-alianca-secreta.jpg',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator(); // Exibe um indicador circular enquanto a imagem carrega
                },
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
