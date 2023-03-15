import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneAnswerQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('One Answer')),
      body: BlocProvider(
        create: (_) =>
            OneAnswerBloc(oneAnswerQuizRepository: RepositoryProvider.of(context))..add(OneAnswerFetchEvent()),
        child: BlocBuilder<OneAnswerBloc, OneAnswerState>(
          builder: (context, state) {
            switch (state.status) {
              case OneAnswerStatus.failure:
                return const Center(child: Text('failed to fetch questiona'));
              case OneAnswerStatus.success:
                if (state.quizQuestions.isEmpty) {
                  return const Center(child: Text('no questions'));
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text(state.quizQuestions[index].question ?? 'something went wrong!');
                  },
                  itemCount: state.quizQuestions.length,
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
