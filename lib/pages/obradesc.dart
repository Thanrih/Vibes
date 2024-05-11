import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakugaacaptors/assets/card.dart'; // Assuming this defines a card widget
import 'package:sakugaacaptors/assets/my_button.dart';

class ObraDescPage extends StatelessWidget {
  const ObraDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'), // Use constant for text that doesn't change
      ),
      body: SingleChildScrollView( // Wrap content with SingleChildScrollView for scrollable content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use a Card widget from your assets (if applicable)
            Row(
              children: [
                Card( // Assuming Card widget displays the image
                  child: Image.network(
                    'https://lermangas.me/wp-content/uploads/2024/02/hazure-aka-madoushi-wa-kenja-time-ni-musou-suru.jpg', // Replace 'src' with the actual image URL
                  ),
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        'Hazure Aka Madoushi wa Kenja Time ni Musou suru',
                        style: TextStyle(fontWeight: FontWeight.bold), // Optional for bold title
                      ),
                      // Add spacing between text and image
                      Wrap( // Wrap the text to allow line breaks
                        children: [
                          Text(
                            'Leon é um mago vermelho fracassado que falha constantemente nas mudanças de classe – como resultado,'
                                ' ele atua como um suporte para sua equipe de aventureiros, Wolf Fang Sword. Eventualmente, como todas'
                                ' as séries fazem, ele é ele expulso da equipe por não ser forte o suficiente. No entanto, depois de'
                                ' deixar a equipe, Leon descobre que foi sufocado por sua própria equipe. e acontece que ele pode'
                                ' lutar perfeitamente bem sozinho. Sem falar que sua classe Sage tem um poder oculto que só'
                                ' ativa em certas condições…', maxLines: 10,
                          ),
                        ],
                      )
                    ],

                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0), // Add spacing between elements
            MyButton(
              onTap: () => Navigator.pushNamed(context, 'pages/obra'), // Route to target page
              buttonText: 'Ler', // Assuming 'Ler' means 'Read' in Portuguese
              width: 200.0,
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
