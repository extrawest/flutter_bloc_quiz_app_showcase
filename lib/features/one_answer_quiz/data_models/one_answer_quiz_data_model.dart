import 'package:freezed_annotation/freezed_annotation.dart';
part 'one_answer_quiz_data_model.freezed.dart';
part 'one_answer_quiz_data_model.g.dart';
@freezed
class OneAnswerQuiz with _$OneAnswerQuiz{
  const factory OneAnswerQuiz({
    required int? id,
    required String? question,
    required List<String>? answers,
    required String? rightAnswer,
}) = _OneAnswerQuiz;

  factory OneAnswerQuiz.fromJson(Map<String,Object?>json)=>_$OneAnswerQuizFromJson(json);
}