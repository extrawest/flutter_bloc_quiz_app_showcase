import 'dart:convert';

class TrueFalseQuiz {
  TrueFalseQuiz({
    this.id,
    this.question,
    this.rightAnswer,
  });

  final int? id;
  final String? question;
  final bool? rightAnswer;

  factory TrueFalseQuiz.fromRawJson(String str) => TrueFalseQuiz.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrueFalseQuiz.fromJson(Map<String, dynamic> json) => TrueFalseQuiz(
    id: json['id'],
    question: json['question'],
    rightAnswer: json['rightAnswer'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'rightAnswer': rightAnswer,
  };
}