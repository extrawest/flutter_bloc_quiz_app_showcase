import 'package:bloc_quiz_training/common/assets.dart';
import 'package:bloc_quiz_training/common/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/theme/bloc/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(
                quizLogo,
              ),
            ),
            Column(
              children: [
                FilledButton(
                  onPressed: () {
                    context.go(pagesRoute);
                  },
                  child: const Text('True or False Quiz'),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<ThemeBloc>().switchTheme();
                  },
                  child: const Text('One Answer Quiz'),
                ),
              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
