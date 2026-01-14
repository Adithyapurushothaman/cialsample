// employee_form_state.dart
class EmployeeFormState {
  final String fullName;
  final String aadhaar;
  final String mobile;
  final String email;
  final String role;
  final String passCategory;
  final String location;
  final String address;

  const EmployeeFormState({
    this.fullName = '',
    this.aadhaar = '',
    this.mobile = '',
    this.email = '',
    this.role = '',
    this.passCategory = '',
    this.location = '',
    this.address = '',
  });

  EmployeeFormState copyWith({
    String? fullName,
    String? aadhaar,
    String? mobile,
    String? email,
    String? role,
    String? passCategory,
    String? location,
    String? address,
  }) {
    return EmployeeFormState(
      fullName: fullName ?? this.fullName,
      aadhaar: aadhaar ?? this.aadhaar,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      role: role ?? this.role,
      passCategory: passCategory ?? this.passCategory,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return '''
EmployeeFormState(
  fullName: $fullName,
  aadhaar: $aadhaar,
  mobile: $mobile,
  email: $email,
  role: $role,
  passCategory: $passCategory,
  location: $location,
  address: $address
)
''';
  }
}
