import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const ActivityTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Color(0xFFE3F2FD),
        child: Icon(Icons.notifications, color: Colors.blue),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: Text(
        time,
        style: const TextStyle(fontSize: 11, color: Colors.grey),
      ),
    );
  }
}
