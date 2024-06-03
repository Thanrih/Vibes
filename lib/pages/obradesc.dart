import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakugaacaptors/assets/my_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class ObraDescPage extends StatefulWidget {
  const ObraDescPage({super.key});

  @override
  State<ObraDescPage> createState() => _ObraDescPageState();
}

class _ObraDescPageState extends State<ObraDescPage> {
  late Future<Map<String, dynamic>?> _future;

  @override
  void initState() {
    super.initState();
    // The id will be initialized in the build method
  }

  Future<Map<String, dynamic>?> _fetchImageUrl(String id) async {
    final response = await supabase
        .from('Obras')
        .select('*')
        .eq('id', id)
        .single();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final String id = (ModalRoute.of(context)?.settings.arguments as int).toString();

    // Initialize the future in the build method
    _future = _fetchImageUrl(id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found'));
          }

          final imageUrl = snapshot.data?['ImageUrl'];
          final obraName = snapshot.data?['Name'];
          final obraDesc = snapshot.data?['DescOb'];
          final obraGenres = snapshot.data?['genres'];

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.fromSize(size: const Size.fromHeight(60)),
                if (imageUrl != null)
                  Card(
                    child: Image.network(
                      imageUrl,

                      width: 260,
                    ),
                  )
                else
                  const Text('Image URL not found', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      obraName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Itim',
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      snapshot.data?['author'],
                      style: const TextStyle(color: Colors.grey, fontFamily: 'Itim',height: 1.5),
                    ),
                    const SizedBox(height: 12.0),
                    if (obraGenres!= null)
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10.0,
                      children: [
                        for (final genre in obraGenres)
                          Chip(
                            label: Text(genre),
                          ),
                      ],
                    ),

                    const Center(
                      child: Divider(
                        color: Colors.white,
                        indent: 100,
                        endIndent: 100,
                      ),
                    ),

                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        width: 400.0,
                        height: 150,

                        alignment: Alignment.center,
                        child: Text(
                          obraDesc,
                          maxLines: 10,
                          style: const TextStyle(color: Colors.white, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Center(
                      child: Divider(
                        color: Colors.white,
                        indent: 100,
                        endIndent: 100,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),

                const Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    Icon(CupertinoIcons.book_fill, color: Colors.white, size: 30.0,),
                    Icon(CupertinoIcons.heart, color: Colors.white,size: 30.0),
                    Icon(CupertinoIcons.captions_bubble, color: Colors.white,size: 30.0),
                  ],
          ),
                const SizedBox(height: 20.0),

                MyButton(
                  onTap: () => Navigator.pushNamed(context, 'pages/obra', arguments: id),
                  buttonText: 'Continuar leitura',
                  width: 170.0,
                  height: 60.0,
                  colorAway: Colors.white,
                  colorPressed: Colors.black,
                  borderColorAway: Colors.black,
                  borderColorPressed: Colors.white,
                ),

                const SizedBox(height: 10.0),

              ],

            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
        child: NavigationBar(
          indicatorColor: Colors.white,
          backgroundColor: Colors.black,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.description, color: Colors.white),
              selectedIcon: Icon(Icons.description, color: Colors.black),
              label: 'Description',
            ),
            NavigationDestination(
              icon: Icon(Icons.book, color: Colors.white),
              selectedIcon: Icon(Icons.pages_outlined, color: Colors.black),
              label: 'Capítulos',
            ),
          ],
        ),
      ),
    );
  }
}
