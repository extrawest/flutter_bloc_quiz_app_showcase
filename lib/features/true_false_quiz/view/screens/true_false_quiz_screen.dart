import 'package:bloc_quiz_training/common/widgets/alert_dialog.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/bloc/true_false_bloc.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/cubit/true_false_translate_cubit.dart';
import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/true_false_quiz_repository.dart';
import '../widgets/true_false_quiz_view_widget.dart';

class TrueFalseQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                TrueFalseBloc(trueFalseQuizRepository: RepositoryProvider.of<TrueFalseQuizRepositoryImpl>(context))
                  ..add(TrueFalseFetchEvent()),
          ),
          BlocProvider(create: (context) => TrueFalseTranslateCubit())
        ],
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
              appBar: AppBar(
                title: Text(tr(LocaleKeys.true_false_quiz)),
                centerTitle: true,
                leading: BlocBuilder<TrueFalseBloc, TrueFalseState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        if (state.answeredQuestions.isEmpty) {
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return const AlertDialogWidget();
                            },
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    );
                  },
                ),
              ),
              body: BlocBuilder<TrueFalseBloc, TrueFalseState>(
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
              )),
        ));
  }
}
