import 'package:bloc_quiz_training/features/true_false_quiz/bloc/true_false_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'true_false_quiz_view_widget.dart';

class TrueFalseQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('True/False Quiz'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) =>
            TrueFalseBloc(trueFalseQuizRepository: RepositoryProvider.of(context))..add(TrueFalseFetchEvent()),
        child: BlocBuilder<TrueFalseBloc, TrueFalseState>(
          builder: (context, state) {
            switch (state.status) {
              case TrueFalseStatus.failure:
                return const Center(child: Text('failed to fetch questions'));
              case TrueFalseStatus.success:
                if (state.quizQuestions.isEmpty) {
                  return const Center(child: Text('no questions'));
                }
                return const TrueFalseQuizView();
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
