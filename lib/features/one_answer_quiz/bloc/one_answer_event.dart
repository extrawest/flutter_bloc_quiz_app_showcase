part of 'one_answer_bloc.dart';

abstract class OneAnswerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OneAnswerFetchEvent extends OneAnswerEvent {}

class NextQuestionEvent extends OneAnswerEvent {
  final int? actualQuestion;

  NextQuestionEvent(this.actualQuestion);
}

class AnswerOnQuestionEvent extends OneAnswerEvent {
  final int id;
  final String answer;
  final String rightAnswer;

  AnswerOnQuestionEvent({required this.id, required this.answer, required this.rightAnswer});
  @override
  List<Object> get props => [id,answer,rightAnswer];
}
