import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../repositories/quiz_repository.dart';


class ProfileQuizScreen extends StatefulWidget {
  const ProfileQuizScreen({super.key});

  @override
  State<ProfileQuizScreen> createState() => _ProfileQuizScreenState();
}

class _ProfileQuizScreenState extends State<ProfileQuizScreen> {
  int perguntaAtual = 0;

  final List<QuizQuestion> perguntas = getQuizQuestions();

  void avancarQuiz() {
    if (perguntaAtual < perguntas.length - 1) {
      setState(() {
        perguntaAtual++;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/navigation');
    }
  }

  @override
  Widget build(BuildContext context) {

    final pergunta = perguntas[perguntaAtual];

    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Text(
                pergunta.pergunta,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  // CARD 1
                  Expanded(
                    child: Transform.rotate(
                      angle: -0.08,
                      child: GestureDetector(
                        onTap: avancarQuiz,
                        child: Container(
                          height: 340,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7B1FA2),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pergunta.opcao1.toLowerCase(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),

                              Text(
                                pergunta.emoji1,
                                style: const TextStyle(fontSize: 80),
                              ),

                              Text(
                                pergunta.opcao1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // CARD 2
                  Expanded(
                    child: Transform.rotate(
                      angle: 0.05,
                      child: GestureDetector(
                        onTap: avancarQuiz,
                        child: Container(
                          height: 340,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF59E),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pergunta.opcao2.toLowerCase(),
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),

                              Text(
                                pergunta.emoji2,
                                style: const TextStyle(fontSize: 80),
                              ),

                              Text(
                                pergunta.opcao2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

}