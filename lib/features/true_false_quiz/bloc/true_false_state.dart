part of 'true_false_bloc.dart';

enum TrueFalseStatus { initial, success, failure }

class TrueFalseState extends Equatable {
  final TrueFalseStatus status;
  final List<TrueFalseQuiz> quizQuestions;
  final String? errorMessage;
  final int? actualQuestion;
  final int rightAnswers;
  final int wrongAnswers;
  final QuizType? quizType;
  final List<Map<String, dynamic>> answeredQuestions;

  const TrueFalseState(
      {this.status = TrueFalseStatus.initial,
      this.quizQuestions = const <TrueFalseQuiz>[],
      this.errorMessage,
      this.actualQuestion,
      this.rightAnswers = 0,
      this.wrongAnswers = 0,
      this.quizType = QuizType.none,
      this.answeredQuestions = const []});

  TrueFalseState copyWith(
      {TrueFalseStatus? status,
      List<TrueFalseQuiz>? quizQuestions,
      bool? hasReachedMax,
      String? errorMessage,
      int? actualQuestion,
      int? rightAnswers,
      int? wrongAnswers,
      QuizType? quizType,
      List<Map<String, dynamic>>? answeredQuestions}) {
    return TrueFalseState(
        status: status ?? this.status,
        quizQuestions: quizQuestions ?? this.quizQuestions,
        errorMessage: errorMessage ?? this.errorMessage,
        actualQuestion: actualQuestion ?? this.actualQuestion,
        rightAnswers: rightAnswers ?? this.rightAnswers,
        wrongAnswers: wrongAnswers ?? this.wrongAnswers,
        answeredQuestions: answeredQuestions ?? this.answeredQuestions,
        quizType: quizType ?? this.quizType);
  }

  @override
  List<Object?> get props => [status, quizQuestions, actualQuestion, answeredQuestions, rightAnswers, wrongAnswers];

  bool isAnswerRight(int index) {
    return quizQuestions[index].rightAnswer == answeredQuestions[index]['answer'];
  }
}

class TrueFalseInitial extends TrueFalseState {}
