part of 'true_false_bloc.dart';

abstract class TrueFalseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TrueFalseFetchEvent extends TrueFalseEvent {}

class NextTrueFalseQuestionEvent extends TrueFalseEvent {
  final int? actualQuestion;

  NextTrueFalseQuestionEvent(this.actualQuestion);
}

class AnswerOnTrueFalseQuestionEvent extends TrueFalseEvent {
  final int id;
  final bool answer;
  final bool rightAnswer;

  AnswerOnTrueFalseQuestionEvent({required this.id, required this.answer, required this.rightAnswer});
}
