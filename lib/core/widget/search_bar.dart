import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final IconData prefixIcon;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onFilterTap,
    this.prefixIcon = Icons.search,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(prefixIcon),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          if (onFilterTap != null) ...[
            const SizedBox(width: 8),
            SizedBox(
              height: 48,
              width: 48,
              child: OutlinedButton(
                onPressed: onFilterTap,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Icon(Icons.filter_list),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
