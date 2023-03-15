part of 'one_answer_bloc.dart';

enum OneAnswerStatus { initial, success, failure }

class OneAnswerState extends Equatable {
  final OneAnswerStatus status;
  final List<OneAnswerQuiz> quizQuestions;
  final String? errorMessage;

  const OneAnswerState({
    this.status = OneAnswerStatus.initial,
    this.quizQuestions = const <OneAnswerQuiz>[],
    this.errorMessage,
  });

  OneAnswerState copyWith({
    OneAnswerStatus? status,
    List<OneAnswerQuiz>? quizQuestions,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return OneAnswerState(
      status: status ?? this.status,
      quizQuestions: quizQuestions ?? this.quizQuestions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, quizQuestions];

  @override
  String toString() {
    return 'OneAnswerState{status: $status, quizQuestions: $quizQuestions, errorMessage: $errorMessage}';
  }
}

class OneAnswerInitial extends OneAnswerState {}
