import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            Lottie.asset(
              'assets/animation/success_animation.json',
              width: 120,
              height: 120,
              repeat: false,
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4EA5E0), // 👈 button color
                  disabledBackgroundColor: const Color(0xFF4EA5E0),
                ),
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
