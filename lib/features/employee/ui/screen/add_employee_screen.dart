// import 'package:cial/features/employee/ui/provider/employee_form_provider.dart';
// import 'package:cial/features/employee/ui/widget/action_button.dart';
// import 'package:cial/features/employee/ui/widget/upload_document_card.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AddEmployeeScreen extends ConsumerStatefulWidget {
//   const AddEmployeeScreen({super.key});

//   @override
//   ConsumerState<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
// }

// class _AddEmployeeScreenState extends ConsumerState<AddEmployeeScreen> {
//   late final TextEditingController _nameCtrl;
//   late final TextEditingController _aadhaarCtrl;
//   late final TextEditingController _mobileCtrl;
//   late final TextEditingController _emailCtrl;
//   late final TextEditingController _addressCtrl;

//   @override
//   void initState() {
//     super.initState();
//     final state = ref.read(employeeFormProvider);

//     _nameCtrl = TextEditingController(text: state.fullName);
//     _aadhaarCtrl = TextEditingController(text: state.aadhaar);
//     _mobileCtrl = TextEditingController(text: state.mobile);
//     _emailCtrl = TextEditingController(text: state.email);
//     _addressCtrl = TextEditingController(text: state.address);
//   }

//   @override
//   void dispose() {
//     _nameCtrl.dispose();
//     _aadhaarCtrl.dispose();
//     _mobileCtrl.dispose();
//     _emailCtrl.dispose();
//     _addressCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(employeeFormProvider);
//     final notifier = ref.read(employeeFormProvider.notifier);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Card(
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Employee Details",
//                           style: TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(height: 16),

//                         _label("Employee Full Name *"),
//                         TextField(
//                           controller: _nameCtrl,
//                           onChanged: notifier.updateFullName,
//                           decoration: const InputDecoration(
//                             hintText: "Enter full name as per Aadhaar",
//                           ),
//                         ),

//                         _gap(),

//                         _label("Aadhaar Number *"),
//                         TextField(
//                           controller: _aadhaarCtrl,
//                           keyboardType: TextInputType.number,
//                           maxLength: 12,
//                           onChanged: notifier.updateAadhaar,
//                           decoration: const InputDecoration(
//                             hintText: "12-digit Aadhaar number",
//                             counterText: "",
//                           ),
//                         ),

//                         _gap(),

//                         _label("Mobile Number *"),
//                         TextField(
//                           controller: _mobileCtrl,
//                           keyboardType: TextInputType.phone,
//                           maxLength: 10,
//                           onChanged: notifier.updateMobile,
//                           decoration: const InputDecoration(
//                             hintText: "10-digit mobile number",
//                             counterText: "",
//                           ),
//                         ),

//                         _gap(),

//                         _label("Email"),
//                         TextField(
//                           controller: _emailCtrl,
//                           keyboardType: TextInputType.emailAddress,
//                           onChanged: notifier.updateEmail,
//                           decoration: const InputDecoration(
//                             hintText: "Enter email id",
//                           ),
//                         ),

//                         _gap(),

//                         _label("Role Assignment *"),
//                         DropdownButtonFormField<String>(
//                           value: state.role.isEmpty ? null : state.role,
//                           hint: const Text("Select"),
//                           items: const [
//                             DropdownMenuItem(
//                               value: "labour",
//                               child: Text("Labour"),
//                             ),
//                             DropdownMenuItem(
//                               value: "supervisor",
//                               child: Text("Supervisor"),
//                             ),
//                             DropdownMenuItem(
//                               value: "engineer",
//                               child: Text("Engineer"),
//                             ),
//                             DropdownMenuItem(
//                               value: "manager",
//                               child: Text("Manager"),
//                             ),
//                           ],
//                           onChanged: (v) => notifier.updateRole(v ?? ''),
//                         ),

//                         _gap(),

//                         _label("Airport Pass Category *"),
//                         DropdownButtonFormField<String>(
//                           value: state.passCategory.isEmpty
//                               ? null
//                               : state.passCategory,
//                           hint: const Text("Select"),
//                           items: const [
//                             DropdownMenuItem(
//                               value: "temporary",
//                               child: Text("Temporary"),
//                             ),
//                             DropdownMenuItem(
//                               value: "permanent",
//                               child: Text("Permanent"),
//                             ),
//                             DropdownMenuItem(
//                               value: "visitor",
//                               child: Text("Visitor"),
//                             ),
//                           ],
//                           onChanged: (v) =>
//                               notifier.updatePassCategory(v ?? ''),
//                         ),

//                         _gap(),

