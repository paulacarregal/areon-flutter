import 'package:flutter/material.dart';

import '../domain/quiz_question.dart';
import '../data/quiz_repository.dart';

class QuizProvider extends ChangeNotifier {
  final List<QuizQuestion> _questions = getQuizQuestions();
  int _currentIndex = 0;
  final List<int> _answers = [];

  List<QuizQuestion> get questions => _questions;
  int get currentIndex => _currentIndex;
  QuizQuestion get currentQuestion => _questions[_currentIndex];
  bool get isLastQuestion => _currentIndex >= _questions.length - 1;
  double get progress => (_currentIndex + 1) / _questions.length;

  void answer(int opcao) {
    _answers.add(opcao);
    if (!isLastQuestion) {
      _currentIndex++;
      notifyListeners();
    }
  }

  bool advance() {
    if (isLastQuestion) return false;
    _currentIndex++;
    notifyListeners();
    return true;
  }

  void reset() {
    _currentIndex = 0;
    _answers.clear();
    notifyListeners();
  }

  String get perfil {
    final count1 = _answers.where((a) => a == 1).length;
    return count1 >= (_questions.length ~/ 2)
        ? 'Pioneiro Urbano'
        : 'Explorador Tranquilo';
  }
}
