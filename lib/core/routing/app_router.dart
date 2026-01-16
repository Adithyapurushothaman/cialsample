import 'package:cial/core/routing/routes.dart';
import 'package:cial/features/auth/ui/screens/login_screen.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen_contractor.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen_employee.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen_manager.dart';
import 'package:cial/features/employee/ui/screen/add_employee_screen.dart';
import 'package:cial/features/employee/ui/screen/employee_list_screen.dart';
import 'package:cial/features/home/ui/screen/home_shell.dart';
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
          path: '/$AppRoute.home',
          builder: (context, state) => const HomeShell(),
        ),

        GoRoute(
          path: '/$AppRoute.adminPanel',
          builder: (context, state) => const DashboardContractorScreen(),
        ),
        GoRoute(
          path: '/$AppRoute.managerPanel',
          builder: (context, state) => const DashboardManagerScreen(),
        ),
        GoRoute(
          path: '/$AppRoute.employeePanel',
          builder: (context, state) => const DashboardScreenEmployee(),
        ),
        GoRoute(
          path: '/${AppRoute.employeeForm}',
          name: AppRoute.employeeForm,
          builder: (context, state) => const AddEmployeeScreen(),
        ),
        GoRoute(
          path: '/${AppRoute.employeeList}',
          name: AppRoute.employeeList,
          builder: (context, state) => EmployeeDetailsScreen(),
        ),
      ],
    );
  }

  void dispose() {
    router.dispose();
  }
}
