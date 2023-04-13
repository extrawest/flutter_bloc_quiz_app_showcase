import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/base_button.dart';
import '../../../common/widgets/quiz_result.dart';
import '../../../generated/locale_keys.g.dart';

class OneAnswerResultsWidget extends StatelessWidget {
  const OneAnswerResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneAnswerBloc, OneAnswerState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    tr(LocaleKeys.quiz_results),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return QuizResult(
                        isAnswerRight: state.isAnswerRight(index),
                        question: state.quizQuestions[index].question!,
                      );
                    },
                    itemCount: state.quizQuestions.length,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: BaseButton(
                isInternetConnected: true,
                isEnabled: true,
                buttonColor: Colors.green,
                onPressed: context.pop,
                titleColor: Theme.of(context).colorScheme.primary,
                title: tr(LocaleKeys.done)),
          )
        ],
      );
    });
  }
}
