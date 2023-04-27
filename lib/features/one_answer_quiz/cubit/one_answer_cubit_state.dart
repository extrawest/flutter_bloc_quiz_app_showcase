part of 'one_answer_cubit.dart';

abstract class OneAnswerCubitState extends Equatable{
  final int? index;
  const OneAnswerCubitState({this.index});
}

class OneAnswerButtonInitial extends OneAnswerCubitState {
  const OneAnswerButtonInitial({super.index});

  @override
  List<Object?> get props => [index];
}

class OneAnswerButtonSelected extends OneAnswerCubitState {
   const OneAnswerButtonSelected({super.index});

  @override
  List<Object?> get props => [index];
}

