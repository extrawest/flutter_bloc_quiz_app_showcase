import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/error_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pages_list_screen.dart';
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
const String homeRoute = '/home';
const String pagesRoute = '/pages';
const String pagesDynamicRoute = ':id';
const String firstPageRoute = '/pages/1';

final goRouter = GoRouter(
  initialLocation: homeRoute,
  errorBuilder: (context, state) => ErrorScreen(state.error),
  routes: [
    GoRoute(
      path: homeRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: pagesRoute,
      pageBuilder: (context, state) => _TransitionPage(
        key: state.pageKey,
        child: const PagesListScreen(),
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
