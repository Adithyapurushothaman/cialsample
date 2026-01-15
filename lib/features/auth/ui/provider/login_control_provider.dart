import 'package:cial/core/provider/user_dao_provider.dart';
import 'package:cial/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final loginControllerProvider = AsyncNotifierProvider<LoginController, void>(
  LoginController.new,
);

class LoginController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncLoading();

    final userDao = ref.read(userDaoProvider);
    final role = await userDao.getUserRoleByEmail(email);

    if (role == null) {
      state = AsyncError('User not found', StackTrace.current);
      return;
    }

    state = const AsyncData(null);

    _navigateByRole(role, context);
  }

  void _navigateByRole(String role, BuildContext context) {
    switch (role) {
      case 'admin':
        context.go('/$AppRoute.adminPanel');
        break;
      case 'manager':
        context.go('/$AppRoute.managerPanel');
        break;
      case 'employee':
        context.go('/$AppRoute.employeePanel');
        break;
      default:
        context.go('/$AppRoute.employeePanel');
    }
  }
}
