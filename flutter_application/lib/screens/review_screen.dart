import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/bottom_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() =>
      _ReviewScreenState();
}

class _ReviewScreenState
    extends State<ReviewScreen> {

  final TextEditingController reviewController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundAeon,

      appBar: AppBar(
        title: const Text("Review"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "BAR TAN TAN",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star_border,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: reviewController,

              maxLines: 6,

              decoration: InputDecoration(
                hintText:
                    "O que achou da sua experiência?",

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),

                label: const Text(
                  "Adicionar Fotos e Vídeos",
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFA663B5),

                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Mais detalhes",

              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Valor Gasto",
              ),

              items: const [
                DropdownMenuItem(
                  value: "Até R\$50",
                  child: Text("Até R\$50"),
                ),

                DropdownMenuItem(
                  value: "R\$50 - R\$100",
                  child: Text("R\$50 - R\$100"),
                ),

                DropdownMenuItem(
                  value: "Acima de R\$100",
                  child: Text("Acima de R\$100"),
                ),
              ],

              onChanged: (value) {},
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Tempo de Espera",
              ),

              items: const [
                DropdownMenuItem(
                  value: "0-10 min",
                  child: Text("0-10 min"),
                ),

                DropdownMenuItem(
                  value: "10-30 min",
                  child: Text("10-30 min"),
                ),

                DropdownMenuItem(
                  value: "30+ min",
                  child: Text("30+ min"),
                ),
              ],

              onChanged: (value) {},
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(

                    const SnackBar(
                      content: Text(
                        "Review publicada!",
                      ),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleAeon,
                ),

                child: const Text(
                  "Publicar",

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: AeonBottomBar(
        currentIndex: 2,

        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                '/menu',
              );
              break;

            case 1:
              Navigator.pushReplacementNamed(
                context,
                '/mapa',
              );
              break;

            case 2:
              break;

            case 3:
              Navigator.pushReplacementNamed(
                context,
                '/favoritos',
              );
              break;

            case 4:
              Navigator.pushReplacementNamed(
                context,
                '/perfil',
              );
              break;
           }
         },
        ),
     );
    }
  }