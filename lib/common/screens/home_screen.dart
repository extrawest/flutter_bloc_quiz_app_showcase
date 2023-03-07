import 'package:bloc_quiz_training/common/assets.dart';
import 'package:bloc_quiz_training/common/router.dart';
import 'package:bloc_quiz_training/common/widgets/button_widget.dart';
import 'package:bloc_quiz_training/features/theme/theme.dart';
import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/theme/bloc/theme_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? animation;
  double? opacity;

  @override
  void initState() {
    opacity = 0;

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        if (mounted) {
          setState(() {
            if (_controller.isCompleted) {
              opacity = 1;
            }
          });
        }
      });

    animation =
        Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(milliseconds: 400), () {
      _controller.forward();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
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
                ButtonWidget(
                  buttonTitle: tr(LocaleKeys.true_false_quiz),
                  opacity: opacity,
                  animation: animation,
                  onTap: () {
                    context.go(pagesRoute);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                ButtonWidget(
                  buttonTitle: tr(LocaleKeys.one_answer_quiz),
                  opacity: opacity,
                  animation: animation,
                  onTap: () {
                    context.go(pagesRoute);
                  },
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
