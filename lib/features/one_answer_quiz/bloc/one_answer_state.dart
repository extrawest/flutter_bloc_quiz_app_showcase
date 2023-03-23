part of 'one_answer_bloc.dart';

enum OneAnswerStatus { initial, success, failure }

class OneAnswerState extends Equatable {
  final OneAnswerStatus status;
  final List<OneAnswerQuiz> quizQuestions;
  final String? errorMessage;
  final int? actualQuestion;
  final List<Map<String, dynamic>> answeredQuestions;

  const OneAnswerState(
      {this.status = OneAnswerStatus.initial,
      this.quizQuestions = const <OneAnswerQuiz>[],
      this.errorMessage,
      this.actualQuestion,
      this.answeredQuestions = const []});

  OneAnswerState copyWith(
      {OneAnswerStatus? status,
      List<OneAnswerQuiz>? quizQuestions,
      bool? hasReachedMax,
      String? errorMessage,
      int? actualQuestion,
      List<Map<String, dynamic>>? answeredQuestions}) {
    return OneAnswerState(
        status: status ?? this.status,
        quizQuestions: quizQuestions ?? this.quizQuestions,
        errorMessage: errorMessage ?? this.errorMessage,
        actualQuestion: actualQuestion ?? this.actualQuestion,
        answeredQuestions: answeredQuestions ?? this.answeredQuestions);
  }

  @override
  List<Object?> get props => [status, quizQuestions, actualQuestion, answeredQuestions];

  @override
  String toString() {
    return 'OneAnswerState{status: $status, quizQuestions: $quizQuestions, errorMessage: $errorMessage}';
  }
}

class OneAnswerInitial extends OneAnswerState {}
