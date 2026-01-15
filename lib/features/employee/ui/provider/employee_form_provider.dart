import 'package:cial/core/db/app_database.dart';
import 'package:cial/core/provider/app_database_provider.dart';
import 'package:cial/features/employee/data/dao/employee_dao.dart';
import 'package:cial/features/employee/data/enum/employee_submit_status.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';

import 'employee_form_state.dart';

part 'employee_form_provider.g.dart';

@riverpod
class EmployeeForm extends _$EmployeeForm {
  late final EmployeeDao _employeeDao;

  @override
  EmployeeFormState build() {
    _employeeDao = EmployeeDao(ref.read(appDatabaseProvider));
    return const EmployeeFormState();
  }

  void updateFullName(String value) =>
      state = state.copyWith(fullName: value.trim());

  void updateAadhaar(String value) =>
      state = state.copyWith(aadhaar: value.trim());

  void updateMobile(String value) =>
      state = state.copyWith(mobile: value.trim());

  void updateEmail(String value) => state = state.copyWith(email: value.trim());

  void updateRole(String value) => state = state.copyWith(role: value);

  void updatePassCategory(String value) =>
      state = state.copyWith(passCategory: value);

  void updateLocation(String value) => state = state.copyWith(location: value);

  void updateAddress(String value) =>
      state = state.copyWith(address: value.trim());

  void reset() {
    state = const EmployeeFormState();
  }

  Future<EmployeeSubmitResult> submit() async {
    // ✅ Validation first (no try/catch)
    if (!state.isValid) {
      return EmployeeSubmitResult.validationError;
    }

    try {
      await _employeeDao.addEmployee(
        EmployeesCompanion(
          fullName: Value(state.fullName),
          aadhaar: Value(state.aadhaar),
          mobile: Value(state.mobile),
          email: state.email.isEmpty
              ? const Value.absent()
              : Value(state.email),
          role: Value(state.role),
          passCategory: Value(state.passCategory),
          location: Value(state.location),
          address: Value(state.address),
        ),
      );

      reset();
      return EmployeeSubmitResult.success;
    } on SqliteException catch (e) {
      debugPrint('SQLITE ERROR MESSAGE: ${e.message}');
      debugPrint('SQLITE ERROR CODE: ${e.extendedResultCode}');
      // debugPrintStack(stackTrace: st);
      rethrow;
      // return EmployeeSubmitResult.failure;
    } catch (e, st) {
      debugPrint('EMPLOYEE SUBMIT ERROR: $e');
      debugPrintStack(stackTrace: st);
      return EmployeeSubmitResult.failure;
    }
  }
}
