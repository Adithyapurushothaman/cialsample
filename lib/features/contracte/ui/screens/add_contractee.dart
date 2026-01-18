import 'package:cial/features/employee/ui/widget/dialogbox/success.dart';
import 'package:flutter/material.dart';

class AddContracteeScreen extends StatefulWidget {
  const AddContracteeScreen({super.key});

  @override
  State<AddContracteeScreen> createState() => _AddContracteeScreenState();
}

class _AddContracteeScreenState extends State<AddContracteeScreen>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _startDateCtrl = TextEditingController();
  final _validTillCtrl = TextEditingController();
  final _projectCountCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  String _status = 'active';

  @override
  void dispose() {
    _nameCtrl.dispose();
    _startDateCtrl.dispose();
    _validTillCtrl.dispose();
    _projectCountCtrl.dispose();
    _addressCtrl.dispose();
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
              _label("Contractee Name *"),
              _textField(_nameCtrl, validator: _required),

              _gap(),
              _label("Contract Start Date *"),
              _textField(_startDateCtrl, hint: "DD / MM / YYYY"),

              _gap(),
              _label("Valid Till *"),
              _textField(_validTillCtrl, hint: "DD / MM / YYYY"),

              _gap(),
              _label("Number of Projects *"),
              _textField(
                _projectCountCtrl,
                keyboard: TextInputType.number,
                validator: _required,
              ),

              _gap(),
              _label("Contract Status *"),
              DropdownButtonFormField<String>(
                value: _status,
                items: const [
                  DropdownMenuItem(value: "active", child: Text("Active")),
                  DropdownMenuItem(value: "pending", child: Text("Pending")),
                  DropdownMenuItem(value: "expired", child: Text("Expired")),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),

              _gap(),
              _label("Address *"),
              TextFormField(
                controller: _addressCtrl,
                maxLines: 3,
                validator: _required,
              ),

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
                      child: const Text("Add Contractee"),
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

    // TODO: connect Riverpod submit logic
    showSuccessDialog(
      context,
      title: "Success",
      message: "Contractee added successfully",
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
    TextInputType keyboard = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: c,
      keyboardType: keyboard,
      validator: validator,
      decoration: InputDecoration(hintText: hint),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
