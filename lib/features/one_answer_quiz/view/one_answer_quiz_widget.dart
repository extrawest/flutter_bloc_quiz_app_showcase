import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/cubit/one_answer_cubit.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_button.dart';

class OneAnswerQuizWidget extends StatefulWidget {
  final OneAnswerQuiz quiz;

  const OneAnswerQuizWidget({Key? key, required this.quiz}) : super(key: key);

  @override
  State<OneAnswerQuizWidget> createState() => _OneAnswerQuizWidgetState();
}

class _OneAnswerQuizWidgetState extends State<OneAnswerQuizWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    offset = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonCubit = context.read<OneAnswerCubit>();
    return BlocConsumer<OneAnswerCubit, OneAnswerCubitState>(
      listener: (context, state) {
        if (state is OneAnswerButtonSelected) {
          controller.forward();
        }
        if (state is OneAnswerButtonInitial) {
          controller.reverse();
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.quiz.question ?? 'Something went wrong'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.quiz.answers!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                widget.quiz.answers![index].answer!,
                                style: TextStyle(color: state.index == index ? Colors.blue : Colors.black),
                              ),
                            ),
                            onTap: () {
                              buttonCubit.selectAnswer(index: index);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: offset,
                child: BottomButton(
                    title: state.index != null ? widget.quiz.answers![state.index!].answer! : 'Validating...',
                    callBack: state.index != null
                        ? () {
                            context.read<OneAnswerBloc>()
                              ..add(AnswerOnQuestionEvent(
                                  id: widget.quiz.id!, answer: widget.quiz.answers![state.index!].answer!))
                              ..add(NextQuestionEvent(context.read<OneAnswerBloc>().state.actualQuestion));
                            buttonCubit.initial();
                          }
                        : () {}),
              ),
            )
          ],
        );
      },
    );
  }
}
