import 'package:bloc_quiz_training/features/true_false_quiz/view/true_false_result_widget.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/view/true_false_widget.dart';
import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/base_button.dart';
import '../../storage/data_models/quiz_result_model.dart';
import '../../storage/quiz_storage_bloc.dart';
import '../../theme/theme_info.dart';
import '../bloc/true_false_bloc.dart';

class TrueFalseQuizView extends StatelessWidget {
  const TrueFalseQuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrueFalseBloc, TrueFalseState>(builder: (context, state) {
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
                    tr(LocaleKeys.true_false_description),
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
                      onPressed: () => context.read<TrueFalseBloc>().add(NextQuestionEvent(state.actualQuestion)),
                      isInternetConnected: true,
                      isEnabled: true,
                      titleColor: Theme.of(context).colorScheme.primary,
                      buttonColor: Colors.green,
                      title: tr(LocaleKeys.go)),
                ),
              ],
            ),
          ),
        );
      }
      if (state.actualQuestion! < state.quizQuestions.length) {
        return TrueFalseQuestionWidget(quiz: state.quizQuestions[state.actualQuestion!]);
      } else {
        context.read<QuizStorageBloc>().add(QuizStorageWriteEvent(
              savedQuiz: SavedQuiz(
                date: DateTime.now().millisecondsSinceEpoch,
                rightAnswers: state.rightAnswers,
                wrongAnswers: state.wrongAnswers,
                quizType: QuizType.trueFalse,
              ),
            ));
        return const TrueFalseResultsWidget();
      }
    });
  }
}
