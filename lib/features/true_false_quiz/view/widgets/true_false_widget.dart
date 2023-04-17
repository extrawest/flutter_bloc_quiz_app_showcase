import 'package:bloc_quiz_training/common/widgets/base_button.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/bloc/true_false_bloc.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';
import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme_info.dart';
import '../../cubit/true_false_translate_cubit.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                  future: context
                      .read<TrueFalseTranslateCubit>()
                      .translateQuestion(Localizations.localeOf(context).languageCode, widget.quiz.question),
                  builder: (context, asyncSnap) {
                    return Center(
                        child: BlocBuilder<TrueFalseTranslateCubit, TrueFalseTranslateState>(builder: (context, state) {
                      if (state is TrueFalseTranslated) {
                        return Text(
                          state.translatedQuestion,
                          style: text,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }));
                  }),
            ),
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
                        context.read<TrueFalseTranslateCubit>().setInitial();
                      },
                      titleColor: Theme.of(context).colorScheme.primary,
                      title: tr(LocaleKeys.true_key)),
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
                        context.read<TrueFalseTranslateCubit>().setInitial();
                      },
                      titleColor: Theme.of(context).colorScheme.primary,
                      title: tr(LocaleKeys.false_key)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
