import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String badge;
  final int textSize;

  const MangaCard({
    super.key,
    required this.imageUrl,
    this.title='',
    required this.textSize,
    this.subtitle = '',
    this.badge = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'pages/desc'); // Use route name string
      },
      child: Column(
        children: [
          Image.network(
            imageUrl.isNotEmpty ? imageUrl : 'https://imgsrv.crunchyroll.com/cdn-cgi/image/format=auto,fit=contain,width=1200,height=675,quality=85/catalog/crunchyroll/4305090653ee4239dd0d797f1a4a6bdf.jpe',
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.isNotEmpty ? title : '',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: textSize.toDouble(), // Convert to double for fontSize
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle.isNotEmpty ? subtitle : '',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                  ),
                ),
                if (badge.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
