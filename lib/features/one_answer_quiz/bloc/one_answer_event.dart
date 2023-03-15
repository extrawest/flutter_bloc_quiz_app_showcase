part of 'one_answer_bloc.dart';


abstract class OneAnswerEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class OneAnswerFetchEvent extends OneAnswerEvent {}