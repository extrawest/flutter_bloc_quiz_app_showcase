import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/cubit/one_answer_button_cubit.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneAnswerQuizWidget extends StatelessWidget {
  final OneAnswerQuiz quiz;

  const OneAnswerQuizWidget({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonCubit = context.read<OneAnswerButtonCubit>();
    return BlocConsumer<OneAnswerButtonCubit, OneAnswerButtonState>(
      listenWhen: (prev, current) {
        if (prev is OneAnswerButtonSelected && current is OneAnswerButtonSelected) {
          return false;
        } else {
          return true;
        }
      },
      listener: (context, state) {
        if (state is OneAnswerButtonSelected) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            dismissDirection: DismissDirection.none,
            backgroundColor: Colors.blue,
            content: BlocProvider.value(
              value: BlocProvider.of<OneAnswerButtonCubit>(context),
              child: BlocBuilder<OneAnswerButtonCubit, OneAnswerButtonState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () {
                        context.read<OneAnswerBloc>()
                          ..add(AnswerOnQuestionEvent(id: quiz.id!, answer: quiz.answers![state.index!]))
                          ..add(NextQuestionEvent(context.read<OneAnswerBloc>().state.actualQuestion));
                        buttonCubit.unselectAction();
                      },
                      child: Text(state.index != null
                          ? 'Write down the answer(${quiz.answers![state.index!]})'
                          : 'The answer is recorded'));
                },
              ),
            ),
            duration: const Duration(days: 1),
          ));
        }
        if (state is OneAnswerButtonInitial) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..hideCurrentSnackBar();
        }
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(quiz.question ?? 'Something went wrong'),
                Expanded(
                  child: ListView.builder(
                    itemCount: quiz.answers!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            quiz.answers![index],
                            style: TextStyle(color: state.index == index ? Colors.red : Colors.black),
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
        );
      },
    );
  }
}
