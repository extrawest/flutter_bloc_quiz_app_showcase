import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/cubit/one_answer_cubit.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../theme/theme_info.dart';
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
                    Padding(
                      padding: const EdgeInsets.only(top:18),
                      child: Text(
                        widget.quiz.question!,
                        style: text,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ListView.builder(
                          itemCount: widget.quiz.answers!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                splashColor: Colors.green.shade400,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(widget.quiz.answers![index].answer!.titleCase,
                                        style: text.copyWith(
                                            color: state.index == index
                                                ? Colors.blue
                                                : Theme.of(context).colorScheme.primary)),
                                  ),
                                ),
                                onTap: () {
                                  buttonCubit.selectAnswer(index: index);
                                },
                              ),
                            );
                          },
                        ),
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
                child: state.index != null
                    ? BottomButton(
                        title: widget.quiz.answers![state.index!].answer!.titleCase,
                        callBack: () {
                          context.read<OneAnswerBloc>()
                            ..add(AnswerOnQuestionEvent(
                                id: widget.quiz.id!,
                                answer: widget.quiz.answers![state.index!].answer!,
                                rightAnswer: widget.quiz.rightAnswer!))
                            ..add(NextQuestionEvent());
                          buttonCubit.initial();
                        })
                    : BottomButton(
                        callBack: () {},
                        title: tr(LocaleKeys.validating),
                      ),
              ),
            )
          ],
        );
      },
    );
  }
}
