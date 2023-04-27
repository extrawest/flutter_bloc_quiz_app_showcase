import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/view/widgets/one_answer_quiz_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/base_button.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../storage/data_models/quiz_result_model.dart';
import '../../../storage/quiz_storage_bloc.dart';
import '../../../theme/theme_info.dart';
import 'one_answer_result_widget.dart';

class OneAnswerQuizView extends StatelessWidget {
  const OneAnswerQuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneAnswerBloc, OneAnswerState>(builder: (context, state) {
      if (state.actualQuestion == null) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    tr(LocaleKeys.one_answer_description),
                    style: text,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  tr(LocaleKeys.are_you_ready),
                  style: notifierTextLabel,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BaseButton(
                      onPressed: () => context.read<OneAnswerBloc>().add(NextQuestionEvent()),
                      isInternetConnected: true,
                      isEnabled: true,
                      buttonColor: Colors.green,
                      titleColor: Theme.of(context).colorScheme.primary,
                      title: tr(LocaleKeys.go)),
                ),
              ],
            ),
          ),
        );
      }
      if (state.actualQuestion! < state.quizQuestions.length) {
        return OneAnswerQuizWidget(quiz: state.quizQuestions[state.actualQuestion!]);
      } else {
        context.read<QuizStorageBloc>().add(QuizStorageWriteEvent(
              savedQuiz: SavedQuiz(
                date: DateTime.now().millisecondsSinceEpoch,
                rightAnswers: state.rightAnswers,
                wrongAnswers: state.wrongAnswers,
                quizType: QuizType.oneAnswer,
              ),
            ));
        return const OneAnswerResultsWidget();
      }
    });
  }
}