import 'package:bloc_quiz_training/common/widgets/base_button.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/bloc/true_false_bloc.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrueFalseQuestionWidget extends StatefulWidget {
  final TrueFalseQuiz quiz;
  const TrueFalseQuestionWidget({Key? key, required this.quiz}) : super(key: key);

  @override
  State<TrueFalseQuestionWidget> createState() => _TrueFalseQuestionWidgetState();
}

class _TrueFalseQuestionWidgetState extends State<TrueFalseQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.quiz.question ?? 'Something went wrong'),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BaseButton(
                      isInternetConnected: true,
                      isEnabled: true,
                      buttonColor: Colors.green,
                      onPressed: () {
                        context.read<TrueFalseBloc>()
                          ..add(AnswerOnQuestionEvent(
                              id: widget.quiz.id!, answer: true, rightAnswer: widget.quiz.rightAnswer!))
                          ..add(NextQuestionEvent(context.read<TrueFalseBloc>().state.actualQuestion));
                      },
                      title: 'True'),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: BaseButton(
                      isEnabled: true,
                      isInternetConnected: true,
                      buttonColor: Colors.red,
                      onPressed: () {
                        context.read<TrueFalseBloc>()
                          ..add(AnswerOnQuestionEvent(
                              id: widget.quiz.id!, answer: false, rightAnswer: widget.quiz.rightAnswer!))
                          ..add(NextQuestionEvent(context.read<TrueFalseBloc>().state.actualQuestion));
                      },
                      title: 'False'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