//                         _label("Locations *"),
//                         DropdownButtonFormField<String>(
//                           value: state.location.isEmpty ? null : state.location,
//                           hint: const Text("Select"),
//                           items: const [
//                             DropdownMenuItem(
//                               value: "terminal1",
//                               child: Text("Terminal 1"),
//                             ),
//                             DropdownMenuItem(
//                               value: "terminal2",
//                               child: Text("Terminal 2"),
//                             ),
//                             DropdownMenuItem(
//                               value: "cargo",
//                               child: Text("Cargo Area"),
//                             ),
//                             DropdownMenuItem(
//                               value: "maintenance",
//                               child: Text("Maintenance Area"),
//                             ),
//                           ],
//                           onChanged: (v) => notifier.updateLocation(v ?? ''),
//                         ),

//                         _gap(),

//                         _label("Address *"),
//                         TextField(
//                           controller: _addressCtrl,
//                           maxLines: 3,
//                           onChanged: notifier.updateAddress,
//                           decoration: const InputDecoration(
//                             hintText: "Current residential address",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static Widget _gap() => const SizedBox(height: 16);

//   static Widget _label(String text) => Padding(
//     padding: const EdgeInsets.only(bottom: 6),
//     child: Text(
//       text,
//       style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//     ),
//   );
// }
import 'package:cial/core/widget/app_bar.dart';
import 'package:cial/features/employee/data/enum/employee_submit_status.dart';
import 'package:cial/features/employee/ui/provider/employee_form_provider.dart';
import 'package:cial/features/employee/ui/widget/action_button.dart';
import 'package:cial/features/employee/ui/widget/dialogbox/error.dart';
import 'package:cial/features/employee/ui/widget/dialogbox/success.dart';
import 'package:cial/features/employee/ui/widget/upload_document_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        subtitle: "Register a new employee by filling the details below.",
        onMenuTap: () {
          // open drawer / logout menu
        },
      ),
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            /// =======================
            /// SCROLLABLE CONTENT
            /// =======================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// Employee Details Card
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Employee Details",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),

                            _label("Employee Full Name *"),
                            TextField(
                              controller: _nameCtrl,
                              onChanged: notifier.updateFullName,
                            ),

                            _gap(),
                            _label("Aadhaar Number *"),
                            TextField(
                              controller: _aadhaarCtrl,
                              keyboardType: TextInputType.number,
                              maxLength: 12,
                              onChanged: notifier.updateAadhaar,
                              decoration: const InputDecoration(
                                counterText: "",
                              ),
                            ),

                            _gap(),
                            _label("Mobile Number *"),
                            TextField(
                              controller: _mobileCtrl,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              onChanged: notifier.updateMobile,
                              decoration: const InputDecoration(
                                counterText: "",
                              ),
                            ),

                            _gap(),
                            _label("Email"),
                            TextField(
                              controller: _emailCtrl,
                              onChanged: notifier.updateEmail,
                            ),

                            _gap(),
                            _label("Role Assignment *"),
                            DropdownButtonFormField<String>(
                              value: state.role.isEmpty ? null : state.role,
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
                              onChanged: (v) => notifier.updateRole(v ?? ''),
                            ),

                            _gap(),
                            _label("Airport Pass Category *"),
                            DropdownButtonFormField<String>(
                              value: state.passCategory.isEmpty
                                  ? null
                                  : state.passCategory,
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
                              onChanged: (v) =>
                                  notifier.updatePassCategory(v ?? ''),
                            ),

                            _gap(),
                            _label("Locations *"),
                            DropdownButtonFormField<String>(
                              value: state.location.isEmpty
                                  ? null
                                  : state.location,
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
                              onChanged: (v) =>
                                  notifier.updateLocation(v ?? ''),
                            ),

                            _gap(),
                            _label("Address *"),
                            TextField(
                              controller: _addressCtrl,
                              maxLines: 3,
                              onChanged: notifier.updateAddress,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Upload Documents Card
                    UploadDocumentsCard(
                      onUploadId: () {
                        debugPrint("Upload ID clicked");
                      },
                      onUploadPoliceClearance: () {
                        debugPrint("Upload Police Clearance clicked");
                      },
                      onUploadPhoto: () {
                        debugPrint("Upload Photo clicked");
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// =======================
            /// STICKY BOTTOM BUTTONS
            /// =======================
            ActionButtons(
              onCancel: () {
                notifier.reset();
                _clearControllers();
                Navigator.pop(context);
              },
              onSubmit: () async {
                if (!_formKey.currentState!.validate()) return;

                final result = await notifier.submit();

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
