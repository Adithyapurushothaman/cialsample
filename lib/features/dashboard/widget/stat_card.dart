import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final Color bgColor;
  final Color iconBg;
  final IconData icon;
  final String title;
  final String value;
  final String footer;
  final Color footerColor;

  const StatCard({
    required this.bgColor,
    required this.iconBg,
    required this.icon,
    required this.title,
    required this.value,
    required this.footer,
    required this.footerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  footer,
                  style: TextStyle(fontSize: 11, color: footerColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
