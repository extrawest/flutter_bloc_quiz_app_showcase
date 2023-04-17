import 'package:bloc_quiz_training/features/settings_screen/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/history_screen/view/history_screen.dart';
import '../features/one_answer_quiz/view/screens/one_answer_quiz_screen.dart';
import '../features/true_false_quiz/view/screens/true_false_quiz_screen.dart';
import 'screens/error_screen.dart';
import 'screens/home_screen.dart';


const String homeScreenRoute = '/home';
const String trueFalseScreenRoute = '/trueFalse';
const String oneAnswerScreenRoute = '/oneAnswer';
const String historyScreenRoute = '/history';
const String settingsScreenRoute = '/settings';


final goRouter = GoRouter(
  initialLocation: homeScreenRoute,
  errorBuilder: (context, state) => ErrorScreen(state.error),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: homeScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: const SafeArea(child: HomeScreen()),
      ),
    ),
    GoRoute(
      path: oneAnswerScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: SafeArea(child: OneAnswerQuizScreen()),
      ),
    ),
    GoRoute(
      path: trueFalseScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child:  SafeArea(child: TrueFalseQuizScreen()),
      ),
    ),
    GoRoute(
      path: historyScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child:  const SafeArea(child: HistoryScreen()),
      ),
    ),
    GoRoute(
      path: settingsScreenRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child:  const SafeArea(child: SettingsScreen()),
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
