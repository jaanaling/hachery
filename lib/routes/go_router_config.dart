import 'package:chicken_hatchery/src/feature/rituals/model/articles.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/add_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/article_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/articles_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/monitoring_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/presentation/statistic_screen.dart';
import 'package:chicken_hatchery/src/feature/rituals/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    path: RouteValue.articles.path,
                    pageBuilder: (context, state) => NoTransitionPage(
                          child: ArticlesScreen(
                            key: UniqueKey(),
                          ),
                        ),
                    routes: [
                      GoRoute(
                        path: RouteValue.article.path,
                        pageBuilder: (context, state) => NoTransitionPage(
                          child: ArticleScreen(
                            articles: state.extra as Articles,
                            key: UniqueKey(),
                          ),
                        ),
                      ),
                    ]),
                GoRoute(
                  path: RouteValue.add.path,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: AddScreen(
                      key: UniqueKey(),
                    ),
                  ),
                ),
                GoRoute(
                  path: RouteValue.monitoring.path,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: MonitoringScreen(
                      key: UniqueKey(),
                    ),
                  ),
                ),
                GoRoute(
                  path: RouteValue.statistic.path,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: StatisticScreen(
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
