import 'dart:io';
import 'package:cial/features/auth/data/dao/user_dao.dart';
import 'package:cial/features/auth/data/model/user_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [User], daos: [UserDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      await batch((batch) {
        batch.insertAll(user, [
          UserCompanion(
            email: const Value('admin@abcinc.com'),
            name: const Value('ABC construction'),
            role: const Value('admin'),
          ),
          UserCompanion(
            email: const Value('adithya@abcinc.com'),
            name: const Value('Adithya P'),
            role: const Value('employee'),
          ),
          UserCompanion(
            email: const Value('krishnakumar@cialinc.com'),
            name: const Value('Krishna Kumar'),
            role: const Value('manager'),
          ),
        ]);
      });
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}
