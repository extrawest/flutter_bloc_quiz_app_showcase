import 'package:freezed_annotation/freezed_annotation.dart';

part 'true_false_quiz_data_model.freezed.dart';
part 'true_false_quiz_data_model.g.dart';

@freezed
class TrueFalseQuiz with _$TrueFalseQuiz {
  const factory TrueFalseQuiz({
    required int id,
    required String question,
    required bool rightAnswer,
  }) = _TrueFalseQuiz;

  factory TrueFalseQuiz.fromJson(Map<String, Object?> json) => _$TrueFalseQuizFromJson(json);
}
