import 'package:cial/core/routing/routes.dart';
import 'package:cial/features/auth/ui/screens/login_screen.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen.dart';
import 'package:cial/features/employee/ui/screen/add_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>(debugLabel: 'navigatorKey');

  late final GoRouter router;

  AppRouter(String initialLocation) {
    router = _createRouter(initialLocation);
  }

  static GoRouter _createRouter(String initialLocation) {
    final initial = initialLocation.startsWith('/')
        ? initialLocation
        : '/$initialLocation';

    return GoRouter(
      initialLocation: initial,
      navigatorKey: navKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/${AppRoute.login}',
          name: AppRoute.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/${AppRoute.dashboard}',
          name: AppRoute.dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/${AppRoute.employeeForm}',
          name: AppRoute.employeeForm,
          builder: (context, state) => const AddEmployeeScreen(),
        ),
      ],
    );
  }

  void dispose() {
    router.dispose();
  }
}
