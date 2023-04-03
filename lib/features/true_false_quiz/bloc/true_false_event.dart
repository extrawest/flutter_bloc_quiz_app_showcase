part of 'true_false_bloc.dart';

abstract class TrueFalseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TrueFalseFetchEvent extends TrueFalseEvent {}

class NextQuestionEvent extends TrueFalseEvent {
  final int? actualQuestion;

  NextQuestionEvent(this.actualQuestion);
}

class AnswerOnQuestionEvent extends TrueFalseEvent {
  final int id;
  final bool answer;
  final bool rightAnswer;

  AnswerOnQuestionEvent({required this.id, required this.answer, required this.rightAnswer});
}
