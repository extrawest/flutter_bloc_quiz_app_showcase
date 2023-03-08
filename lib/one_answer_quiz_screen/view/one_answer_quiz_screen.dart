import 'package:bloc_quiz_training/common/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OneAnswerQuizScreen extends StatelessWidget {
  const OneAnswerQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Go to $homeScreenRoute'),
            ),
          ],
        ),
      ),
    );
  }
}
