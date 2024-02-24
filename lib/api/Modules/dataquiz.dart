import 'package:quiz/api/Modules/choices.dart';

class DataQuiz {
  final int questionCounter;
  final int totalQuestion;
  final List<Choices> listChoices;
  final String question;
  final int timer;

  DataQuiz(
      {required this.question,
      required this.listChoices,
      required this.questionCounter,
      required this.totalQuestion,
      required this.timer});
}
