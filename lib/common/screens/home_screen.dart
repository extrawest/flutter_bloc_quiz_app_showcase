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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                FilledButton(
                  onPressed: () {
                    context.go(pagesRoute);
                  },
                  child: const Text('Go to List Of Pages'),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<ThemeBloc>().switchTheme();
                  },
                  child: const Text('Switch Theme'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
