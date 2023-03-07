import 'dart:convert';

class OneAnswerQuiz {
  OneAnswerQuiz({
    this.id,
    this.question,
    this.answers,
    this.rightAnswer,
  });

  final int? id;
  final String? question;
  final List<String>? answers;
  final String? rightAnswer;

  factory OneAnswerQuiz.fromRawJson(String str) => OneAnswerQuiz.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneAnswerQuiz.fromJson(Map<String, dynamic> json) => OneAnswerQuiz(
    id: json['id'],
    question: json['question'],
    answers: json['answers'] == null ? [] : List<String>.from(json['answers']!.map((x) => x)),
    rightAnswer: json['rightAnswer'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'answers': answers == null ? [] : List<dynamic>.from(answers!.map((x) => x)),
    'rightAnswer': rightAnswer,
  };
}