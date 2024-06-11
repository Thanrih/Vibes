import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider_favorites.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final obraId = favorites[index];
          return ListTile(
            title: Text('Obra $obraId'), // Here you can fetch and display more details of the favorite obra
          );
        },
      ),
    );
  }
}
