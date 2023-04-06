import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/app_utils.dart';
import '../../../generated/locale_keys.g.dart';
import '../../storage/quiz_storage_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<QuizStorageBloc, QuizStorageState>(builder: (context, state) {
        return state.quizList!.isNotEmpty
            ? ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).colorScheme.primary)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(dateFormat.format(DateTime.fromMillisecondsSinceEpoch(state.quizList![index].date))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${tr(LocaleKeys.wrong_answers)}: ${state.quizList![index].wrongAnswers}'),
                            Text('${tr(LocaleKeys.right_answers)}: ${state.quizList![index].rightAnswers}'),
                          ],
                        ),
                        Text(state.quizList![index].quizType.isOneAnswerQuiz
                            ? tr(LocaleKeys.one_answer)
                            : tr(LocaleKeys.true_false))
                      ],
                    ),
                  );
                },
                itemCount: state.quizList?.length,
              )
            : Center(
                child: Text(tr(LocaleKeys.have_no_history)),
              );
      }),
    );
  }
}
