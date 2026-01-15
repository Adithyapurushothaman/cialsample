import 'package:cial/core/routing/routes.dart';
import 'package:cial/core/widget/app_bar.dart';
import 'package:cial/features/employee/data/enum/employee_submit_status.dart';
import 'package:cial/features/employee/ui/provider/employee_form_provider.dart';
import 'package:cial/features/employee/ui/widget/action_button.dart';
import 'package:cial/features/employee/ui/widget/dialogbox/error.dart';
import 'package:cial/features/employee/ui/widget/dialogbox/success.dart';
import 'package:cial/features/employee/ui/widget/upload_document_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddEmployeeScreen extends ConsumerStatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  ConsumerState<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends ConsumerState<AddEmployeeScreen> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _aadhaarCtrl;
  late final TextEditingController _mobileCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _addressCtrl;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final state = ref.read(employeeFormProvider);

    _nameCtrl = TextEditingController(text: state.fullName);
    _aadhaarCtrl = TextEditingController(text: state.aadhaar);
    _mobileCtrl = TextEditingController(text: state.mobile);
    _emailCtrl = TextEditingController(text: state.email);
    _addressCtrl = TextEditingController(text: state.address);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _aadhaarCtrl.dispose();
    _mobileCtrl.dispose();
    _emailCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  void _clearControllers() {
    _nameCtrl.clear();
    _aadhaarCtrl.clear();
    _mobileCtrl.clear();
    _emailCtrl.clear();
    _addressCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(employeeFormProvider);
    final notifier = ref.read(employeeFormProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Employee',
        subtitle: 'Register a new employee by filling the details below.',
        roleText: "Contractor Admin",
        onProfileTap: () {},
        onLogoutTap: () {
          context.goNamed(AppRoute.login);
        },
      ),
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Employee Details",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),

                      _label("Employee Full Name *"),
                      TextFormField(
                        controller: _nameCtrl,
                        onChanged: notifier.updateFullName,
                        validator: (v) =>
                            v == null || v.isEmpty ? 'Name is required' : null,
                      ),

                      _gap(),
                      _label("Aadhaar Number *"),
                      TextFormField(
                        controller: _aadhaarCtrl,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        decoration: const InputDecoration(counterText: ""),
                        onChanged: notifier.updateAadhaar,
                        validator: (v) => v == null || v.length != 12
                            ? 'Enter valid Aadhaar'
                            : null,
                      ),

                      _gap(),
                      _label("Mobile Number *"),
                      TextFormField(
                        controller: _mobileCtrl,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: const InputDecoration(counterText: ""),
                        onChanged: notifier.updateMobile,
                        validator: (v) => v == null || v.length != 10
                            ? 'Enter valid mobile number'
                            : null,
                      ),

                      _gap(),
                      _label("Email"),
                      TextFormField(
                        controller: _emailCtrl,
                        onChanged: notifier.updateEmail,
                        validator: (v) {
                          if (v == null || v.isEmpty) return null;
                          return RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(v)
                              ? null
                              : 'Invalid email';
                        },
                      ),

                      _gap(),
                      _label("Role Assignment *"),
                      DropdownButtonFormField<String>(
                        value: state.role.isEmpty ? null : state.role,
                        validator: (v) => v == null ? 'Select role' : null,
                        items: const [
                          DropdownMenuItem(
                            value: "labour",
                            child: Text("Labour"),
                          ),
                          DropdownMenuItem(
                            value: "supervisor",
                            child: Text("Supervisor"),
                          ),
                          DropdownMenuItem(
                            value: "engineer",
                            child: Text("Engineer"),
                          ),
                          DropdownMenuItem(
                            value: "manager",
                            child: Text("Manager"),
                          ),
                        ],
                        onChanged: (v) => notifier.updateRole(v!),
                      ),

                      _gap(),
                      _label("Airport Pass Category *"),
                      DropdownButtonFormField<String>(
                        value: state.passCategory.isEmpty
                            ? null
                            : state.passCategory,
                        validator: (v) =>
                            v == null ? 'Select pass category' : null,
                        items: const [
                          DropdownMenuItem(
                            value: "temporary",
                            child: Text("Temporary"),
                          ),
                          DropdownMenuItem(
                            value: "permanent",
                            child: Text("Permanent"),
                          ),
                          DropdownMenuItem(
                            value: "visitor",
                            child: Text("Visitor"),
                          ),
                        ],
                        onChanged: (v) => notifier.updatePassCategory(v!),
                      ),

                      _gap(),
                      _label("Location *"),
                      DropdownButtonFormField<String>(
                        value: state.location.isEmpty ? null : state.location,
                        validator: (v) => v == null ? 'Select location' : null,
                        items: const [
                          DropdownMenuItem(
                            value: "terminal1",
                            child: Text("Terminal 1"),
                          ),
                          DropdownMenuItem(
                            value: "terminal2",
                            child: Text("Terminal 2"),
                          ),
                          DropdownMenuItem(
                            value: "cargo",
                            child: Text("Cargo Area"),
                          ),
                          DropdownMenuItem(
                            value: "maintenance",
                            child: Text("Maintenance Area"),
                          ),
                        ],
                        onChanged: (v) => notifier.updateLocation(v!),
                      ),

                      _gap(),
                      _label("Address *"),
                      TextFormField(
                        controller: _addressCtrl,
                        maxLines: 3,
                        onChanged: notifier.updateAddress,
                        validator: (v) => v == null || v.isEmpty
                            ? 'Address is required'
                            : null,
                      ),

                      const SizedBox(height: 16),
                      UploadDocumentsCard(
                        onUploadId: () {},
                        onUploadPoliceClearance: () {},
                        onUploadPhoto: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ActionButtons(
              onCancel: () {
                notifier.reset();
                _clearControllers();
                Navigator.pop(context);
              },
              onSubmit: () async {
                final isValid = _formKey.currentState?.validate() ?? false;
                if (!isValid) return;

                final result = await notifier.submit();

                if (!mounted) return;

                switch (result) {
                  case EmployeeSubmitResult.success:
                    _clearControllers();
                    await showSuccessDialog(
                      context,
                      title: 'Success',
                      message: 'Added Employee Successfully',
                    );
                    break;

                  case EmployeeSubmitResult.validationError:
                    await showErrorDialog(
                      context,
                      'Please fill all required fields',
                    );
                    break;

                  case EmployeeSubmitResult.duplicateAadhaar:
                    await showErrorDialog(context, 'Aadhaar already exists');
                    break;

                  case EmployeeSubmitResult.failure:
                    await showErrorDialog(context, 'Something went wrong');
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _gap() => const SizedBox(height: 16);

  static Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
    ),
  );
}
