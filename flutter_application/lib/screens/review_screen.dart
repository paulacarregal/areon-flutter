import 'package:flutter/material.dart';
import '../routes/route_names.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF5),
      
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0FFF5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: (){
            Navigator.pushReplacementNamed(
                    context,
                    RouteNames.navigation,
            );
          },
        ),
        title: const Text(
          "Review",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          // Avatar fictício 
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.purple[200],
              child: const Icon(Icons.star, size: 16, color: Color(0xFF9C27B0)),
            ),
          )
        ],
        // Linha divisória
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black12,
            height: 1.0,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título do Estabelecimento
            const Text(

              "BAR TAN TAN",

              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 16),

            // Estrelas de Avaliação (Vazias)
            Row(
              children: List.generate(5, (index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.star_border,
                    size: 38,
                    color: Colors.black45,
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // Caixa de Texto Grande
            Container(
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black12),
              ),
              child: const TextField(
                maxLines: null, // Permite múltiplas linhas
                decoration: InputDecoration(
                  hintText: "O que achou da sua experiência?",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botão Adicionar Fotos e Vídeos (Roxo)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 18),
                label: const Text(
                  "Adicionar Fotos e Vídeos",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C47B2), // Roxo do mockup
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Subtítulo de Detalhes
            const Text(
              "Quer adicionar mais detalhes?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 12),

            // Lista de Seletores Dinâmicos (Dropdowns Cinzas)
            buildDropdownField("Valor Gasto"),
            buildDropdownField("Tempo de Espera"),
            buildDropdownField("Acessibilidade"),
            buildDropdownField("Adequado para crianças"),
            
            const SizedBox(height: 16),

            // Botão Publicar Final
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.navigation,
                  );

                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B1FA2), // Roxo escuro do mockup

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),

                  ),
                  elevation: 0,
                ),

                child: const Text(

                  "Publicar",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
            ),
          ],

        ),
      ),
    );
  }

  // Widget auxiliar para estruturar os seletores cinzas com a seta para baixo
  static Widget buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0), // Cinza do mockup
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}