import 'package:cial/features/employee/data/employee_data.dart';
import 'package:cial/features/employee/ui/widget/detail_item.dart';
import 'package:cial/features/employee/ui/widget/status_badge.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback? onView;
  final VoidCallback? onEdit;

  const EmployeeCard({
    super.key,
    required this.employee,
    this.onView,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              employee.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          StatusBadge(status: employee.status),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "ID: ${employee.id}",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Details
            Row(
              children: [
                Expanded(
                  child: EmployeeDetailItem(
                    label: "Role",
                    value: employee.role,
                  ),
                ),
                Expanded(
                  child: EmployeeDetailItem(
                    label: "Clearance",
                    value: employee.clearance,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            EmployeeDetailItem(
              label: "Aadhaar",
              value: employee.aadhaar,
              mono: true,
            ),

            const SizedBox(height: 12),

            /// Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onView,
                    icon: const Icon(Icons.visibility, size: 18),
                    label: const Text("View"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text("Edit"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
