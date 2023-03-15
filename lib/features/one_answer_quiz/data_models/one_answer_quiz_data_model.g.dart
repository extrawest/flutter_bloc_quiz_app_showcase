// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_answer_quiz_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OneAnswerQuiz _$$_OneAnswerQuizFromJson(Map<String, dynamic> json) =>
    _$_OneAnswerQuiz(
      id: json['id'] as int?,
      question: json['question'] as String?,
      answers:
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rightAnswer: json['right_answer'] as String?,
    );

Map<String, dynamic> _$$_OneAnswerQuizToJson(_$_OneAnswerQuiz instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
      'right_answer': instance.rightAnswer,
    };
