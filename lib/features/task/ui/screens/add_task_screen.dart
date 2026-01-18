import 'package:cial/features/employee/ui/widget/dialogbox/success.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();

  final _titleCtrl = TextEditingController();
  final _assignedToCtrl = TextEditingController();
  final _dueDateCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();

  String _priority = 'medium';
  String _status = 'open';

  @override
  void dispose() {
    _titleCtrl.dispose();
    _assignedToCtrl.dispose();
    _dueDateCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      color: const Color(0xFFF5F6FA),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _label("Task Title *"),
              _textField(_titleCtrl, validator: _required),

              _gap(),
              _label("Assigned To *"),
              _textField(_assignedToCtrl, validator: _required),

              _gap(),
              _label("Due Date *"),
              _textField(_dueDateCtrl, hint: "DD / MM / YYYY"),

              _gap(),
              _label("Priority *"),
              DropdownButtonFormField<String>(
                value: _priority,
                items: const [
                  DropdownMenuItem(value: "high", child: Text("High")),
                  DropdownMenuItem(value: "medium", child: Text("Medium")),
                  DropdownMenuItem(value: "low", child: Text("Low")),
                ],
                onChanged: (v) => setState(() => _priority = v!),
              ),

              _gap(),
              _label("Status *"),
              DropdownButtonFormField<String>(
                value: _status,
                items: const [
                  DropdownMenuItem(value: "open", child: Text("Open")),
                  DropdownMenuItem(
                    value: "in_progress",
                    child: Text("In Progress"),
                  ),
                  DropdownMenuItem(
                    value: "completed",
                    child: Text("Completed"),
                  ),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),

              _gap(),
              _label("Description"),
              TextFormField(controller: _descriptionCtrl, maxLines: 3),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text("Create Task"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    showSuccessDialog(
      context,
      title: "Success",
      message: "Task created successfully",
    );
  }

  String? _required(String? v) =>
      v == null || v.isEmpty ? "Required field" : null;

  Widget _gap() => const SizedBox(height: 16);

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
  );

  Widget _textField(
    TextEditingController c, {
    String? hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: c,
      validator: validator,
      decoration: InputDecoration(hintText: hint),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
