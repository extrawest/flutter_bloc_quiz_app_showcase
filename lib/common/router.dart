import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/one_answer_quiz/view/one_answer_quiz_screen.dart';
import '../features/true_false_quiz/view/true_false_quiz_screen.dart';
import '../home_screen/view/home_screen.dart';
import 'screens/error_screen.dart';


const String homeScreenRoute = '/home';
const String trueFalseScreenRoute = '/trueFalse';
const String oneAnswerScreenRoute = '/oneAnswer';


final goRouter = GoRouter(
  initialLocation: homeScreenRoute,
  errorBuilder: (context, state) => ErrorScreen(state.error),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: homeScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: oneAnswerScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: OneAnswerQuizScreen(),
      ),
    ),
    GoRoute(
      path: trueFalseScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: const TrueFalseQuizScreen(),
      ),
    ),
  ],
);

class _TransitionPage extends CustomTransitionPage {
  _TransitionPage({LocalKey? key, required Widget child})
      : super(
          key: key,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
              // create your own or use an existing one
              // ScaleTransition(scale: animation, child: child),
        );
}
