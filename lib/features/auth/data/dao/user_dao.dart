import 'package:cial/core/db/app_database.dart'
    show $UserTable, AppDatabase, UserData, UserCompanion;
import 'package:cial/features/auth/data/model/user_model.dart';
import 'package:drift/drift.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  /// Insert a user
  Future<int> addUser(UserCompanion user) =>
      into(db.user).insert(user, mode: InsertMode.insertOrReplace);

  Future<UserData?> getUser() {
    return select(db.user).getSingleOrNull();
  }

  Future<String?> getUserRole() async {
    final user = await getUser();
    return user?.role;
  }

  Future<String?> getUserRoleByEmail(String email) async {
    final query = select(db.user)..where((u) => u.email.equals(email));

    final user = await query.getSingleOrNull();
    return user?.role;
  }
}
