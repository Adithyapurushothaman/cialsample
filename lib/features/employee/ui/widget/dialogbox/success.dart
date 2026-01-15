import 'package:flutter/material.dart';

Future<void> showSuccessDialog(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOutBack,
              builder: (_, value, __) => Transform.scale(
                scale: value,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 72,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Employee Added",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "Employee successfully added",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
