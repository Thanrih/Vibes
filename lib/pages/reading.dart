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
  }

  Future<List<String>> fetchImages(String id) async {
    final response = await Supabase.instance.client
        .from('Pages')
        .select('page')
        .eq('id', id)
        .single();

    final List<dynamic> pageUrls = response['page'];
    return pageUrls.cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    final String id = (ModalRoute.of(context)?.settings.arguments).toString();

    // Initialize the future in the build method
    _futureImages = fetchImages(id);

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
          return Scrollbar(
            child: ListView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                final imageUrl = imageUrls[index];
                return ListTile(
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  title: Image.network(imageUrl),
                );
              },
            ),
          );
        },
      ),
    );
  }
}