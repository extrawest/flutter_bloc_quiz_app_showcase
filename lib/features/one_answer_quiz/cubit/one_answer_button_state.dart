part of 'one_answer_button_cubit.dart';

@immutable
abstract class OneAnswerButtonState extends Equatable{
  final int? index;
  const OneAnswerButtonState({this.index});
}

class OneAnswerButtonInitial extends OneAnswerButtonState {
  const OneAnswerButtonInitial({super.index});

  @override
  List<Object?> get props => [index];
}

class OneAnswerButtonSelected extends OneAnswerButtonState {
   const OneAnswerButtonSelected({super.index});

  @override
  List<Object?> get props => [index];
}

class OneAnswerButtonUnSelected extends OneAnswerButtonState {
  const OneAnswerButtonUnSelected({super.index});

  @override
  List<Object?> get props => [index];
}
