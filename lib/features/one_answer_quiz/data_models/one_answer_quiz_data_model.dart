import 'package:freezed_annotation/freezed_annotation.dart';
part 'one_answer_quiz_data_model.freezed.dart';
part 'one_answer_quiz_data_model.g.dart';

@freezed
class OneAnswerQuiz with _$OneAnswerQuiz {
  const factory OneAnswerQuiz({
    int? id,
    String? question,
    List<String>? answers,
    @JsonKey(name: 'rightAnswer') String? rightAnswer,
  }) = _OneAnswerQuiz;

  factory OneAnswerQuiz.fromJson(Map<String, Object?> json) => _$OneAnswerQuizFromJson(json);
}
