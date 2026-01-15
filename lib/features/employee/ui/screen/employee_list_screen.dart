import 'package:cial/core/routing/routes.dart';
import 'package:cial/core/widget/app_bar.dart';
import 'package:cial/features/employee/data/employee_data.dart';
import 'package:cial/features/employee/ui/widget/employee_card.dart';
import 'package:cial/features/employee/ui/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  EmployeeDetailsScreen({super.key});

  final List<Employee> employees = [
    Employee(
      id: "EMP001",
      name: "Rajesh Kumar",
      role: "Labour",
      aadhaar: "****-****-1234",
      clearance: "Pending",
      status: "pending",
    ),
    Employee(
      id: "EMP002",
      name: "Haridas Sharma",
      role: "Labour",
      aadhaar: "****-****-5678",
      clearance: "Valid",
      status: "approved",
    ),
    Employee(
      id: "EMP003",
      name: "John Doe",
      role: "Labour",
      aadhaar: "****-****-9012",
      clearance: "Valid",
      status: "approved",
    ),
    Employee(
      id: "EMP004",
      name: "Michael V",
      role: "Labour",
      aadhaar: "****-****-3456",
      clearance: "Valid",
      status: "sent_back",
    ),
    Employee(
      id: "EMP005",
      name: "Ramesh P",
      role: "Labour",
      aadhaar: "****-****-7890",
      clearance: "Pending",
      status: "pending",
    ),
    Employee(
      id: "EMP006",
      name: "George Joseph",
      role: "Labour",
      aadhaar: "****-****-2345",
      clearance: "Pending",
      status: "forwarded",
    ),
    Employee(
      id: "EMP007",
      name: "Bimal Raj",
      role: "Labour",
      aadhaar: "****-****-6485",
      clearance: "Rejected",
      status: "rejected",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Employees",
        subtitle: 'View and manage labourers',
        roleText: 'Contractor Admin',
        onProfileTap: () {},
        onLogoutTap: () {
          context.goNamed(AppRoute.login);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            EmployeeSearchBar(
              onChanged: (value) {
                // TODO: search logic
              },
              onFilterTap: () {
                // TODO: filter logic
              },
            ),
            const SizedBox(height: 16),
            ListView.separated(
              itemCount: employees.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return EmployeeCard(
                  employee: employees[index],
                  onView: () {},
                  onEdit: () {},
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Showing 7 of 24 employees",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
