part of 'one_answer_bloc.dart';

enum OneAnswerStatus { initial, success, failure }

class OneAnswerState extends Equatable {
  final OneAnswerStatus status;
  final List<OneAnswerQuiz> quizQuestions;
  final String? errorMessage;
  final int? actualQuestion;
  final int rightAnswers;
  final int wrongAnswers;
  final QuizType? quizType;
  final List<Map<String, dynamic>> answeredQuestions;

  const OneAnswerState(
      {this.status = OneAnswerStatus.initial,
      this.quizQuestions = const <OneAnswerQuiz>[],
      this.errorMessage,
      this.actualQuestion,
      this.rightAnswers = 0,
      this.wrongAnswers = 0,
      this.quizType = QuizType.none,
      this.answeredQuestions = const []});

  OneAnswerState copyWith(
      {OneAnswerStatus? status,
      List<OneAnswerQuiz>? quizQuestions,
      bool? hasReachedMax,
      String? errorMessage,
      int? actualQuestion,
      int? rightAnswers,
      int? wrongAnswers,
      QuizType? quizType,
      List<Map<String, dynamic>>? answeredQuestions}) {
    return OneAnswerState(
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

  @override
  String toString() {
    return 'OneAnswerState{status: $status, quizQuestions: $quizQuestions, errorMessage: $errorMessage}';
  }

  bool isAnswerRight(int index) {
    return quizQuestions[index].rightAnswer == answeredQuestions[index]['answer'];
  }
}

class OneAnswerInitial extends OneAnswerState {}
