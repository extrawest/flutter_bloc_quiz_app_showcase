import 'package:hive/hive.dart';

part 'quiz_result_model.g.dart';

@HiveType(typeId: 0)
class SavedQuiz extends HiveObject {
  @HiveField(0)
  int date;

  @HiveField(1)
  int rightAnswers;

  @HiveField(2)
  int wrongAnswers;

  @HiveField(3)
  QuizType quizType;

  SavedQuiz({required this.date, required this.rightAnswers, required this.wrongAnswers, required this.quizType});
}

@HiveType(typeId: 1)
enum QuizType {
  @HiveField(0)
  none,

  @HiveField(1)
  oneAnswer,

  @HiveField(2)
  trueFalse;

  bool get isOneAnswerQuiz => this == oneAnswer;
}
