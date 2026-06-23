import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './quiz_provider.dart';
import '../../../shared/routes/route_names.dart';

class ProfileQuizScreen extends StatelessWidget {
  const ProfileQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final pergunta = quiz.currentQuestion;

    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: quiz.progress,
                  minHeight: 6,
                  backgroundColor: Colors.black12,
                  color: const Color(0xFF750D8F),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${quiz.currentIndex + 1} / ${quiz.questions.length}',
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              Text(
                pergunta.pergunta,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Transform.rotate(
                      angle: -0.08,
                      child: GestureDetector(
                        onTap: () => _responder(context, quiz, 1),
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
                              Text(pergunta.opcao1.toLowerCase(),
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                              Text(pergunta.emoji1,
                                  style: const TextStyle(fontSize: 80)),
                              Text(pergunta.opcao1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Transform.rotate(
                      angle: 0.05,
                      child: GestureDetector(
                        onTap: () => _responder(context, quiz, 2),
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
                              Text(pergunta.opcao2.toLowerCase(),
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 12)),
                              Text(pergunta.emoji2,
                                  style: const TextStyle(fontSize: 80)),
                              Text(pergunta.opcao2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
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

  void _responder(BuildContext context, QuizProvider quiz, int opcao) {
    quiz.answer(opcao);

    if (quiz.isLastQuestion) {
      final perfil = quiz.perfil;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('Seu Perfil AEON'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Você é um(a):'),
              const SizedBox(height: 12),
              Text(
                perfil,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF750D8F)),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF750D8F)),
              onPressed: () {
                quiz.reset();
                Navigator.pushReplacementNamed(
                    context, RouteNames.navigation);
              },
              child: const Text('Começar a explorar',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }
}
