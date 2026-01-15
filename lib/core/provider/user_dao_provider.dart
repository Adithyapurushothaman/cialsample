import 'package:cial/core/provider/app_database_provider.dart';
import 'package:cial/features/auth/data/dao/user_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDaoProvider = Provider<UserDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return UserDao(db);
});
