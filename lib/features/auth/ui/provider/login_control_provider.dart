import 'package:cial/core/provider/user_dao_provider.dart';
import 'package:cial/core/routing/routes.dart';
import 'package:cial/features/auth/ui/provider/auth_provider.dart';
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
    final roleFromDb = await userDao.getUserRoleByEmail(email);

    if (roleFromDb == null) {
      state = AsyncError('User not found', StackTrace.current);
      return;
    }

    final userRole = _mapRole(roleFromDb);

    /// 🔥 SAVE ROLE GLOBALLY
    ref.read(authProvider.notifier).login(userRole);

    state = const AsyncData(null);

    /// 🔥 SINGLE HOME
    context.go('/$AppRoute.home');
  }

  UserRole _mapRole(String role) {
    switch (role) {
      case 'admin':
        return UserRole.contractor;
      case 'manager':
        return UserRole.manager;
      case 'employee':
      default:
        return UserRole.employee;
    }
  }
}
