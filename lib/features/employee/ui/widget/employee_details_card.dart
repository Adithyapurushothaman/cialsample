import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/employee_form_provider.dart';

class EmployeeDetailsCard extends ConsumerWidget {
  const EmployeeDetailsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeFormProvider);
    final notifier = ref.read(employeeFormProvider.notifier);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

            _InputLabel("Employee Full Name *"),
            TextField(
              onChanged: notifier.updateFullName,
              decoration: const InputDecoration(
                hintText: "Enter full name as per Aadhaar",
              ),
            ),

            _gap(),

            _InputLabel("Aadhaar Number *"),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 12,
              onChanged: notifier.updateAadhaar,
              decoration: const InputDecoration(
                hintText: "12-digit Aadhaar number",
                counterText: "",
              ),
            ),

            _gap(),

            _InputLabel("Mobile Number *"),
            TextField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              onChanged: notifier.updateMobile,
              decoration: const InputDecoration(
                hintText: "10-digit mobile number",
                counterText: "",
              ),
            ),

            _gap(),

            _InputLabel("Email"),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: notifier.updateEmail,
              decoration: const InputDecoration(hintText: "Enter email id"),
            ),

            _gap(),

            _InputLabel("Role Assignment *"),
            DropdownButtonFormField<String>(
              value: state.role.isEmpty ? null : state.role,
              items: const [
                DropdownMenuItem(value: "labour", child: Text("Labour")),
                DropdownMenuItem(
                  value: "supervisor",
                  child: Text("Supervisor"),
                ),
                DropdownMenuItem(value: "engineer", child: Text("Engineer")),
                DropdownMenuItem(value: "manager", child: Text("Manager")),
              ],
              onChanged: (value) {
                if (value != null) notifier.updateRole(value);
              },
            ),

            _gap(),

            _InputLabel("Airport Pass Category *"),
            DropdownButtonFormField<String>(
              value: state.passCategory.isEmpty ? null : state.passCategory,
              items: const [
                DropdownMenuItem(value: "temporary", child: Text("Temporary")),
                DropdownMenuItem(value: "permanent", child: Text("Permanent")),
                DropdownMenuItem(value: "visitor", child: Text("Visitor")),
              ],
              onChanged: (value) {
                if (value != null) notifier.updatePassCategory(value);
              },
            ),

            _gap(),

            _InputLabel("Locations *"),
            DropdownButtonFormField<String>(
              value: state.location.isEmpty ? null : state.location,
              items: const [
                DropdownMenuItem(value: "terminal1", child: Text("Terminal 1")),
                DropdownMenuItem(value: "terminal2", child: Text("Terminal 2")),
                DropdownMenuItem(value: "cargo", child: Text("Cargo Area")),
                DropdownMenuItem(
                  value: "maintenance",
                  child: Text("Maintenance Area"),
                ),
              ],
              onChanged: (value) {
                if (value != null) notifier.updateLocation(value);
              },
            ),

            _gap(),

            _InputLabel("Address *"),
            TextField(
              maxLines: 3,
              onChanged: notifier.updateAddress,
              decoration: const InputDecoration(
                hintText: "Current residential address",
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _gap() => const SizedBox(height: 16);
}

class _InputLabel extends StatelessWidget {
  final String text;
  const _InputLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }
}
