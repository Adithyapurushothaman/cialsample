// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmployeeForm)
final employeeFormProvider = EmployeeFormProvider._();

final class EmployeeFormProvider
    extends $NotifierProvider<EmployeeForm, EmployeeFormState> {
  EmployeeFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeFormHash();

  @$internal
  @override
  EmployeeForm create() => EmployeeForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeeFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeeFormState>(value),
    );
  }
}

String _$employeeFormHash() => r'78709232ad57b15091f1748ef6b575353a590155';

abstract class _$EmployeeForm extends $Notifier<EmployeeFormState> {
  EmployeeFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EmployeeFormState, EmployeeFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmployeeFormState, EmployeeFormState>,
              EmployeeFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
