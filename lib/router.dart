import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testproject/enums/app_pages.dart';
import 'package:testproject/enums/auth_status.dart';

import 'pages/all_pages.dart';
import 'pages/main_page.dart';
import 'state/auth_state_provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routeProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainPage(
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppPages.home.toPath,
            name: AppPages.home.name,
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: AppPages.settings.toPath,
            name: AppPages.settings.name,
            builder: (context, state) {
              return const SettingsPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: AppPages.login.toPath,
        name: AppPages.login.name,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    redirect: (context, state) {
      final authenticated = authState.status == AuthStatus.authenticated;
      if (!authenticated) {
        return AppPages.login.toPath;
      }

      return null;
    },
  );
});
