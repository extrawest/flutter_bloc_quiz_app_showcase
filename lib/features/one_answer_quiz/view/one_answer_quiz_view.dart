import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/view/one_answer_quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/base_button.dart';
import '../../storage/data_models/quiz_result_model.dart';
import '../../storage/quiz_storage_bloc.dart';
import 'one_answer_result_widget.dart';

class OneAnswerQuizView extends StatelessWidget {
  const OneAnswerQuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneAnswerBloc, OneAnswerState>(builder: (context, state) {
      if (state.actualQuestion == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Are you ready?'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BaseButton(
                    onPressed: () => context.read<OneAnswerBloc>().add(NextQuestionEvent(state.actualQuestion)),
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