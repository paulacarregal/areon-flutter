import '../models/quiz_question.dart';

List<QuizQuestion> getQuizQuestions() {

  return [

    QuizQuestion(
      pergunta: "Seu tempo livre ideal é mais:",
      opcao1: "🌆 Descobrir algo novo",
      opcao2: "🏠 Curtir seu espaço",
    ),

    QuizQuestion(
      pergunta: "O que mais te atrai em um lugar?",
      opcao1: "💎 Qualidade Premium",
      opcao2: "🚀 Novidade e descoberta",
    ),

    QuizQuestion(
      pergunta: "Seu rolê ideal tem mais:",
      opcao1: "🏃 Movimento e atividade",
      opcao2: "🧘 Relax e conforto",
    ),

    QuizQuestion(
      pergunta: "Você costuma sair mais:",
      opcao1: "🌅 Durante o dia",
      opcao2: "🌙 À noite",
    ),

    QuizQuestion(
      pergunta: "Você prefere experiências:",
      opcao1: "👤 Mais sozinho",
      opcao2: "👥 Com outras pessoas",
    ),
  ];
}