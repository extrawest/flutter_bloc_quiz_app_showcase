// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_answer_quiz_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OneAnswerQuiz _$$_OneAnswerQuizFromJson(Map<String, dynamic> json) =>
    _$_OneAnswerQuiz(
      id: json['id'] as int?,
      question: json['question'] as String?,
      answers: _$JsonConverterFromJson<List<dynamic>, List<Answer>>(
          json['answers'], const AnswersListResponseConverter().fromJson),
      rightAnswer: json['rightAnswer'] as String?,
    );

Map<String, dynamic> _$$_OneAnswerQuizToJson(_$_OneAnswerQuiz instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': _$JsonConverterToJson<List<dynamic>, List<Answer>>(
          instance.answers, const AnswersListResponseConverter().toJson),
      'rightAnswer': instance.rightAnswer,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
