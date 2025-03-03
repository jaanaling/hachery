import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chicken_hatchery/src/feature/rituals/model/gods.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/calendar_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/home_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/info_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/pie_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/task_screen.dart';

import '../src/feature/splash/presentation/screens/splash_screen.dart';
import 'root_navigation_screen.dart';
import 'route_value.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();

GoRouter buildGoRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteValue.splash.path,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
          child: RootNavigationScreen(
            navigationShell: navigationShell,
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteValue.home.path,
              builder: (context, state) => HomeScreen(key: UniqueKey()),
              routes: [
                GoRoute(
                    path: RouteValue.info.path,
                    pageBuilder: (context, state) => NoTransitionPage(
                          child: InfoScreen(
                            key: UniqueKey(),
                          ),
                        ),
                    routes: [
                      GoRoute(
                        path: RouteValue.task.path,
                        pageBuilder: (context, state) => NoTransitionPage(
                          child: TaskScreen(
                            god: state.extra as Gods,
                            key: UniqueKey(),
                          ),
                        ),
                      ),
                    ]),
                GoRoute(
                  path: RouteValue.calendar.path,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: CalendarScreen(
                      key: UniqueKey(),
                    ),
                  ),
                ), GoRoute(
                  path: RouteValue.pie.path,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: PieScreen(
                      key: UniqueKey(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
          child: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.black,
            child: child,
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteValue.splash.path,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
      ],
    ),
  ],
);
