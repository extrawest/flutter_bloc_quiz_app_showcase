// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'true_false_quiz_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrueFalseQuiz _$$_TrueFalseQuizFromJson(Map<String, dynamic> json) =>
    _$_TrueFalseQuiz(
      id: json['id'] as int,
      question: json['question'] as String,
      rightAnswer: json['right_answer'] as bool,
    );

Map<String, dynamic> _$$_TrueFalseQuizToJson(_$_TrueFalseQuiz instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'right_answer': instance.rightAnswer,
    };
