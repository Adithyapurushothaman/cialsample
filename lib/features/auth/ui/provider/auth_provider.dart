import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

enum UserRole {
  employee,
  manager,
  contractor, // admin
}

class AuthState {
  final bool isLoggedIn;
  final UserRole? role;

  AuthState({required this.isLoggedIn, this.role});
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(isLoggedIn: false));

  void login(UserRole role) {
    state = AuthState(isLoggedIn: true, role: role);
  }

  void logout() {
    state = AuthState(isLoggedIn: false);
  }
}
