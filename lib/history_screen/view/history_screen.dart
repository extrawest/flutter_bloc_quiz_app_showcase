import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/utils/app_utils.dart';
import '../../features/storage/quiz_storage_bloc.dart';

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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(dateFormat.format(DateTime.fromMillisecondsSinceEpoch(state.quizList![index].date))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('wrong answers: ${state.quizList![index].wrongAnswers}'),
                            Text('right answers: ${state.quizList![index].rightAnswers}'),
                          ],
                        ),
                        Text(state.quizList![index].quizType.isOneAnswerQuiz ? 'One Answer' : ' True-False')
                      ],
                    ),
                  );
                },
                itemCount: state.quizList?.length,
              )
            : const Center(
                child: Text('You have no history'),
              );
      }),
    );
  }
}
