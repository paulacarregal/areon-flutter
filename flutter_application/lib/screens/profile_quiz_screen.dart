import 'package:flutter/material.dart';

import '../repositories/quiz_repository.dart';
import '../theme/colors.dart';

class QuizScreen extends StatefulWidget {

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() =>
      _QuizScreenState();
}

class _QuizScreenState
    extends State<QuizScreen> {

  int perguntaAtual = 0;

  final perguntas = getQuizQuestions();

  @override
  Widget build(BuildContext context) {

    final pergunta = perguntas[perguntaAtual];

    return Scaffold(
      backgroundColor: backgroundAeon,

      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text(
          "Quiz AEON",

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Text(
              pergunta.pergunta,

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            SizedBox(
              width: double.infinity,
              height: 80,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleAeon,
                ),

                onPressed: () {
                  avancarQuiz();
                },

                child: Text(
                  pergunta.opcao1,

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 80,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellowAeon,
                ),

                onPressed: () {
                  avancarQuiz();
                },

                child: Text(
                  pergunta.opcao2,

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void avancarQuiz() {

    if (perguntaAtual <
        perguntas.length - 1) {

      setState(() {
        perguntaAtual++;
      });

    } else {

      Navigator.pushReplacementNamed(
        context,
        '/menu',
      );
    }
  }
}