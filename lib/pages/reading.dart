import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  late Future<List<String>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureImages = fetchImages();
  }

  Future<List<String>> fetchImages() async {
    final response = await Supabase.instance.client.storage.from('Pages').list(path: 'kaiju/1');

    // Map each file to its public URL
    final List<String> imageUrls = response.map((file) {
      final publicUrl = Supabase.instance.client.storage
          .from('Pages')
          .getPublicUrl('kaiju/1/${file.name}');

      if (publicUrl == null) {
        throw Exception('Failed to get public URL for ${file.name}');
      }

      return publicUrl;
    }).toList();

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Page'),
      ),
      body: FutureBuilder<List<String>>(
        future: _futureImages,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images found'));
          }

          final imageUrls = snapshot.data!;
          return ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];
              return ListTile(
                title: Image.network(imageUrl),
              );
            },
          );
        },
      ),
    );
  }
}
