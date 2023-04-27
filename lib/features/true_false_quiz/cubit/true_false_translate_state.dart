part of 'true_false_translate_cubit.dart';

abstract class TrueFalseTranslateState extends Equatable {
  const TrueFalseTranslateState();
}

class TrueFalseTranslateInitial extends TrueFalseTranslateState {
  @override
  List<Object> get props => [];
}

class TrueFalseTranslated extends TrueFalseTranslateState {
  final String translatedQuestion;

  const TrueFalseTranslated(this.translatedQuestion);

  @override
  List<Object> get props => [translatedQuestion];
}
