import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/true_false_bloc.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrueFalseBloc, TrueFalseState>(builder: (context, state) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Quiz Results',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: state.quizQuestions[index].rightAnswer == state.answeredQuestions[index]['answer']
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: const EdgeInsets.all(4),
                  child: Center(child: Text(state.quizQuestions[index].question!)),
                );
              },
              itemCount: state.quizQuestions.length,
            ),
          ),
        ],
      );
    });
  }
}
