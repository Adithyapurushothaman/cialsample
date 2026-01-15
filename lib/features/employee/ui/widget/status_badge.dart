import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    late Color bgColor;
    late Color textColor;
    late String label;

    switch (status) {
      case "approved":
        bgColor = Colors.green.shade100;
        textColor = Colors.green.shade700;
        label = "Approved";
        break;
      case "pending":
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange.shade700;
        label = "Pending";
        break;
      case "sent_back":
        bgColor = Colors.cyan.shade100;
        textColor = Colors.cyan.shade700;
        label = "Sent Back";
        break;
      case "forwarded":
        bgColor = Colors.purple.shade100;
        textColor = Colors.purple.shade700;
        label = "Forwarded";
        break;
      case "rejected":
        bgColor = Colors.red.shade100;
        textColor = Colors.red.shade700;
        label = "Rejected";
        break;
      default:
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey.shade700;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, color: textColor)),
    );
  }
}
