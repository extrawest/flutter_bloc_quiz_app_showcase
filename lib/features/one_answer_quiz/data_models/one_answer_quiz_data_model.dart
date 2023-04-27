import 'package:freezed_annotation/freezed_annotation.dart';

import 'answer.dart';
import 'custom_response_converter.dart';

part 'one_answer_quiz_data_model.freezed.dart';
part 'one_answer_quiz_data_model.g.dart';

@freezed
class OneAnswerQuiz with _$OneAnswerQuiz {
  const factory OneAnswerQuiz({
    int? id,
    String? question,
    @AnswersListResponseConverter() List<Answer>? answers,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'rightAnswer') String? rightAnswer,
  }) = _OneAnswerQuiz;

  factory OneAnswerQuiz.fromJson(Map<String, dynamic> json) => _$OneAnswerQuizFromJson(json);
}
