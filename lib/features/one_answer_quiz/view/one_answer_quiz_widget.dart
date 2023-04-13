import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/cubit/one_answer_cubit.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import 'package:translator/translator.dart';

import '../../../generated/locale_keys.g.dart';
import '../../theme/theme_info.dart';
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
                    FutureBuilder(
                        future: getQuestion(Localizations.localeOf(context).languageCode, widget.quiz.question),
                        builder: (context, asyncSnap) {
                          if (asyncSnap.hasData) {
                            return Text(
                              asyncSnap.data!,
                              style: text,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: ListView.builder(
                          itemCount: widget.quiz.answers!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: FutureBuilder(
                                    future: getAnswer(Localizations.localeOf(context).languageCode,
                                        widget.quiz.answers![index].answer!),
                                    builder: (context, asyncSnap) {
                                      if (asyncSnap.hasData) {
                                        return Text(asyncSnap.data!.titleCase,
                                            style: text.copyWith(
                                                color: state.index == index
                                                    ? Colors.blue
                                                    : Theme.of(context).colorScheme.primary));
                                      } else {
                                        return Container();
                                      }
                                    }),
                              ),
                              onTap: () {
                                buttonCubit.selectAnswer(index: index);
                              },
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
                    ? FutureBuilder(
                        future: getAnswer(
                            Localizations.localeOf(context).languageCode, widget.quiz.answers![state.index!].answer!),
                        builder: (context, asyncSnap) {
                          if (asyncSnap.hasData) {
                            return BottomButton(
                                title: asyncSnap.data!.titleCase,
                                callBack: () {
                                  context.read<OneAnswerBloc>()
                                    ..add(AnswerOnQuestionEvent(
                                        id: widget.quiz.id!,
                                        answer: widget.quiz.answers![state.index!].answer!,
                                        rightAnswer: widget.quiz.rightAnswer!))
                                    ..add(NextQuestionEvent());
                                  buttonCubit.initial();
                                });
                          } else {
                            return Container();
                          }
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

  Future<String> getQuestion(String langCode, String? question) async {
    if (question != null) {
      String tempQuestion = question;
      if (langCode == 'uk') {
        await GoogleTranslator().translate(question, from: 'en', to: 'uk').then((value) {
          tempQuestion = value.text;
        });
        return tempQuestion;
      } else {
        return question;
      }
    } else {
      return tr(LocaleKeys.something_went_wrong);
    }
  }

  Future<String> getAnswer(String langCode, String? answer) async {
    if (answer != null) {
      String tempQuestion = answer;
      if (langCode == 'uk') {
        await GoogleTranslator().translate(answer, from: 'en', to: 'uk').then((value) {
          tempQuestion = value.text;
        });
        return tempQuestion;
      } else {
        return answer;
      }
    } else {
      return tr(LocaleKeys.something_went_wrong);
    }
  }
}
