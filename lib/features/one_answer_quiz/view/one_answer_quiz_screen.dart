import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/cubit/one_answer_cubit.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/view/one_answer_quiz_view.dart';
import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneAnswerQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
                  OneAnswerBloc(oneAnswerQuizRepository: RepositoryProvider.of(context))..add(OneAnswerFetchEvent())),
          BlocProvider(
            create: (context) => OneAnswerCubit(),
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BlocBuilder<OneAnswerCubit, OneAnswerCubitState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<OneAnswerCubit>().initial();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                );
              },
            ),
            title: Text(tr(LocaleKeys.one_answer_quiz)),
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<OneAnswerBloc, OneAnswerState>(
            builder: (context, state) {
              switch (state.status) {
                case OneAnswerStatus.failure:
                  return const Center(child: Text('failed to fetch questions'));
                case OneAnswerStatus.success:
                  if (state.quizQuestions.isEmpty) {
                    return const Center(child: Text('no questions'));
                  }
                  return const OneAnswerQuizView();
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
