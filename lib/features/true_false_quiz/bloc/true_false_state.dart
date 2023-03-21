part of 'true_false_bloc.dart';

enum TrueFalseStatus { initial, success, failure }

class TrueFalseState extends Equatable {
  final TrueFalseStatus status;
  final List<TrueFalseQuiz> quizQuestions;
  final String? errorMessage;
  final int? actualQuestion;
  final List<Map<String, dynamic>> answeredQuestions;

  const TrueFalseState(
      {this.status = TrueFalseStatus.initial,
      this.quizQuestions = const <TrueFalseQuiz>[],
      this.errorMessage,
      this.actualQuestion,
      this.answeredQuestions = const []});

  TrueFalseState copyWith(
      {TrueFalseStatus? status,
      List<TrueFalseQuiz>? quizQuestions,
      bool? hasReachedMax,
      String? errorMessage,
      int? actualQuestion,
      List<Map<String, dynamic>>? answeredQuestions}) {
    return TrueFalseState(
        status: status ?? this.status,
        quizQuestions: quizQuestions ?? this.quizQuestions,
        errorMessage: errorMessage ?? this.errorMessage,
        actualQuestion: actualQuestion ?? this.actualQuestion,
        answeredQuestions: answeredQuestions ?? this.answeredQuestions);
  }

  @override
  List<Object?> get props => [status, quizQuestions, actualQuestion, answeredQuestions];
}

class TrueFalseInitial extends TrueFalseState {}
