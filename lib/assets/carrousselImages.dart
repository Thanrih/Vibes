
import 'package:flutter/material.dart';

class CarousselImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String badge;
  final String desc;
  final double textPadding;
  final double textSize;
  final int id;

  const CarousselImage ({
    super.key,
    required this.id,
    this.textPadding = 0,
    required this.imageUrl,
    this.title = '',
    this.textSize = 0,
    this.badge = '',
    required this.desc,
  });

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
            // Use BoxFit.cover for image to fill container
            Expanded(
              child: Image.network(
                imageUrl.isNotEmpty ? imageUrl : 'https://lermangas.me/wp-content/uploads/2024/02/nossa-alianca-secreta.jpg',
                fit: BoxFit.cover, // Ensure image fills container
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
          ],
        ),
      ),
    );
  }
}
