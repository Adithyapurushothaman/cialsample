import 'package:cial/core/db/app_database.dart'
    show $EmployeesTable, AppDatabase, EmployeesCompanion;
import 'package:cial/features/employee/data/model/employee.dart';
import 'package:drift/drift.dart';

part 'employee_dao.g.dart';

@DriftAccessor(tables: [Employees])
class EmployeeDao extends DatabaseAccessor<AppDatabase>
    with _$EmployeeDaoMixin {
  EmployeeDao(super.db);

  /// Insert employee
  Future<int> addEmployee(EmployeesCompanion employee) {
    return into(
      db.employees,
    ).insert(employee, mode: InsertMode.insertOrReplace);
  }

  /// Delete employee
  Future<int> deleteEmployee(int id) {
    return (delete(db.employees)..where((e) => e.id.equals(id))).go();
  }
}
