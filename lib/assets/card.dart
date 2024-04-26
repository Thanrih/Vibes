import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MangaCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String badge;

  const MangaCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle = '',
    this.badge = '',
  });

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final data = supabase.from('table_name').select('*');

    return Card(
      child: Column(

        children: [
          Image.network(
            imageUrl.isNotEmpty ? imageUrl : 'https://cdna.artstation.com/p/assets/images/images/067/169/074/original/jonathan-rodrigues-animacao.gif?1694705871',
            fit: BoxFit.fill
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.isNotEmpty? title : 'Frieren',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle.isNotEmpty ? subtitle : 'A epic adventure',
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
          ),
        ],
      ),
    );
  }
}