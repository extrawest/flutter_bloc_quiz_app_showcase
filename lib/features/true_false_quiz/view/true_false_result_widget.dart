import 'package:bloc_quiz_training/common/widgets/quiz_result.dart';
import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/base_button.dart';
import '../bloc/true_false_bloc.dart';

class TrueFalseResultsWidget extends StatelessWidget {
  const TrueFalseResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrueFalseBloc, TrueFalseState>(builder: (context, state) {
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
                        isAnswerRight:
                            state.quizQuestions[index].rightAnswer == state.answeredQuestions[index]['answer'],
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
