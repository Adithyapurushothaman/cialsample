import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'employee_form_state.dart';

part 'employee_form_provider.g.dart';

@riverpod
class EmployeeForm extends _$EmployeeForm {
  @override
  EmployeeFormState build() {
    return const EmployeeFormState();
  }

  void updateFullName(String value) {
    state = state.copyWith(fullName: value);
  }

  void updateAadhaar(String value) {
    state = state.copyWith(aadhaar: value);
  }

  void updateMobile(String value) {
    state = state.copyWith(mobile: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updateRole(String value) {
    state = state.copyWith(role: value);
  }

  void updatePassCategory(String value) {
    state = state.copyWith(passCategory: value);
  }

  void updateLocation(String value) {
    state = state.copyWith(location: value);
  }

  void updateAddress(String value) {
    state = state.copyWith(address: value);
  }

  void reset() {
    state = const EmployeeFormState();
  }

  Future<void> submit() async {
    // API integration goes here
    print("Submitting employee form:");
    print(state);
  }
}
