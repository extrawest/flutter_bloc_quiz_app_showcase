import 'package:bloc_quiz_training/features/true_false_quiz/view/true_false_result_widget.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/view/true_false_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/base_button.dart';
import '../bloc/true_false_bloc.dart';

class TrueFalseQuizView extends StatelessWidget {
  const TrueFalseQuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrueFalseBloc, TrueFalseState>(builder: (context, state) {
      if (state.actualQuestion == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Are you ready?'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BaseButton(
                    onPressed: () => context.read<TrueFalseBloc>().add(NextQuestionEvent(state.actualQuestion)),
                    isInternetConnected: true,
                    isEnabled: true,
                    buttonColor: Colors.greenAccent,
                    title: 'GO!'),
              ),
            ],
          ),
        );
      }
      if (state.actualQuestion! < state.quizQuestions.length) {
        return TrueFalseQuestionWidget(quiz: state.quizQuestions[state.actualQuestion!]);
      } else {
        return const TrueFalseResultsWidget();
      }
    });
  }
}
