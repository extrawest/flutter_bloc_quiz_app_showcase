import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  final bool isAnswerRight;
  final String question;
  const QuizResult({Key? key, required this.isAnswerRight, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: isAnswerRight ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(10),
      child: Center(child: Text(question)),
    );
  }
}
