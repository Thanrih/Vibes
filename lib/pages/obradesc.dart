import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    _future = _fetchImageUrl();
  }

  Future<Map<String, dynamic>?> _fetchImageUrl() async {
    final response = await supabase
        .from('Obras')
        .select('ImageUrl')
        .eq('id', 2)
        .single();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
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

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageUrl != null)
                  Card(
                    child: Image.network(
                      imageUrl,

                      width: 260,
                    ),
                  )
                else
                  const Text('Image URL not found'),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'oi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Wrap(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Chip(
                                label: Text('Ação'),
                              ),
                              SizedBox(width: 10.0),
                              Chip(
                                label: Text('Comédia'),
                              ),
                              SizedBox(width: 10.0),
                              Chip(
                                label: Text('Fantasia'),
                              ),
                            ],
                          ),
                          Text(
                            'Leon é um mago vermelho fracassado que falha constantemente nas mudanças de classe – como resultadoasdfaafasdfasdfasdfasdf',
                            maxLines: 10,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                MyButton(
                  onTap: () => Navigator.pushNamed(context, 'pages/obra'),
                  buttonText: 'Ler',
                  width: 170.0,
                  height: 60.0,
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(

          labelTextStyle:MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),),
        child: NavigationBar(
          indicatorColor: Colors.white,
          backgroundColor: Colors.black,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.description,color: Colors.white,),
              selectedIcon: Icon(Icons.description,color: Colors.black,),

              label: 'Description',
            ),
            NavigationDestination(
              icon: Icon(Icons.book,color: Colors.white,),
              selectedIcon: Icon(Icons.pages_outlined,color: Colors.black,),
              label: 'Histórico',
            ),
          ],
        ),
      ),
    );
  }
}
