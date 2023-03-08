import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home_screen/view/home_screen.dart';
import '../one_answer_quiz_screen/view/one_answer_quiz_screen.dart';
import 'screens/error_screen.dart';
import 'widgets/page_widget.dart';

/* * * * * * * * * * * *
*
* /home
* /pages
*     /pages/1
*     /pages/2
*     ...
*     /pages/test
*
* * * * * * * * * * * */
const String homeScreenRoute = '/home';
const String trueFalseScreenRoute = '/trueFalse';
const String oneAnswerScreenRoute = '/oneAnswer';
const String pagesRoute = '/pages';
const String pagesDynamicRoute = ':id';
const String firstPageRoute = '/pages/1';

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
        child: const OneAnswerQuizScreen(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: pagesDynamicRoute,
          // builder: (BuildContext context, GoRouterState state) {
          //   return const PageWidget();
          // },
          pageBuilder: (context, state) => _TransitionPage(
            key: state.pageKey,
            child: const PageWidget(),
          ),
        ),
      ],
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
